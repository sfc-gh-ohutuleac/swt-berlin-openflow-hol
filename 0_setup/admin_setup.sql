-- ============================================================================
-- Openflow Multi-Tenant HoL - Shared Admin Layer (Openflow Gen2)
-- Run ONCE, by ACCOUNTADMIN. Idempotent (CREATE ... IF NOT EXISTS throughout).
--
-- This script targets the Openflow **Gen2** API, where deployments, runtimes
-- and connectors are first-class Snowflake objects managed with DDL
-- (CREATE OPENFLOW DEPLOYMENT / RUNTIME / CONNECTOR) rather than the legacy
-- Gen1 "runtime integration" objects.
--
-- Creates:
--   1. OPENFLOW_ADMIN role, owning all shared infra
--   2. OPENFLOW_SHARED database (INFRA + GIT + PG schemas)
--   3. Account-wide default event table (+ PUBLIC read access)
--   4. Gen2 Openflow deployment
--   5. Shared network rules + EAI (UC1 REST API, UC2 Postgres CDC)
--   6. Shared git repository object for the HoL repo
--   7. UC2 Snowflake Postgres instance + ingress network policy
--   8. SWTBER27_ATTENDEE_RL: the ONE role holding every privilege common to
--      all attendees. Per-user roles (created in provision_users.sql) hold
--      ONLY their own database ownership and inherit everything else via
--      GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_<user>_RL.
--
-- Order matters: section 7 must run before section 5's Postgres network rule
-- can be given a real hostname. Both are included here in dependency order,
-- with the hostname parameterised via a session variable.
-- ============================================================================

USE ROLE ACCOUNTADMIN;

-- ---------------------------------------------------------------------------
-- 1. Admin role
-- ---------------------------------------------------------------------------
CREATE ROLE IF NOT EXISTS OPENFLOW_ADMIN
  COMMENT = 'Owns shared Openflow lab infrastructure (deployment, EAI, network rules, event table, git repo, Postgres). [openflow]';

GRANT ROLE OPENFLOW_ADMIN TO USER TSTOLPE;
GRANT ROLE OPENFLOW_ADMIN TO ROLE SYSADMIN;

GRANT CREATE INTEGRATION ON ACCOUNT TO ROLE OPENFLOW_ADMIN;
GRANT CREATE DATABASE    ON ACCOUNT TO ROLE OPENFLOW_ADMIN;

-- Gen2 deployment management. CREATE COMPUTE POOL is required in addition to
-- CREATE OPENFLOW DEPLOYMENT whenever DEPLOYMENT_TYPE = SNOWFLAKE.
GRANT CREATE OPENFLOW DEPLOYMENT ON ACCOUNT TO ROLE OPENFLOW_ADMIN;
GRANT CREATE COMPUTE POOL        ON ACCOUNT TO ROLE OPENFLOW_ADMIN;

-- The runtime's EXECUTE_AS_ROLE must be able to see a warehouse, or the
-- Postgres CDC connector fails validation with the misleading message
-- "'Snowflake Warehouse' validated against '<wh>' is invalid because Value is
-- not one of the allowable values". That is a MISSING GRANT, not a bad value.
GRANT USAGE, OPERATE ON WAREHOUSE COMPUTE_WH TO ROLE OPENFLOW_ADMIN;

-- ---------------------------------------------------------------------------
-- 2. Shared database / schemas
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

CREATE DATABASE IF NOT EXISTS OPENFLOW_SHARED
  COMMENT = 'Shared Openflow lab infrastructure: event table, network rules, git repo, Postgres connection info. [openflow]';

CREATE SCHEMA IF NOT EXISTS OPENFLOW_SHARED.INFRA
  COMMENT = 'Event table + UC1 network rule for the Openflow lab. [openflow]';

CREATE SCHEMA IF NOT EXISTS OPENFLOW_SHARED.GIT
  COMMENT = 'Git repository integration for the HoL repo. [openflow]';

CREATE SCHEMA IF NOT EXISTS OPENFLOW_SHARED.PG
  COMMENT = 'UC2 Snowflake Postgres source: network rules, credentials secret, connection info. [openflow]';

