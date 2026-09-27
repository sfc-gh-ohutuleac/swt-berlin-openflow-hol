# Reset / Re-run / Scale-Up Procedure

## Re-running provisioning safely
All four templates are idempotent (`CREATE ... IF NOT EXISTS` throughout). To add attendees:
1. Copy `users.yml.example` to `users.yml` and edit (keep `id` lowercase, `password` set). `users.yml` is gitignored.
2. Re-run: `python3 render_provisioning.py` - this renders all four files
   (`provision_users.sql`, `provision_runtimes.sql`, and both deprovision counterparts).
3. Review `rendered/provision_users.sql`, then execute it.

Existing users/roles/DBs are left untouched - passwords do NOT change on re-run, since
`CREATE USER IF NOT EXISTS` skips entirely if the user already exists. New entries get created;
nothing is deleted.

## Current live state (2026-09-23)
- `users.yml` (copied from `users.yml.example`) defines **200** attendees.
- **Only user01..user15 are provisioned** (databases, roles, users).
- **Only USER01 and USER02 have runtimes.** `rendered/provision_runtimes.sql` contains all 200
  blocks, deliberately unexecuted - each block is self-contained, so run only the range you need.

## Creating more runtimes
Each block in `rendered/provision_runtimes.sql` is independent. To add runtimes for, say,
user03..user10, run just those blocks, then the matching wait calls.

Practical notes:
- Provisioning is **asynchronous and takes 3-5 minutes each**. Run in batches (5, then 25) and
  let `SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS` confirm each batch.
- If a wait call times out, the runtime is still being created. **Re-run the wait. Do not
  re-issue `CREATE`.**
- `MIN_NODES = MAX_NODES = 1` is mandatory - the Postgres CDC connector does not support
  multi-node runtimes. Scale by adding runtimes, not nodes.
- Runtimes are created **as the attendee's own role**, so the attendee owns them and can create
  more themselves after the lab.

### Cost and quota - read before scaling
- **Every runtime is standing compute.** 200 always-on SMALL runtimes is a large bill. Provision
  only what the event needs, and tear down promptly afterwards.
- **Check the SPCS node quota before going past ~40-50 concurrent runtimes.** Each runtime is one
  SMALL node. The default quota is 50 nodes per node-size and 500 total per account, so ~100+
  attendees will hit the per-size limit. Request an increase from your account team well before
  the event - this template cannot provision quota for you.
- An account supports at most **3 Openflow deployments** (Gen1 and Gen2 share the limit), so
  scaling means more runtimes on the existing deployment, not more deployments.

## Tearing down between test runs

Order matters - runtimes and connectors must go before the roles that own them.

```
1. python3 render_provisioning.py --only deprovision
2. Review and run rendered/deprovision_runtimes.sql    # suspend -> terminate cascade -> drop
3. Clean up Postgres replication slots (see below)     # REQUIRED
4. Review and run rendered/deprovision_users.sql       # drops users, roles, databases
```

`deprovision_runtimes.sql` uses `TERMINATE CASCADE`, which terminates every connector inside the
runtime first. Plain `TERMINATE` **fails** if the runtime still contains connectors, and
attendees will normally have created one.

### Replication slots MUST be cleaned up manually
Dropping an Openflow connector does **not** drop its PostgreSQL replication slot. An orphaned
slot pins WAL forever and will eventually exhaust `max_replication_slots` and fill the instance's
storage.

A slot is only released after the **full** sequence - `STOP` -> `TERMINATE` -> `DROP`.
`TERMINATE FORCE` alone is not sufficient: the flow keeps running inside the runtime and
immediately re-acquires the slot under a new PID. A connector stuck in `UPDATE_FAILED` must be
`STOP`ped before it can be terminated.

Then, on the Postgres side:
```sql
-- Inspect first. Only ever drop INACTIVE slots.
SELECT slot_name, active FROM pg_replication_slots WHERE slot_name LIKE 'snowflake_connector_%';

SELECT pg_drop_replication_slot(slot_name)
FROM pg_replication_slots
WHERE slot_name LIKE 'snowflake_connector_%' AND NOT active;
```

The shared layer (`OPENFLOW_ADMIN`, `OPENFLOW_SHARED`, the deployment, `SWTBER26_LAB_EAI`, the
Postgres instance, the account event table) is never touched by any template - it is managed only
via `admin_setup.sql`.

