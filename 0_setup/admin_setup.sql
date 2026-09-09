-- ============================================================================
-- Openflow Multi-Tenant Demo Lab - Shared Admin Layer
-- Run ONCE, by ACCOUNTADMIN. Idempotent (CREATE ... IF NOT EXISTS throughout).
--
-- Creates:
--   - OPENFLOW_ADMIN role, owning shared infra
--   - OPENFLOW_SHARED database (INFRA + GIT schemas)
--   - Account-wide default event table (+ PUBLIC read access)
--   - Shared network rule + EAI for UC1 (REST API / dummyjson.com)
--   - Shared git repository object for the HoL repo (private repo, auth via
--     a Snowflake SECRET - see section 5)
--   - SWTBER27_ATTENDEE_RL: the ONE role holding every privilege common to
--     all attendees (deployment USAGE, self-service runtime creation, EAI
--     USAGE, warehouse, shared infra access). Per-user roles (created in
--     provision_users.sql) hold ONLY their own database ownership and
--     inherit everything else via GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE
--     SWTBER27_<user>_RL - nothing Openflow-related is ever granted directly
--     to a per-user role.
--
-- Does NOT touch: the existing Openflow deployment/runtime integrations
-- (OPENFLOW_DATAPLANE_..., OPENFLOW_RUNTIME_...), which stay owned by
-- ACCOUNTADMIN as-is.
-- ============================================================================

USE ROLE ACCOUNTADMIN;

-- ---------------------------------------------------------------------------
-- 1. Admin role
-- ---------------------------------------------------------------------------
CREATE ROLE IF NOT EXISTS OPENFLOW_ADMIN
  COMMENT = 'Owns shared Openflow lab infrastructure (EAI, network rule, event table, git repo). [openflow]';

GRANT ROLE OPENFLOW_ADMIN TO USER TSTOLPE;
GRANT ROLE OPENFLOW_ADMIN TO ROLE SYSADMIN;

GRANT CREATE INTEGRATION ON ACCOUNT TO ROLE OPENFLOW_ADMIN;
GRANT CREATE DATABASE ON ACCOUNT TO ROLE OPENFLOW_ADMIN;

-- Administrative visibility only - NOT required for attendee self-service,
-- which is granted per-user in provision_users.sql.
GRANT USAGE ON INTEGRATION OPENFLOW_DATAPLANE_37B63CAA_B530_43FE_8526_B0F9856188A9 TO ROLE OPENFLOW_ADMIN;

-- ---------------------------------------------------------------------------
-- 2. Shared database / schemas
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

CREATE DATABASE IF NOT EXISTS OPENFLOW_SHARED
  COMMENT = 'Shared Openflow lab infrastructure: event table, network rule, git repo. [openflow]';

CREATE SCHEMA IF NOT EXISTS OPENFLOW_SHARED.INFRA
  COMMENT = 'Event table + network rule for the Openflow lab. [openflow]';

CREATE SCHEMA IF NOT EXISTS OPENFLOW_SHARED.GIT
  COMMENT = 'Git repository integration for the HoL repo. [openflow]';

-- ---------------------------------------------------------------------------
-- 3. Event table - set as the ACCOUNT-WIDE default so every Openflow runtime
--    (current and future, any attendee) logs there automatically with zero
--    per-deployment / per-runtime wiring.
-- ---------------------------------------------------------------------------
CREATE EVENT TABLE IF NOT EXISTS OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS
  COMMENT = 'Account-wide default event table; Openflow runtime telemetry lands here automatically. [openflow]';

USE ROLE ACCOUNTADMIN;
ALTER ACCOUNT SET EVENT_TABLE = OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS;

-- Grant once, to PUBLIC, so every current and future attendee role can query
-- it automatically - no per-user grant needed in the provisioning template.
GRANT SELECT ON TABLE OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS TO ROLE PUBLIC;

-- ---------------------------------------------------------------------------
-- 4. Network rule + External Access Integration for UC1 (REST API)
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

CREATE NETWORK RULE IF NOT EXISTS OPENFLOW_SHARED.INFRA.SWTBER27_LAB_NETWORK_RULE
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('dummyjson.com:443')
  COMMENT = 'Egress for UC1 REST API demo (dummyjson.com). [openflow]';

CREATE EXTERNAL ACCESS INTEGRATION IF NOT EXISTS SWTBER27_LAB_EAI
  ALLOWED_NETWORK_RULES = (OPENFLOW_SHARED.INFRA.SWTBER27_LAB_NETWORK_RULE)
  ENABLED = TRUE
  COMMENT = 'Shared EAI for Openflow lab attendees - UC1 REST API. USAGE granted per-attendee in provision_users.sql. [openflow]';