-- ---------------------------------------------------------------------------
-- 3. Event table - set as the ACCOUNT-WIDE default so every Openflow runtime
--    (current and future, any attendee) logs there automatically with zero
--    per-deployment / per-runtime wiring.
--
--    This is also the ONLY place real connector errors are visible:
--    SHOW OPENFLOW CONNECTORS reports just START_FAILED / UPDATE_FAILED.
--    See the UC2 runbook's troubleshooting section for the query to use
--    (note: use TRY_PARSE_JSON, not PARSE_JSON - some rows are not JSON).
-- ---------------------------------------------------------------------------
CREATE EVENT TABLE IF NOT EXISTS OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS
  COMMENT = 'Account-wide default event table; Openflow runtime + connector telemetry lands here automatically. [openflow]';

USE ROLE ACCOUNTADMIN;
ALTER ACCOUNT SET EVENT_TABLE = OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS;

-- Grant once, to PUBLIC, so every current and future attendee role can query
-- it automatically - no per-user grant needed in the provisioning template.
GRANT SELECT ON TABLE OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS TO ROLE PUBLIC;

-- ---------------------------------------------------------------------------
-- 4. Gen2 Openflow deployment
--
--    An account supports at most THREE Openflow deployments (Gen1 and Gen2
--    share the limit), and creation takes 5-10 minutes - so this script
--    reuses the existing deployment rather than creating another one.
--
--    On a fresh account, uncomment the CREATE below and set
--    $lab_deployment to the new name.
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

SET lab_deployment = 'MY_SNOWFLAKE_DEPLOYMENT';

-- CREATE OPENFLOW DEPLOYMENT IF NOT EXISTS SWTBER27_LAB_DEPLOYMENT
--   DEPLOYMENT_TYPE = SNOWFLAKE
--   DISPLAY_NAME = 'SWT Berlin HoL Deployment'
--   COMMENT = 'Shared Gen2 deployment for the SWT Berlin Openflow HoL. [openflow]';
--
-- SELECT SYSTEM$WAIT_FOR_OPENFLOW_DEPLOYMENT_STATUS(900, 'ACTIVE', 'SWTBER27_LAB_DEPLOYMENT');

SHOW OPENFLOW DEPLOYMENTS;

-- ---------------------------------------------------------------------------
-- 5. UC2 - Snowflake Postgres instance (the CDC source)
--
--    Done BEFORE the network rules, because the egress rule in section 6
--    needs the instance hostname.
--
--    IMPORTANT: CREATE POSTGRES INSTANCE returns the snowflake_admin and
--    application passwords exactly ONCE, in the access_roles column. They
--    cannot be retrieved later - only rotated with
--      ALTER POSTGRES INSTANCE <name> RESET ACCESS FOR 'snowflake_admin';
--    Capture them immediately.
-- ---------------------------------------------------------------------------
USE ROLE ACCOUNTADMIN;

-- Ingress allowlist. POSTGRES_INGRESS rules are IPV4-only, so a hostname
-- cannot be allow-listed - every client IP must be enumerated.
--
-- Two entries are required:
--   a) the lab admin's own client IP, for psql access (SELECT CURRENT_IP_ADDRESS())
--   b) the Openflow runtime egress range, so connectors can reach Postgres
--
-- (b) is NOT documented by Snowflake. In this account (AWS_EU_CENTRAL_1) the
-- Openflow Snowflake-deployment runtimes egress from 153.45.52.0/24, found
-- empirically. If connectors fail with
--   PSQLException: The connection attempt failed.
-- while pg_stat_activity shows ZERO connection attempts, the ingress policy is
-- rejecting at the network edge. Rediscover the range by temporarily setting
-- VALUE_LIST = ('0.0.0.0/0'), reading pg_stat_activity.client_addr, then
-- narrowing again immediately.
CREATE OR ALTER NETWORK RULE OPENFLOW_SHARED.PG.SWTBER27_PG_INGRESS_RULE
  TYPE = IPV4
  MODE = POSTGRES_INGRESS
  VALUE_LIST = ('95.19.97.78/32', '153.45.52.0/24')
  COMMENT = 'Admin client IP + Openflow runtime egress range. [openflow]';

CREATE OR ALTER NETWORK POLICY SWTBER27_PG_NETWORK_POLICY
  ALLOWED_NETWORK_RULE_LIST = ('OPENFLOW_SHARED.PG.SWTBER27_PG_INGRESS_RULE')
  COMMENT = 'Ingress policy for the UC2 Snowflake Postgres instance. [openflow]';

