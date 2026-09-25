-- ============================================================================
-- UC2 - Postgres CDC: source-side setup (run with psql, NOT in Snowsight)
--
-- Run as the instance's `snowflake_admin` role against the SWTBER26_PG
-- Snowflake Postgres instance:
--
--   export PGHOST=<host from DESCRIBE POSTGRES INSTANCE SWTBER26_PG>
--   export PGPORT=5432
--   export PGDATABASE=postgres
--   export PGUSER=snowflake_admin
--   export PGPASSWORD=<snowflake_admin password captured at CREATE time>
--   export PGSSLMODE=require
--   psql -v ON_ERROR_STOP=1 -f swt26_ber_uc2_postgres_setup.sql
--
-- Creates, all in the default `public` schema so every attendee replicates the
-- same shared source:
--   1. sensors            - small dimension table
--   2. sensor_readings    - fact table, BIGSERIAL primary key
--   3. seed data          - ~20k historical readings
--   4. swtber26_cdc       - the replication user the connectors authenticate as
--   5. swtber26_cdc_pub   - the publication the connectors read
--   6. generate_readings()+ pg_cron job - continuous 5 rows every 5 seconds
--
-- Idempotent: safe to re-run.
--
-- WHY A PRIMARY KEY MATTERS: the Openflow Postgres CDC connector replicates
-- UPDATE and DELETE only for tables with a usable replication identity. With
-- no primary key, unique index, or REPLICA IDENTITY FULL, a table is
-- INSERT-ONLY. Both tables below have primary keys.
-- ============================================================================

-- ---------------------------------------------------------------------------
-- 0. Extensions
-- ---------------------------------------------------------------------------
-- pg_cron drives the continuous data generator in section 6.
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- ---------------------------------------------------------------------------
-- 1. Dimension table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.sensors (
    sensor_id    INT         PRIMARY KEY,
    sensor_name  TEXT        NOT NULL UNIQUE,
    sensor_type  TEXT        NOT NULL,
    location     TEXT        NOT NULL,
    unit         TEXT        NOT NULL,
    installed_on DATE        NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO public.sensors (sensor_id, sensor_name, sensor_type, location, unit) VALUES
    (1,  'HVAC-Floor1',     'temperature', 'Building-A', 'C'),
    (2,  'HVAC-Floor2',     'temperature', 'Building-A', 'C'),
    (3,  'HVAC-Floor3',     'temperature', 'Building-B', 'C'),
    (4,  'Freezer-Main',    'temperature', 'Building-B', 'C'),
    (5,  'ServerRoom-A',    'temperature', 'Building-C', 'C'),
    (6,  'MainPanel-A',     'power',       'Building-A', 'kW'),
    (7,  'MainPanel-B',     'power',       'Building-B', 'kW'),
    (8,  'DataCenter-UPS',  'power',       'Building-C', 'kW'),
    (9,  'HVAC-Compressor', 'power',       'Building-A', 'kW'),
    (10, 'Elevator-Motor',  'power',       'Building-B', 'kW')
ON CONFLICT (sensor_id) DO NOTHING;

-- ---------------------------------------------------------------------------
-- 2. Fact table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.sensor_readings (
    reading_id  BIGSERIAL     PRIMARY KEY,
    sensor_id   INT           NOT NULL REFERENCES public.sensors (sensor_id),
    sensor_name TEXT          NOT NULL,
    sensor_type TEXT          NOT NULL,
    reading_ts  TIMESTAMP     NOT NULL DEFAULT now(),
    value       NUMERIC(10,2) NOT NULL,
    unit        TEXT          NOT NULL,
    created_at  TIMESTAMP     NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_readings_ts     ON public.sensor_readings (reading_ts);
CREATE INDEX IF NOT EXISTS idx_readings_sensor ON public.sensor_readings (sensor_id, reading_ts);

-- ---------------------------------------------------------------------------
-- 3. Seed data - ~20k historical readings (10 sensors x 2000 readings),
--    backdated at 5-minute intervals. Only seeds if the table is empty, so
--    re-running does not pile up duplicates.
-- ---------------------------------------------------------------------------
INSERT INTO public.sensor_readings (sensor_id, sensor_name, sensor_type, reading_ts, value, unit)
SELECT s.sensor_id,
       s.sensor_name,
       s.sensor_type,
       now() - (n * INTERVAL '5 minutes'),
       CASE s.sensor_type
           WHEN 'temperature' THEN (18 + random() * 9)::NUMERIC(10,2)
           ELSE                    (100 + random() * 400)::NUMERIC(10,2)
       END,
       s.unit
FROM public.sensors s
CROSS JOIN generate_series(1, 2000) AS n
WHERE NOT EXISTS (SELECT 1 FROM public.sensor_readings);

-- ---------------------------------------------------------------------------
-- 4. Replication user
--
--    ONE shared CDC user for all attendees. Snowflake Postgres caps an
--    instance at 64 roles, so a role per attendee does not scale to 200.
--    Functionally this is fine: each connector still gets its OWN replication
--    slot, so the connectors remain independent.
--
--    The REPLICATION attribute is required by the connector. On Snowflake
--    Postgres, `snowflake_admin` is not a superuser but it does hold
--    REPLICATION and can grant it onward - verified.
--
--    CHANGE THIS PASSWORD and store the same value in the Snowflake secret
--    OPENFLOW_SHARED.PG.SWTBER26_PG_CDC_SECRET.
-- ---------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'swtber26_cdc') THEN
        CREATE ROLE swtber26_cdc WITH LOGIN REPLICATION PASSWORD 'ChangeMe_SwtBer26!';
    ELSE
        ALTER ROLE swtber26_cdc WITH LOGIN REPLICATION PASSWORD 'ChangeMe_SwtBer26!';
    END IF;
END
$$;

-- The connector needs to SELECT every replicated table for the initial
-- snapshot, plus schema visibility.
GRANT USAGE ON SCHEMA public TO swtber26_cdc;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO swtber26_cdc;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO swtber26_cdc;

-- ---------------------------------------------------------------------------
-- 5. Publication
--
--    Only tables in the publication are replicated - a table missing from it
--    is skipped SILENTLY, even if the connector is configured to replicate it.
--
--    publish_via_partition_root = true is needed for correct replication of
--    partitioned tables (harmless here, correct if the lab grows).
--
--    All attendees share this one publication. A publication is read-only
--    metadata; the per-consumer object is the replication slot, and each
--    connector creates its own. Verified working with concurrent connectors.
-- ---------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_publication WHERE pubname = 'swtber26_cdc_pub') THEN
        CREATE PUBLICATION swtber26_cdc_pub WITH (publish_via_partition_root = true);
    END IF;