## Resetting the UC2 Postgres source
The source is shared, so resetting it affects every attendee. Between sessions you normally only
need to trim the fact table:

```sql
-- via psql as snowflake_admin
SELECT cron.unschedule('swtber26_generate_readings');   -- pause the generator
TRUNCATE public.sensor_readings;
-- re-seed and re-schedule by re-running section 3 and 6 of
-- ../0_setup/postgres_setup.sql
```

Note that truncating the source does **not** remove already-replicated rows from attendee
databases. For a genuinely clean run, drop the attendee destination tables too, or give the new
session fresh attendee databases.

## Shared privileges live in ONE place
All privileges common to every attendee (Gen2 deployment `USAGE`, EAI `USAGE`, warehouse access,
`OPENFLOW_SHARED` DB/schema `USAGE`, `READ` on the Postgres credentials secret and the git repo)
are granted once to `SWTBER26_ATTENDEE_RL` in `admin_setup.sql`. Per-user roles only ever get
`GRANT ROLE SWTBER26_ATTENDEE_RL TO ROLE SWTBER26_<user>_RL` - never a direct grant.

To add or remove a shared privilege later, edit the `SWTBER26_ATTENDEE_RL` block in
`admin_setup.sql` once; it propagates to every attendee immediately.

The two exceptions, granted per-user because they are schema-scoped, are
`CREATE OPENFLOW RUNTIME` and `CREATE OPENFLOW CONNECTOR` on each attendee's own `PUBLIC` schema.

## Gotchas that will cost you time

- **Never `CREATE OR REPLACE` a network rule or EAI.** Replacing one silently detaches it from
  every runtime that references it. Use `CREATE ... IF NOT EXISTS` and `ALTER` to modify.
- **`POSTGRES_SETTINGS` must be strict JSON with colons.** The Snowflake docs show a
  `'{"postgres:key" = "value"}'` form with equals signs; that fails with *Invalid JSON format in
  settings string*.
- **Connector definitions evolve.** A `config.json` that worked last week can be rejected with
  *'<Property>' is required* after a connector update. Regenerate the template from a freshly
  created connector rather than hand-maintaining it.
- **Real connector errors only appear in the event table**, not in `SHOW OPENFLOW CONNECTORS`.
  Query it with `TRY_PARSE_JSON` - some rows are not valid JSON and `PARSE_JSON` errors the whole
  query out.
- **The Openflow runtime egress range (`153.45.52.0/24` here) is not documented by Snowflake.**
  If connectors suddenly fail with *The connection attempt failed* while `pg_stat_activity` shows
  no connection attempts, the Postgres ingress allowlist is the cause. Rediscover the range by
  temporarily setting the ingress rule to `0.0.0.0/0`, reading
  `pg_stat_activity.client_addr`, then narrowing again immediately.

## Known open items
- Guided-setup screenshots in the UC2 runbook are placeholders.
- Manual UI smoke test (`smoke_test_checklist.md`, Part B) must be run by a human before the
  event.
- UC3 (Kafka/Redpanda) network rule is a commented stub in `admin_setup.sql` - fill in the real
  broker hostname once available, then add it to the EAI with the additive `ALTER`.
- Attendee databases start empty by design; UC2 destination tables are created by the connector.

## Rotating credentials

**Postgres CDC password** - must be changed in both places, or the connector breaks:
```sql
-- 1. Postgres side, via psql as snowflake_admin
ALTER ROLE swtber26_cdc WITH PASSWORD '<new_password>';

-- 2. Snowflake side
USE ROLE OPENFLOW_ADMIN;
ALTER SECRET OPENFLOW_SHARED.PG.SWTBER26_PG_CDC_SECRET SET SECRET_STRING = '<new_password>';
```
Running connectors pick the secret up on restart.

**Snowflake Postgres admin credentials** - shown only once at instance creation and
unrecoverable. If lost:
```sql
ALTER POSTGRES INSTANCE SWTBER26_PG RESET ACCESS FOR 'snowflake_admin';
```

**Git repo credentials**:
```sql
USE ROLE OPENFLOW_ADMIN;
ALTER SECRET OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS SET
  USERNAME = '<new_username>'
  PASSWORD = '<new_pat>';
ALTER GIT REPOSITORY OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO FETCH;
```