-- Without a network policy the instance accepts no incoming connections at all.
CREATE POSTGRES INSTANCE IF NOT EXISTS SWTBER27_PG
  AUTHENTICATION_AUTHORITY = POSTGRES
  COMPUTE_FAMILY = 'STANDARD_L'
  STORAGE_SIZE_GB = 200
  POSTGRES_VERSION = 18
  HIGH_AVAILABILITY = FALSE
  NETWORK_POLICY = 'SWTBER27_PG_NETWORK_POLICY'
  COMMENT = 'UC2 Postgres CDC source for the SWT Berlin Openflow HoL. [openflow]';

-- Poll until state = READY (typically 2-5 minutes), and record the host value.
DESCRIBE POSTGRES INSTANCE SWTBER27_PG;

-- Raise the logical-replication ceilings: the connector uses ONE replication
-- slot and ONE WAL sender per connector instance, and defaults are only 10
-- each. Sized here for ~200 attendees plus headroom.
--
-- These parameters require a restart, hence APPLY IMMEDIATELY. Run this only
-- when no attendee connectors are running.
--
-- NOTE: POSTGRES_SETTINGS must be STRICT JSON with colons. The Snowflake docs
-- show a `'{"postgres:key" = "value"}'` form with equals signs - that is wrong
-- and fails with "Invalid JSON format in settings string".
ALTER POSTGRES INSTANCE SWTBER27_PG SET POSTGRES_SETTINGS = '{
  "postgres:max_replication_slots": "250",
  "postgres:max_wal_senders": "250",
  "postgres:max_connections": "1000"
}' APPLY IMMEDIATELY;

-- ---------------------------------------------------------------------------
-- 6. Network rules + External Access Integration
--
--    NEVER use CREATE OR REPLACE on a network rule or EAI: replacing one
--    silently detaches it from every runtime that references it. Use
--    CREATE ... IF NOT EXISTS for new objects and ALTER to modify.
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

-- UC1 - REST API demo
CREATE NETWORK RULE IF NOT EXISTS OPENFLOW_SHARED.INFRA.SWTBER27_LAB_NETWORK_RULE
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('dummyjson.com:443')
  COMMENT = 'Egress for UC1 REST API demo (dummyjson.com). [openflow]';

-- UC2 - Postgres CDC. Host:port only: no jdbc: scheme, no database path.
-- Replace the hostname with the host value from section 5's DESCRIBE.
CREATE NETWORK RULE IF NOT EXISTS OPENFLOW_SHARED.PG.SWTBER27_UC2_PG_EGRESS_RULE
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('ju5u5cax6raapbr77r7pqsjm64.sfpscogs-swtberlin2026-openflow.eu-central-1.aws.postgres.snowflake.app:5432')
  COMMENT = 'Egress from Openflow runtimes to the UC2 Snowflake Postgres instance. [openflow]';

CREATE EXTERNAL ACCESS INTEGRATION IF NOT EXISTS SWTBER27_LAB_EAI
  ALLOWED_NETWORK_RULES = (OPENFLOW_SHARED.INFRA.SWTBER27_LAB_NETWORK_RULE)
  ENABLED = TRUE
  COMMENT = 'Shared EAI for Openflow lab attendees - UC1 REST API + UC2 Postgres CDC. [openflow]';

-- ---------------------------------------------------------------------------
-- 6b. UC1 lab resources stage
--
--     Attendee-facing copies of the UC1 files so the lab does not depend on
--     GitHub access or on the upstream repo's file naming (the connected git
--     repository still carries the older techup27_* names).
--
--     Populate once from a machine with the repo checked out:
--       PUT 'file://.../1_rest_api/swt26_ber_flow.json'    @OPENFLOW_SHARED.INFRA.UC1_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../1_rest_api/swt26_ber_hints.txt'    @OPENFLOW_SHARED.INFRA.UC1_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../1_rest_api/swt26_ber_setup.sql'    @OPENFLOW_SHARED.INFRA.UC1_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../1_rest_api/swt26_ber_summary.txt'  @OPENFLOW_SHARED.INFRA.UC1_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../1_rest_api/0_..._runbook.md'       @OPENFLOW_SHARED.INFRA.UC1_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
-- ---------------------------------------------------------------------------
CREATE STAGE IF NOT EXISTS OPENFLOW_SHARED.INFRA.UC1_FILES
  DIRECTORY = (ENABLE = TRUE)
  COMMENT = 'UC1 REST API lab resources: flow.json, hints, reference setup SQL, runbook. Readable by SWTBER27_ATTENDEE_RL. [openflow]';