END
$$;

ALTER PUBLICATION swtber26_cdc_pub SET TABLE public.sensors, public.sensor_readings;

-- ---------------------------------------------------------------------------
-- 6. Continuous data generator - 5 new rows every 5 seconds
--
--    pg_cron's finest granularity is ONE MINUTE, so a plain cron entry cannot
--    fire every 5 seconds. Instead the job runs once a minute and the
--    procedure loops 12 times internally, inserting 5 rows then sleeping 5
--    seconds - giving a genuine 5-rows-per-5-seconds trickle rather than one
--    burst per minute.
--
--    TRADE-OFF: the procedure holds a connection for the full minute, so it
--    permanently consumes one of `max_connections`. With overlapping runs
--    guarded against below, that is exactly one connection.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.generate_readings(
    batches     INT DEFAULT 12,
    rows_each   INT DEFAULT 5,
    sleep_secs  NUMERIC DEFAULT 5
)
LANGUAGE plpgsql
AS $$
DECLARE
    b INT;
BEGIN
    FOR b IN 1 .. batches LOOP
        INSERT INTO public.sensor_readings (sensor_id, sensor_name, sensor_type, reading_ts, value, unit)
        SELECT s.sensor_id,
               s.sensor_name,
               s.sensor_type,
               clock_timestamp(),
               CASE s.sensor_type
                   WHEN 'temperature' THEN (18 + random() * 9)::NUMERIC(10,2)
                   ELSE                    (100 + random() * 400)::NUMERIC(10,2)
               END,
               s.unit
        FROM public.sensors s
        ORDER BY random()
        LIMIT rows_each;

        -- COMMIT makes each batch individually visible to the CDC stream,
        -- so attendees see a steady trickle instead of one commit per minute.
        COMMIT;

        -- Skip the final sleep so the run finishes inside its minute and
        -- never overlaps the next scheduled invocation.
        IF b < batches THEN
            PERFORM pg_sleep(sleep_secs);
        END IF;
    END LOOP;
END
$$;

-- Schedule it. Unschedule any previous copy first so re-running this script
-- does not create duplicate jobs (which would double the insert rate).
DO $$
BEGIN
    PERFORM cron.unschedule('swtber26_generate_readings')
    WHERE EXISTS (SELECT 1 FROM cron.job WHERE jobname = 'swtber26_generate_readings');
END
$$;

SELECT cron.schedule(
    'swtber26_generate_readings',
    '* * * * *',
    $$CALL public.generate_readings()$$
);

-- ---------------------------------------------------------------------------
-- 7. Verification
-- ---------------------------------------------------------------------------
SELECT 'wal_level' AS setting, setting AS value FROM pg_settings WHERE name = 'wal_level'
UNION ALL SELECT 'max_replication_slots', setting FROM pg_settings WHERE name = 'max_replication_slots'
UNION ALL SELECT 'max_wal_senders',       setting FROM pg_settings WHERE name = 'max_wal_senders';

SELECT rolname, rolreplication, rolcanlogin FROM pg_roles WHERE rolname = 'swtber26_cdc';

SELECT pubname, schemaname, tablename FROM pg_publication_tables WHERE pubname = 'swtber26_cdc_pub';

SELECT jobid, jobname, schedule, active FROM cron.job WHERE jobname = 'swtber26_generate_readings';

SELECT count(*) AS seeded_readings FROM public.sensor_readings;

-- Run this twice about 60 seconds apart - the count should climb by ~60.
SELECT count(*) AS readings_now, max(reading_ts) AS newest FROM public.sensor_readings;

-- ---------------------------------------------------------------------------
-- 8. Teardown (commented - run deliberately)
--
--    Dropping a connector in Snowflake does NOT drop its replication slot,
--    and an orphaned slot pins WAL forever, eventually exhausting
--    max_replication_slots and filling storage. Always drop inactive
--    connector slots after the lab.
-- ---------------------------------------------------------------------------
-- SELECT cron.unschedule('swtber26_generate_readings');
--
-- -- Inspect before dropping: only ever drop INACTIVE slots.
-- SELECT slot_name, active FROM pg_replication_slots WHERE slot_name LIKE 'snowflake_connector_%';
-- SELECT pg_drop_replication_slot(slot_name)
-- FROM pg_replication_slots
-- WHERE slot_name LIKE 'snowflake_connector_%' AND NOT active;
--
-- DROP PUBLICATION IF EXISTS swtber26_cdc_pub;
-- DROP PROCEDURE IF EXISTS public.generate_readings(INT, INT, NUMERIC);
-- DROP TABLE IF EXISTS public.sensor_readings;
-- DROP TABLE IF EXISTS public.sensors;
-- DROP ROLE IF EXISTS swtber26_cdc;
