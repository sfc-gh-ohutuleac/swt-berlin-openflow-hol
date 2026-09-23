# Usecase 2 - Ingest data from a Postgres database (CDC)

In this lab we use the **Openflow Connector for PostgreSQL** and Change Data
Capture to continuously replicate a live Postgres database into Snowflake.

A background job on the source inserts **5 new rows every 5 seconds**, so once
your connector is running you see a genuinely live stream - not a one-off load.

## Start here

**[0_swt26_ber_uc2_postgres_cdc_runbook.md](0_swt26_ber_uc2_postgres_cdc_runbook.md)**
- the attendee runbook. Covers both ways to configure the connector:
  - **Option A** - guided setup in Snowsight
  - **Option B** - fully declarative via SQL

## Files

| File | What it is | Who runs it |
|---|---|---|
| `0_swt26_ber_uc2_postgres_cdc_runbook.md` | Step-by-step attendee guide | Attendees |
| `config.template.json` | Connector `config.json` with 3 placeholders (`__PG_HOST__`, `__DRIVER_JAR__`, `__DEST_DB__`) | Attendees (Option B) |
| `swt26_ber_uc2_postgres_setup.sql` | Source-side setup: tables, seed data, CDC user, publication, generator | Lab admin, once, via `psql` |
| `rendered/user<N>/config.json` | Per-attendee rendered configs | Generated |

## Architecture

```
PostgreSQL (one shared Snowflake Postgres instance)
  public.sensors           - 10 rows, dimension
  public.sensor_readings   - ~20k rows + 5 every 5s, BIGSERIAL primary key
  publication swtber27_cdc_pub covers both tables
  login role swtber27_cdc (REPLICATION + SELECT)
        |
        |  every attendee's connector reads the SAME publication,
        |  but each one creates its OWN replication slot
        v
Openflow: SWTBER27_USER<N>_RUNTIME  ->  connector UC2_PG_CDC
        v
Snowflake: SWTBER27_USER<N>.PUBLIC.{SENSORS, SENSOR_READINGS}
```

One shared source, many independent consumers. Verified with two attendees
replicating concurrently, each with its own slot, both receiving live changes.

## Everything lives in OPENFLOW_SHARED

Attendees need nothing outside the shared `OPENFLOW_SHARED` database, and access
comes entirely from the shared technical role `SWTBER27_ATTENDEE_RL`, which every
per-user role inherits. No per-attendee grants, no GitHub access, no local tools.

| Resource | Object | Purpose |
|---|---|---|
| Connection details | `OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO` (view) | host, port, user, publication, JDBC URL - no password |
| Postgres password | `OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET` (secret) | referenced by the connector; attendees never read the value |
| Driver + template + docs | `OPENFLOW_SHARED.PG.UC2_FILES` (stage) | `postgresql-42.7.4.jar`, `config.template.json`, runbook, source setup SQL |
| Config generator | `OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('<db>')` (function) | emits a complete `config.json` - no hand-editing |
| Telemetry | `OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS` (event table) | the only place real connector errors appear |

UC1's equivalents are on `OPENFLOW_SHARED.INFRA.UC1_FILES`.

## The SQL path needs no local tooling

`PUT`/`GET` against a connector's versioned stage requires a local client -
Snowsight cannot do it. But **`COPY FILES` can**, which makes the whole SQL path
browser-only:

1. `UC2_CONFIG_FOR('<your_db>')` generates the config,
2. `COPY INTO @your_stage/config.json FROM (SELECT ...)` writes it to a stage,
3. `COPY FILES` moves it and the shared driver onto the connector stage.

Verified end to end: USER02's connector was reconfigured and restarted this way
with no local files involved.

## Things worth knowing

- **The connector does not ship with the PostgreSQL JDBC driver.** You supply it
  as a connector *asset*, staged at
  `@OPENFLOW_SHARED.PG.UC2_FILES/postgresql-42.7.4.jar`.
- **The connector requires a single-node runtime** (`MIN_NODES = MAX_NODES = 1`).
  Scale by adding runtimes, not nodes.
- **Only tables in the publication replicate.** A table missing from it is
  skipped silently, with no error.
- **Primary keys decide whether UPDATE/DELETE replicate.** Without a primary
  key, unique index, or `REPLICA IDENTITY FULL`, a table is insert-only.
- **Dropping a connector does not drop its replication slot.** Orphaned slots
  pin WAL forever. See section 8 of `swt26_ber_uc2_postgres_setup.sql` for
  cleanup. A slot is only released after a full
  `STOP` -> `TERMINATE` -> `DROP`; `TERMINATE FORCE` alone is not enough.
- **Real errors only appear in the event table**, not in
  `SHOW OPENFLOW CONNECTORS`. Query it with `TRY_PARSE_JSON`, not `PARSE_JSON`.
- **After any `PUT` to a lab stage, run `ALTER STAGE ... REFRESH`**, or the
  Snowsight stage browser shows it as empty.
- **Connector definitions evolve.** If a start fails with
  *'<Property>' is required*, regenerate the config from a freshly created
  connector and update `UC2_CONFIG_JSON` in `admin_setup.sql`.

## Admin setup order

1. `../0_setup/admin_setup.sql` - shared layer, Postgres instance, EAI, secret
2. `swt26_ber_uc2_postgres_setup.sql` - source tables, CDC user, publication, generator (via `psql`)
3. `../0_setup/rendered/provision_users.sql` - attendee databases, roles, users
4. `../0_setup/rendered/provision_runtimes.sql` - one runtime per attendee