-- Additive ALTER, so re-running this script never detaches the EAI from
-- existing runtimes. Attaching/altering an EAI does not require a restart.
USE ROLE ACCOUNTADMIN;
ALTER EXTERNAL ACCESS INTEGRATION SWTBER27_LAB_EAI SET
  ALLOWED_NETWORK_RULES = (
    OPENFLOW_SHARED.INFRA.SWTBER27_LAB_NETWORK_RULE,
    OPENFLOW_SHARED.PG.SWTBER27_UC2_PG_EGRESS_RULE
  );

-- --- UC3 placeholder ------------------------------------------------------
-- NOT created yet - the Redpanda broker hostname is not known.
--   CREATE NETWORK RULE IF NOT EXISTS OPENFLOW_SHARED.INFRA.SWTBER27_UC3_NETWORK_RULE
--     MODE = EGRESS TYPE = HOST_PORT VALUE_LIST = ('<broker-host>:<port>')
--     COMMENT = 'Egress for UC3 Kafka/Redpanda demo. [openflow]';
-- then add it to the EAI with the same additive ALTER as above.

-- ---------------------------------------------------------------------------
-- 7. UC2 - shared Postgres credentials for attendees
--
--    Two delivery mechanisms, because the two connector setup paths need
--    different things:
--      - SQL path: a Snowflake SECRET, referenced from config.json as
--        {"valueType":"SECRET_REFERENCE","fullyQualifiedSecretName":"..."}.
--        Attendees get READ on the secret but never see its value.
--      - Guided wizard path: the wizard needs a secret too, but attendees
--        must type the host/user/database themselves, so those non-sensitive
--        values are exposed via the view below.
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

-- Replace with the real snowflake_admin (or dedicated replication user)
-- password captured from CREATE POSTGRES INSTANCE.
CREATE SECRET IF NOT EXISTS OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET
  TYPE = GENERIC_STRING
  SECRET_STRING = '<postgres_replication_user_password>'
  COMMENT = 'Postgres CDC password for UC2. READ granted to attendees; value never exposed. [openflow]';

-- Non-sensitive connection details, so attendees can fill in the wizard or
-- build a JDBC URL without being handed the password.
CREATE OR REPLACE VIEW OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO
  COMMENT = 'UC2 Postgres connection details for attendees (no password). [openflow]'
AS
SELECT
  'ju5u5cax6raapbr77r7pqsjm64.sfpscogs-swtberlin2026-openflow.eu-central-1.aws.postgres.snowflake.app' AS PG_HOST,
  5432                                                        AS PG_PORT,
  'postgres'                                                  AS PG_DATABASE,
  'swtber27_cdc'                                              AS PG_USER,
  'swtber27_cdc_pub'                                          AS PG_PUBLICATION,
  'OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET'                 AS PG_PASSWORD_SECRET,
  'jdbc:postgresql://ju5u5cax6raapbr77r7pqsjm64.sfpscogs-swtberlin2026-openflow.eu-central-1.aws.postgres.snowflake.app:5432/postgres?sslmode=require' AS JDBC_URL;

-- ---------------------------------------------------------------------------
-- 7b. UC2 lab resources stage - EVERYTHING attendees need, in OPENFLOW_SHARED
--
--     Holds the PostgreSQL JDBC driver (which the connector does NOT ship
--     with), the config.json template, and the lab docs. Attendees get READ,
--     so they can `COPY FILES` the driver straight onto their connector's
--     versioned stage without any local tooling.
--
--     Populate it once from a machine with the repo checked out:
--       PUT 'file://.../2_cdc/config.template.json'                @OPENFLOW_SHARED.PG.UC2_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../2_cdc/swt26_ber_uc2_postgres_setup.sql'    @OPENFLOW_SHARED.PG.UC2_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../2_cdc/0_..._runbook.md'                    @OPENFLOW_SHARED.PG.UC2_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--       PUT 'file://.../postgresql-42.7.4.jar'                     @OPENFLOW_SHARED.PG.UC2_FILES/ AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
--     Driver download:
--       https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.4/postgresql-42.7.4.jar
-- ---------------------------------------------------------------------------
CREATE STAGE IF NOT EXISTS OPENFLOW_SHARED.PG.UC2_FILES
  DIRECTORY = (ENABLE = TRUE)
  COMMENT = 'All UC2 Postgres CDC lab resources: JDBC driver, config template, docs. Readable by SWTBER27_ATTENDEE_RL. [openflow]';