-- --- UC2/UC3 placeholders -----------------------------------------------
-- NOT created yet - real hostnames are not known. Fill in once available,
-- then ALTER EXTERNAL ACCESS INTEGRATION SWTBER27_LAB_EAI SET
-- ALLOWED_NETWORK_RULES = (... existing rule ..., ... new rule ...);
--
-- UC2 - Postgres CDC (host:5432, once the Snowflake Postgres connection
-- details arrive):
--   CREATE NETWORK RULE IF NOT EXISTS OPENFLOW_SHARED.INFRA.SWTBER27_UC2_NETWORK_RULE
--     MODE = EGRESS TYPE = HOST_PORT VALUE_LIST = ('<postgres-host>:5432')
--     COMMENT = 'Egress for UC2 Postgres CDC demo. [openflow]';
--
-- UC3 - Kafka/Redpanda (broker host:port, once Ovi's Redpanda cluster is
-- provisioned):
--   CREATE NETWORK RULE IF NOT EXISTS OPENFLOW_SHARED.INFRA.SWTBER27_UC3_NETWORK_RULE
--     MODE = EGRESS TYPE = HOST_PORT VALUE_LIST = ('<redpanda-broker-host>:<port>')
--     COMMENT = 'Egress for UC3 Kafka/Redpanda demo. [openflow]';

-- ---------------------------------------------------------------------------
-- 5. Git repository integration - shared clone of the HoL repo so attendees
--    can pull flow.json / setup files via SQL instead of depending on
--    venue Wi-Fi / GitHub access. This repo is private, so authentication
--    uses a Snowflake SECRET (created once, owned by OPENFLOW_ADMIN - the
--    PAT itself is never granted to attendees; they only get READ on the
--    repository object).
-- ---------------------------------------------------------------------------
USE ROLE OPENFLOW_ADMIN;

CREATE API INTEGRATION IF NOT EXISTS SWTBER27_LAB_GIT_API_INTEGRATION
  API_PROVIDER = GIT_HTTPS_API
  API_ALLOWED_PREFIXES = ('https://github.com/sfc-gh-ohutuleac')
  ENABLED = TRUE
  COMMENT = 'Git API integration for the SWT Berlin Openflow HoL repo. [openflow]';

-- Secret holding the git credentials (username + PAT) for a user with repo
-- access. Owned by OPENFLOW_ADMIN - never exposed to attendee roles.
CREATE SECRET IF NOT EXISTS OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS
  TYPE = PASSWORD
  USERNAME = '<github_username>'
  PASSWORD = '<github_personal_access_token>'
  COMMENT = 'Shared git credentials for the SWT Berlin Openflow HoL repo, used by SWTBER27_LAB_GIT_API_INTEGRATION. [openflow]';

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

USE ROLE ACCOUNTADMIN;
-- Attendees can list/GET files from the repo, but never see the secret itself.
GRANT READ ON GIT REPOSITORY OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO TO ROLE SWTBER27_ATTENDEE_RL;

-- ---------------------------------------------------------------------------
-- 6. SWTBER27_ATTENDEE_RL - the single shared role for every attendee.
--    Every per-user role (in provision_users.sql) gets GRANT ROLE
--    SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_<user>_RL - this is the ONLY
--    place these privileges are granted. Adding/removing a shared privilege
--    for the whole event means editing this block once, not every user.
-- ---------------------------------------------------------------------------
CREATE ROLE IF NOT EXISTS SWTBER27_ATTENDEE_RL
  COMMENT = 'Shared privileges for all Openflow HoL attendees - deployment usage, EAI, runtime creation, warehouse, shared infra access. [openflow]';

-- Self-service Openflow access (shared, not per-user)
GRANT USAGE ON INTEGRATION OPENFLOW_DATAPLANE_37B63CAA_B530_43FE_8526_B0F9856188A9 TO ROLE SWTBER27_ATTENDEE_RL;
GRANT CREATE OPENFLOW RUNTIME INTEGRATION ON ACCOUNT TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON INTEGRATION SWTBER27_LAB_EAI TO ROLE SWTBER27_ATTENDEE_RL;

-- Compute
GRANT USAGE, OPERATE ON WAREHOUSE COMPUTE_WH TO ROLE SWTBER27_ATTENDEE_RL;

-- Shared infra access (event table + git repo db/schema visibility - the
-- READ grant on the repo itself and the SELECT grant on the event table are
-- done in sections 5 and 3 above, but USAGE on the containing DB/schemas is
-- required too, since GRANT SELECT/READ alone does not imply namespace
-- visibility).
GRANT USAGE ON DATABASE OPENFLOW_SHARED TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON SCHEMA OPENFLOW_SHARED.INFRA TO ROLE SWTBER27_ATTENDEE_RL;
GRANT USAGE ON SCHEMA OPENFLOW_SHARED.GIT TO ROLE SWTBER27_ATTENDEE_RL;
