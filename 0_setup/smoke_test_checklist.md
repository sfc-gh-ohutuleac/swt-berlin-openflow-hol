# Smoke Test Checklist

## Part A - Shared layer (verify programmatically)

### Openflow Gen2
- [ ] `SHOW OPENFLOW DEPLOYMENTS` works and `MY_SNOWFLAKE_DEPLOYMENT` is `ACTIVE`.
      (Gen2 SQL is available in this account - an earlier assessment said otherwise and was wrong.)
- [ ] `SHOW OPENFLOW CONNECTOR DEFINITIONS` returns `OPENFLOW_POSTGRES_CDC`.
- [ ] `SWTBER26_ATTENDEE_RL` holds `USAGE ON OPENFLOW DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT`
      (Gen2 object grant, not the legacy integration grant).
- [ ] Account-level event table active (`SHOW PARAMETERS LIKE 'EVENT_TABLE' IN ACCOUNT`).
- [ ] `SWTBER26_LAB_EAI` references BOTH network rules: `dummyjson.com:443` (UC1) and the
      Postgres host on `:5432` (UC2).

### Users / roles (100 provisioned; attendees defined in users.yml, copied from users.yml.example)
- [ ] All 100 `SWTBER26_USER<N>` databases exist and are empty.
- [ ] All 100 `SWTBER26_USER<N>_RL` roles hold `OWNERSHIP` on their own DB + PUBLIC schema,
      `GRANT ROLE SWTBER26_ATTENDEE_RL`, and schema-level `CREATE OPENFLOW RUNTIME` /
      `CREATE OPENFLOW CONNECTOR`.
- [ ] Every attendee role is granted to `SYSADMIN`, so the lab admin can assume any of them
      without the attendee's password.
- [ ] Users created with correct `DEFAULT_ROLE`, `DEFAULT_SECONDARY_ROLES=('ALL')`, and
      **`MUST_CHANGE_PASSWORD=FALSE`** - attendees keep the password from `users.yml`.
- [ ] If provisioning beyond user15: re-render and run `rendered/provision_users.sql`, then
      re-verify the two items above for the new range.

### UC2 Postgres source
- [ ] `SHOW POSTGRES INSTANCES LIKE 'SWTBER26_PG'` shows state `READY`.
- [ ] `wal_level = logical`; `max_replication_slots` and `max_wal_senders` raised to 250.
- [ ] `swtber26_cdc` role exists with `rolreplication = t` and `rolcanlogin = t`.
- [ ] Publication `swtber26_cdc_pub` covers `public.sensors` and `public.sensor_readings`.
- [ ] `sensor_readings` has a BIGSERIAL primary key (required for UPDATE/DELETE replication).
- [ ] pg_cron job `swtber26_generate_readings` is active and the row count climbs ~60/minute.
- [ ] Attendee roles can read `OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO` and
      `LS @OPENFLOW_SHARED.PG.DRIVERS` (verified as `SWTBER26_USER01_RL`).
- [ ] Ingress network rule allows both the admin client IP and the Openflow runtime egress
      range `153.45.52.0/24`.

### UC2 end-to-end (verified with two concurrent attendees)
- [ ] `SWTBER26_USER01_RUNTIME` and `SWTBER26_USER02_RUNTIME` both `ACTIVE`, each owned by its
      own attendee role.
- [ ] Both `UC2_PG_CDC` connectors reached `RUNNING` **simultaneously** against the same
      publication.
- [ ] Each connector created its own distinct replication slot
      (`snowflake_connector_<random>`), confirming multi-tenant isolation on one shared source.
- [ ] Both destinations received the full snapshot (10 sensors, ~20k readings) and then live
      CDC (21,610 -> 21,745 rows in 100 seconds, in lockstep).
- [ ] Orphaned replication slots cleaned up after connector teardown; exactly the two attendee
      slots remain.

## Part B - UI self-service flow (requires a real human login - do before the event)

Cannot be automated. Do a full dry run as `SWTBER26_USER01` (or hand to a colleague).

### UC1
- [ ] Log in as `SWTBER26_USER01`; confirm no password-change prompt and active role is
      `SWTBER26_USER01_RL`.
- [ ] Ingestion » Openflow shows the deployment and the pre-created runtime.
- [ ] Create your own destination table in `SWTBER26_USER01.PUBLIC`.
- [ ] Build or import the UC1 flow per `../1_rest_api/0_swt26_ber_uc1_restapi_runbook.md`.
- [ ] Run once; confirm no bulletins (especially no `UnknownHostException`).
- [ ] `SELECT COUNT(*) FROM SWTBER26_USER01.PUBLIC.<your_table>;` -> 30.

### UC2 (guided-wizard path - the SQL path is already proven)
- [ ] Walk the **Option A** wizard in `../2_postgres/README.md` from
      scratch as `SWTBER26_USER03` (a user with no runtime yet - also validates self-service
      runtime creation).
- [ ] Confirm the wizard accepts the staged JDBC driver jar and the shared secret.
- [ ] Confirm the connector reaches `RUNNING` and rows land in `SWTBER26_USER03.PUBLIC`.
- [ ] Confirm the row count keeps climbing (live CDC, not just the snapshot).
- [ ] Capture screenshots for the runbook's `<!-- SCREENSHOTS -->` placeholder.

### Isolation
- [ ] As `SWTBER26_USER02`, confirm you can **not** see `SWTBER26_USER01`'s database, role,
      runtime, or connector.
- [ ] Query `OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS` as an attendee role and confirm rows
      appear (validates event table access via the inherited role).
- [ ] `LS @OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO/branches/main/1_rest_api;` as an attendee
      role (validates git READ without exposing the credentials secret).

If any step in Part B fails, check the relevant runbook's Troubleshooting section first - the
UC2 runbook covers every failure mode encountered during the build.