-- ---------------------------------------------------------------------------
-- 7c. Connector config generator
--
--     Lets an attendee produce a complete, correct config.json with ONE
--     function call - no JSON editing, no local client. Combined with
--     COPY FILES (which DOES work against a connector's versioned stage,
--     unlike PUT/GET from Snowsight), this makes the SQL path fully
--     browser-only.
--
--     MAINTENANCE: connector definitions evolve. If a connector starts
--     failing with "'<Property>' is required", regenerate this body from a
--     freshly created connector:
--       CREATE OPENFLOW CONNECTOR <scratch> IN RUNTIME <rt>
--         FROM DEFINITION OPENFLOW_POSTGRES_CDC;
--       GET 'snow://openflow_connector/<scratch>/versions/live/config.json' 'file:///tmp/';
--     then diff against the JSON below.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION OPENFLOW_SHARED.PG.UC2_CONFIG_JSON(DEST_DB STRING)
RETURNS STRING
COMMENT = 'Internal: raw config body. Use UC2_CONFIG_FOR() instead. [openflow]'
AS
$$
'{
  "configFormatVersion": 1,
  "configuration": [
    { "name": "Source", "properties": {
      "Source Database Connection URL": { "valueType": "STRING_LITERAL", "value": "jdbc:postgresql://ju5u5cax6raapbr77r7pqsjm64.sfpscogs-swtberlin2026-openflow.eu-central-1.aws.postgres.snowflake.app:5432/postgres?sslmode=require" },
      "Source Database Driver": { "valueType": "ASSET_REFERENCE", "assetIds": ["postgresql-42.7.4.jar"] },
      "Source Database User": { "valueType": "STRING_LITERAL", "value": "swtber27_cdc" },
      "Source Database Password": { "valueType": "SECRET_REFERENCE", "fullyQualifiedSecretName": "OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET" },
      "Source Database Publication Name": { "valueType": "STRING_LITERAL", "value": "swtber27_cdc_pub" },
      "Configure Logical Keys": { "valueType": "STRING_LITERAL", "value": "default_primary_key_support" }
    }},
    { "name": "Replication table schema", "properties": {
      "Included Comma Separated Source Table Names": { "valueType": "STRING_LITERAL", "value": "public.sensors,public.sensor_readings" },
      "Included Source Table Pattern": { "valueType": "STRING_LITERAL", "value": null }
    }},
    { "name": "Replication columns", "properties": {
      "Column Filter JSON": { "valueType": "STRING_LITERAL", "value": "[]" }
    }},
    { "name": "Logical key configuration", "properties": {
      "Table Key Configuration JSON": { "valueType": "STRING_LITERAL", "value": "[]" }
    }},
    { "name": "Destination authentication", "properties": {
      "Snowflake Authentication Strategy": { "valueType": "STRING_LITERAL", "value": "SNOWFLAKE_MANAGED" },
      "Snowflake Username": { "valueType": "STRING_LITERAL", "value": null },
      "Snowflake Role": { "valueType": "STRING_LITERAL", "value": null },
      "Snowflake Account Identifier": { "valueType": "STRING_LITERAL", "value": null },
      "Snowflake Connection Strategy": { "valueType": "STRING_LITERAL", "value": null },
      "Snowflake Private Key": { "valueType": "SECRET_REFERENCE", "fullyQualifiedSecretName": null }
    }},
    { "name": "Destination details", "properties": {
      "Snowflake Destination Database": { "valueType": "STRING_LITERAL", "value": "__DEST_DB__" },
      "Snowflake Warehouse": { "valueType": "STRING_LITERAL", "value": "COMPUTE_WH" },
      "Destination Schema Strategy": { "valueType": "STRING_LITERAL", "value": "SOURCE_SCHEMA" },
      "Destination Schema Prefix": { "valueType": "STRING_LITERAL", "value": null },
      "Destination Schema Suffix": { "valueType": "STRING_LITERAL", "value": null },
      "Destination Schema Pattern": { "valueType": "STRING_LITERAL", "value": null },
      "Object Identifier Resolution": { "valueType": "STRING_LITERAL", "value": "CASE_INSENSITIVE" },
      "Legacy Format Support": { "valueType": "STRING_LITERAL", "value": "STANDARD" },
      "Oversized Value Strategy": { "valueType": "STRING_LITERAL", "value": "Set Null" },
      "Error Handling Strategy": { "valueType": "STRING_LITERAL", "value": "Log Errors and Continue" },
      "Table Storage Format": { "valueType": "STRING_LITERAL", "value": "STANDARD" },
      "Iceberg Version": { "valueType": "STRING_LITERAL", "value": "3" }
    }},
    { "name": "Tuning", "properties": {
      "Merge Task Schedule CRON": { "valueType": "STRING_LITERAL", "value": "0 * * * * ?" },
      "Concurrent Snapshot Queries": { "valueType": "STRING_LITERAL", "value": "2" }
    }},
    { "name": "Migration", "properties": {
      "Ingestion Type": { "valueType": "STRING_LITERAL", "value": "full" },
      "Replication Slot Name": { "valueType": "STRING_LITERAL", "value": null }
    }}
  ],
  "connectorDefinitionId": "OPENFLOW_POSTGRES_CDC"
}'
$$;

CREATE OR REPLACE FUNCTION OPENFLOW_SHARED.PG.UC2_CONFIG_TEMPLATE()
RETURNS STRING
COMMENT = 'Raw Openflow Postgres CDC config.json template with a __DEST_DB__ placeholder. [openflow]'
AS $$ OPENFLOW_SHARED.PG.UC2_CONFIG_JSON('__DEST_DB__') $$;

-- The one attendees call.
CREATE OR REPLACE FUNCTION OPENFLOW_SHARED.PG.UC2_CONFIG_FOR(DEST_DB STRING)
RETURNS STRING
COMMENT = 'Returns a ready-to-use Openflow Postgres CDC config.json for the given destination database. Attendees never hand-edit JSON. [openflow]'
AS $$ REPLACE(OPENFLOW_SHARED.PG.UC2_CONFIG_TEMPLATE(), '__DEST_DB__', DEST_DB) $$;

-- Sanity check: valid JSON, placeholder substituted.
SELECT TRY_PARSE_JSON(OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('SWTBER27_USER01')) IS NOT NULL AS is_valid_json,
       CONTAINS(OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('SWTBER27_USER01'), '__DEST_DB__') AS placeholder_left;

-- ---------------------------------------------------------------------------
-- 8. Git repository integration - shared clone of the HoL repo so attendees
--    can pull flow.json / setup files via SQL instead of depending on venue
--    Wi-Fi. The repo is private, so authentication uses a Snowflake SECRET
--    (owned by OPENFLOW_ADMIN - the PAT is never granted to attendees; they
--    only get READ on the repository object).
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

CREATE API INTEGRATION IF NOT EXISTS SWTBER27_LAB_GIT_API_INTEGRATION
  API_PROVIDER = GIT_HTTPS_API
  API_ALLOWED_PREFIXES = ('https://github.com/sfc-gh-ohutuleac')
  ENABLED = TRUE
  COMMENT = 'Git API integration for the SWT Berlin Openflow HoL repo. [openflow]';

CREATE SECRET IF NOT EXISTS OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS
  TYPE = PASSWORD
  USERNAME = '<github_username>'
  PASSWORD = '<github_personal_access_token>'
  COMMENT = 'Shared git credentials for the SWT Berlin Openflow HoL repo. [openflow]';

USE ROLE ACCOUNTADMIN;
ALTER API INTEGRATION SWTBER27_LAB_GIT_API_INTEGRATION SET
  ALLOWED_AUTHENTICATION_SECRETS = (OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS);

USE ROLE OPENFLOW_ADMIN;
CREATE GIT REPOSITORY IF NOT EXISTS OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO
  API_INTEGRATION = SWTBER27_LAB_GIT_API_INTEGRATION
  GIT_CREDENTIALS = OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS
  ORIGIN = 'https://github.com/sfc-gh-ohutuleac/swt-berlin-openflow-hol.git'
  COMMENT = 'Shared clone of the HoL repo (flow.json, setup scripts, hints). [openflow]';

ALTER GIT REPOSITORY OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO FETCH;

-- ---------------------------------------------------------------------------
-- 9. SWTBER27_ATTENDEE_RL - the single shared role for every attendee.
--    Every per-user role (in provision_users.sql) gets
--    GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_<user>_RL.
--    Adding/removing a shared privilege for the whole event means editing
--    this block once, not every user.
-- ---------------------------------------------------------------------------
USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS SWTBER27_ATTENDEE_RL
  COMMENT = 'Shared privileges for all Openflow HoL attendees - deployment usage, EAI, warehouse, shared infra, Postgres credentials. [openflow]';

-- Gen2 self-service Openflow access. USAGE on the DEPLOYMENT object is what
-- makes it visible and usable; runtimes are then created inside each
-- attendee's own schema, which they own.
GRANT USAGE ON OPENFLOW DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON INTEGRATION SWTBER27_LAB_EAI                TO ROLE SWTBER27_ATTENDEE_RL;

-- Compute. Also required by the connector's warehouse validation, which is
-- evaluated as the runtime's EXECUTE_AS_ROLE (each attendee's own role).
GRANT USAGE, OPERATE ON WAREHOUSE COMPUTE_WH TO ROLE SWTBER27_ATTENDEE_RL;

-- Shared infra namespace visibility. GRANT SELECT/READ alone does not imply
-- it, so DB + schema USAGE must be granted explicitly.
GRANT USAGE ON DATABASE OPENFLOW_SHARED     TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON SCHEMA OPENFLOW_SHARED.INFRA TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON SCHEMA OPENFLOW_SHARED.GIT   TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON SCHEMA OPENFLOW_SHARED.PG    TO ROLE SWTBER27_ATTENDEE_RL;

-- UC2 Postgres access: the connector config references the secret, so the
-- attendee's role (the runtime's EXECUTE_AS_ROLE) needs READ on it.
GRANT READ ON SECRET OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET TO ROLE SWTBER27_ATTENDEE_RL;
GRANT SELECT ON VIEW OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO    TO ROLE SWTBER27_ATTENDEE_RL;
GRANT READ ON STAGE OPENFLOW_SHARED.PG.UC2_FILES               TO ROLE SWTBER27_ATTENDEE_RL;
GRANT READ ON STAGE OPENFLOW_SHARED.INFRA.UC1_FILES            TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON FUNCTION OPENFLOW_SHARED.PG.UC2_CONFIG_TEMPLATE()   TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON FUNCTION OPENFLOW_SHARED.PG.UC2_CONFIG_FOR(STRING)  TO ROLE SWTBER27_ATTENDEE_RL;

-- Attendees can list/GET files from the repo, but never see the git secret.
GRANT READ ON GIT REPOSITORY OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO TO ROLE SWTBER27_ATTENDEE_RL;

-- ---------------------------------------------------------------------------
-- 10. Verification
-- ---------------------------------------------------------------------------
SHOW GRANTS TO ROLE SWTBER27_ATTENDEE_RL;
SHOW OPENFLOW DEPLOYMENTS;
SHOW OPENFLOW CONNECTOR DEFINITIONS;   -- expect OPENFLOW_POSTGRES_CDC
SHOW POSTGRES INSTANCES LIKE 'SWTBER27_PG';
DESCRIBE EXTERNAL ACCESS INTEGRATION SWTBER27_LAB_EAI;

-- After any PUT to the lab stages, REFRESH their directory tables - otherwise
-- the Snowsight stage browser shows them as empty (LS still works, but
-- attendees clicking through the UI would see nothing).
USE ROLE OPENFLOW_ADMIN;
ALTER STAGE OPENFLOW_SHARED.INFRA.UC1_FILES REFRESH;
ALTER STAGE OPENFLOW_SHARED.PG.UC2_FILES    REFRESH;

-- Everything an attendee touches should be listed here, all in OPENFLOW_SHARED.
-- Run as an attendee role to confirm the shared technical role grants work:
--   USE ROLE SWTBER27_USER01_RL;
--   SELECT * FROM OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO;
--   SELECT OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('SWTBER27_USER01');
--   LS @OPENFLOW_SHARED.PG.UC2_FILES;
--   LS @OPENFLOW_SHARED.INFRA.UC1_FILES;
--   SELECT COUNT(*) FROM OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS;
