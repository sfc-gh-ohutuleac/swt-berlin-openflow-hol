--!jinja
-- ============================================================================
-- Openflow Multi-Tenant Demo Lab - Pilot User Provisioning
-- GENERATED/TEMPLATE FILE - see README.md for both ways to run this
-- (local render_provisioning.py, or server-side EXECUTE IMMEDIATE FROM).
--
-- Prerequisite: SWTBER27_ATTENDEE_RL must already exist (created in
-- admin_setup.sql) with all shared privileges granted to it.
-- ============================================================================

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER01
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER01
  COMMENT = 'Openflow HoL sandbox for user01. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER01.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER01_RL
  COMMENT = 'Openflow HoL login/execute-as role for user01. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER01 TO ROLE SWTBER27_USER01_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER01.PUBLIC TO ROLE SWTBER27_USER01_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER01_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER01.PUBLIC TO ROLE SWTBER27_USER01_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER01.PUBLIC TO ROLE SWTBER27_USER01_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER01_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER01
  PASSWORD = 'CkXVu7n05wOL'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER01_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER01_RL TO USER SWTBER27_USER01;

-- ----------------------------------------------------------------------------
-- USER02
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER02
  COMMENT = 'Openflow HoL sandbox for user02. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER02.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER02_RL
  COMMENT = 'Openflow HoL login/execute-as role for user02. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER02 TO ROLE SWTBER27_USER02_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER02.PUBLIC TO ROLE SWTBER27_USER02_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER02_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER02.PUBLIC TO ROLE SWTBER27_USER02_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER02.PUBLIC TO ROLE SWTBER27_USER02_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER02_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER02
  PASSWORD = 'jP6bl6c2YnR6'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER02_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER02_RL TO USER SWTBER27_USER02;

-- ----------------------------------------------------------------------------
-- USER03
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER03
  COMMENT = 'Openflow HoL sandbox for user03. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER03.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER03_RL
  COMMENT = 'Openflow HoL login/execute-as role for user03. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER03 TO ROLE SWTBER27_USER03_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER03.PUBLIC TO ROLE SWTBER27_USER03_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER03_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER03.PUBLIC TO ROLE SWTBER27_USER03_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER03.PUBLIC TO ROLE SWTBER27_USER03_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER03_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER03
  PASSWORD = '83xQbbnHWW5B'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER03_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER03_RL TO USER SWTBER27_USER03;

-- ----------------------------------------------------------------------------
-- USER04
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER04
  COMMENT = 'Openflow HoL sandbox for user04. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER04.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER04_RL
  COMMENT = 'Openflow HoL login/execute-as role for user04. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER04 TO ROLE SWTBER27_USER04_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER04.PUBLIC TO ROLE SWTBER27_USER04_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER04_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER04.PUBLIC TO ROLE SWTBER27_USER04_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER04.PUBLIC TO ROLE SWTBER27_USER04_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER04_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER04
  PASSWORD = '1CdVYzxIZspp'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER04_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER04_RL TO USER SWTBER27_USER04;

-- ----------------------------------------------------------------------------
-- USER05
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER05
  COMMENT = 'Openflow HoL sandbox for user05. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER05.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER05_RL
  COMMENT = 'Openflow HoL login/execute-as role for user05. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER05 TO ROLE SWTBER27_USER05_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER05.PUBLIC TO ROLE SWTBER27_USER05_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER05_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER05.PUBLIC TO ROLE SWTBER27_USER05_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER05.PUBLIC TO ROLE SWTBER27_USER05_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER05_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER05
  PASSWORD = 'NiCDBdStXrG2'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER05_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER05_RL TO USER SWTBER27_USER05;

-- ----------------------------------------------------------------------------
-- USER06
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER06
  COMMENT = 'Openflow HoL sandbox for user06. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER06.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER06_RL
  COMMENT = 'Openflow HoL login/execute-as role for user06. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER06 TO ROLE SWTBER27_USER06_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER06.PUBLIC TO ROLE SWTBER27_USER06_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER06_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER06.PUBLIC TO ROLE SWTBER27_USER06_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER06.PUBLIC TO ROLE SWTBER27_USER06_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER06_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER06
  PASSWORD = 'Sa8Mmp7hbC6D'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER06_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER06_RL TO USER SWTBER27_USER06;

-- ----------------------------------------------------------------------------
-- USER07
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER07
  COMMENT = 'Openflow HoL sandbox for user07. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER07.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER07_RL
  COMMENT = 'Openflow HoL login/execute-as role for user07. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER07 TO ROLE SWTBER27_USER07_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER07.PUBLIC TO ROLE SWTBER27_USER07_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER07_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER07.PUBLIC TO ROLE SWTBER27_USER07_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER07.PUBLIC TO ROLE SWTBER27_USER07_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER07_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER07
  PASSWORD = 'L2G6d9PI3g9j'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER07_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER07_RL TO USER SWTBER27_USER07;

-- ----------------------------------------------------------------------------
-- USER08
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER08
  COMMENT = 'Openflow HoL sandbox for user08. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER08.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER08_RL
  COMMENT = 'Openflow HoL login/execute-as role for user08. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER08 TO ROLE SWTBER27_USER08_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER08.PUBLIC TO ROLE SWTBER27_USER08_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER08_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER08.PUBLIC TO ROLE SWTBER27_USER08_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER08.PUBLIC TO ROLE SWTBER27_USER08_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER08_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER08
  PASSWORD = 'sWEd117r6mvi'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER08_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER08_RL TO USER SWTBER27_USER08;

-- ----------------------------------------------------------------------------
-- USER09
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER09
  COMMENT = 'Openflow HoL sandbox for user09. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER09.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER09_RL
  COMMENT = 'Openflow HoL login/execute-as role for user09. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER09 TO ROLE SWTBER27_USER09_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER09.PUBLIC TO ROLE SWTBER27_USER09_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER09_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER09.PUBLIC TO ROLE SWTBER27_USER09_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER09.PUBLIC TO ROLE SWTBER27_USER09_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER09_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER09
  PASSWORD = 'bPso4cX95IIm'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER09_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER09_RL TO USER SWTBER27_USER09;

-- ----------------------------------------------------------------------------
-- USER10
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER10
  COMMENT = 'Openflow HoL sandbox for user10. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER10.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER10_RL
  COMMENT = 'Openflow HoL login/execute-as role for user10. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER10 TO ROLE SWTBER27_USER10_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER10.PUBLIC TO ROLE SWTBER27_USER10_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER10_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER10.PUBLIC TO ROLE SWTBER27_USER10_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER10.PUBLIC TO ROLE SWTBER27_USER10_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER10_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER10
  PASSWORD = 'CxZQM3M5zmrB'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER10_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER10_RL TO USER SWTBER27_USER10;

-- ----------------------------------------------------------------------------
-- USER11
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER11
  COMMENT = 'Openflow HoL sandbox for user11. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER11.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER11_RL
  COMMENT = 'Openflow HoL login/execute-as role for user11. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER11 TO ROLE SWTBER27_USER11_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER11.PUBLIC TO ROLE SWTBER27_USER11_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER11_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER11.PUBLIC TO ROLE SWTBER27_USER11_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER11.PUBLIC TO ROLE SWTBER27_USER11_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER11_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER11
  PASSWORD = 'ixtfHF53fYTc'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER11_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER11_RL TO USER SWTBER27_USER11;

-- ----------------------------------------------------------------------------
-- USER12
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER12
  COMMENT = 'Openflow HoL sandbox for user12. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER12.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER12_RL
  COMMENT = 'Openflow HoL login/execute-as role for user12. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER12 TO ROLE SWTBER27_USER12_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER12.PUBLIC TO ROLE SWTBER27_USER12_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER12_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER12.PUBLIC TO ROLE SWTBER27_USER12_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER12.PUBLIC TO ROLE SWTBER27_USER12_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER12_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER12
  PASSWORD = 'lN8OkpPrOY2h'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER12_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER12_RL TO USER SWTBER27_USER12;

-- ----------------------------------------------------------------------------
-- USER13
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER13
  COMMENT = 'Openflow HoL sandbox for user13. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER13.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER13_RL
  COMMENT = 'Openflow HoL login/execute-as role for user13. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER13 TO ROLE SWTBER27_USER13_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER13.PUBLIC TO ROLE SWTBER27_USER13_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER13_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER13.PUBLIC TO ROLE SWTBER27_USER13_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER13.PUBLIC TO ROLE SWTBER27_USER13_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER13_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER13
  PASSWORD = '9t6QvYcPxvus'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER13_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER13_RL TO USER SWTBER27_USER13;

-- ----------------------------------------------------------------------------
-- USER14
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER14
  COMMENT = 'Openflow HoL sandbox for user14. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER14.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER14_RL
  COMMENT = 'Openflow HoL login/execute-as role for user14. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER14 TO ROLE SWTBER27_USER14_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER14.PUBLIC TO ROLE SWTBER27_USER14_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER14_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER14.PUBLIC TO ROLE SWTBER27_USER14_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER14.PUBLIC TO ROLE SWTBER27_USER14_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER14_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER14
  PASSWORD = 'Qm4mmOGwfYhn'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER14_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER14_RL TO USER SWTBER27_USER14;

-- ----------------------------------------------------------------------------
-- USER15
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER15
  COMMENT = 'Openflow HoL sandbox for user15. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER15.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER15_RL
  COMMENT = 'Openflow HoL login/execute-as role for user15. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER15 TO ROLE SWTBER27_USER15_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER15.PUBLIC TO ROLE SWTBER27_USER15_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER15_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER15.PUBLIC TO ROLE SWTBER27_USER15_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER15.PUBLIC TO ROLE SWTBER27_USER15_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER15_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER15
  PASSWORD = 'Gdbe8GLDYbu6'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER15_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER15_RL TO USER SWTBER27_USER15;

-- ----------------------------------------------------------------------------
-- USER16
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER16
  COMMENT = 'Openflow HoL sandbox for user16. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER16.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER16_RL
  COMMENT = 'Openflow HoL login/execute-as role for user16. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER16 TO ROLE SWTBER27_USER16_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER16.PUBLIC TO ROLE SWTBER27_USER16_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER16_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER16.PUBLIC TO ROLE SWTBER27_USER16_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER16.PUBLIC TO ROLE SWTBER27_USER16_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER16_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER16
  PASSWORD = 'WbpB1qmBqx15'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER16_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER16_RL TO USER SWTBER27_USER16;

-- ----------------------------------------------------------------------------
-- USER17
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER17
  COMMENT = 'Openflow HoL sandbox for user17. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER17.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER17_RL
  COMMENT = 'Openflow HoL login/execute-as role for user17. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER17 TO ROLE SWTBER27_USER17_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER17.PUBLIC TO ROLE SWTBER27_USER17_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER17_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER17.PUBLIC TO ROLE SWTBER27_USER17_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER17.PUBLIC TO ROLE SWTBER27_USER17_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER17_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER17
  PASSWORD = 'kRrkHBqoYn9L'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER17_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER17_RL TO USER SWTBER27_USER17;

-- ----------------------------------------------------------------------------
-- USER18
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER18
  COMMENT = 'Openflow HoL sandbox for user18. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER18.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER18_RL
  COMMENT = 'Openflow HoL login/execute-as role for user18. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER18 TO ROLE SWTBER27_USER18_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER18.PUBLIC TO ROLE SWTBER27_USER18_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER18_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER18.PUBLIC TO ROLE SWTBER27_USER18_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER18.PUBLIC TO ROLE SWTBER27_USER18_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER18_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER18
  PASSWORD = '6XVqgnJXvUAN'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER18_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER18_RL TO USER SWTBER27_USER18;

-- ----------------------------------------------------------------------------
-- USER19
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER19
  COMMENT = 'Openflow HoL sandbox for user19. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER19.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER19_RL
  COMMENT = 'Openflow HoL login/execute-as role for user19. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER19 TO ROLE SWTBER27_USER19_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER19.PUBLIC TO ROLE SWTBER27_USER19_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER19_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER19.PUBLIC TO ROLE SWTBER27_USER19_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER19.PUBLIC TO ROLE SWTBER27_USER19_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER19_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER19
  PASSWORD = '3hOnQgxvQGfS'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER19_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER19_RL TO USER SWTBER27_USER19;

-- ----------------------------------------------------------------------------
-- USER20
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER20
  COMMENT = 'Openflow HoL sandbox for user20. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER20.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER20_RL
  COMMENT = 'Openflow HoL login/execute-as role for user20. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER20 TO ROLE SWTBER27_USER20_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER20.PUBLIC TO ROLE SWTBER27_USER20_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER20_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER20.PUBLIC TO ROLE SWTBER27_USER20_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER20.PUBLIC TO ROLE SWTBER27_USER20_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER20_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER20
  PASSWORD = 'dKggc2pYOSSa'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER20_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER20_RL TO USER SWTBER27_USER20;

-- ----------------------------------------------------------------------------
-- USER21
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER21
  COMMENT = 'Openflow HoL sandbox for user21. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER21.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER21_RL
  COMMENT = 'Openflow HoL login/execute-as role for user21. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER21 TO ROLE SWTBER27_USER21_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER21.PUBLIC TO ROLE SWTBER27_USER21_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER21_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER21.PUBLIC TO ROLE SWTBER27_USER21_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER21.PUBLIC TO ROLE SWTBER27_USER21_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER21_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER21
  PASSWORD = 'wduj5KWdiqOT'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER21_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER21_RL TO USER SWTBER27_USER21;

-- ----------------------------------------------------------------------------
-- USER22
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER22
  COMMENT = 'Openflow HoL sandbox for user22. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER22.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER22_RL
  COMMENT = 'Openflow HoL login/execute-as role for user22. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER22 TO ROLE SWTBER27_USER22_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER22.PUBLIC TO ROLE SWTBER27_USER22_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER22_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER22.PUBLIC TO ROLE SWTBER27_USER22_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER22.PUBLIC TO ROLE SWTBER27_USER22_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER22_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER22
  PASSWORD = 'myLkF2hoaYCi'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER22_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER22_RL TO USER SWTBER27_USER22;

-- ----------------------------------------------------------------------------
-- USER23
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER23
  COMMENT = 'Openflow HoL sandbox for user23. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER23.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER23_RL
  COMMENT = 'Openflow HoL login/execute-as role for user23. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER23 TO ROLE SWTBER27_USER23_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER23.PUBLIC TO ROLE SWTBER27_USER23_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER23_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER23.PUBLIC TO ROLE SWTBER27_USER23_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER23.PUBLIC TO ROLE SWTBER27_USER23_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER23_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER23
  PASSWORD = 'v8HQ6axTIpmM'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER23_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER23_RL TO USER SWTBER27_USER23;

-- ----------------------------------------------------------------------------
-- USER24
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER24
  COMMENT = 'Openflow HoL sandbox for user24. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER24.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER24_RL
  COMMENT = 'Openflow HoL login/execute-as role for user24. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER24 TO ROLE SWTBER27_USER24_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER24.PUBLIC TO ROLE SWTBER27_USER24_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER24_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER24.PUBLIC TO ROLE SWTBER27_USER24_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER24.PUBLIC TO ROLE SWTBER27_USER24_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER24_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER24
  PASSWORD = '9l5rHJ1VSK4m'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER24_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER24_RL TO USER SWTBER27_USER24;

-- ----------------------------------------------------------------------------
-- USER25
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER25
  COMMENT = 'Openflow HoL sandbox for user25. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER25.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER25_RL
  COMMENT = 'Openflow HoL login/execute-as role for user25. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER25 TO ROLE SWTBER27_USER25_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER25.PUBLIC TO ROLE SWTBER27_USER25_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER25_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER25.PUBLIC TO ROLE SWTBER27_USER25_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER25.PUBLIC TO ROLE SWTBER27_USER25_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER25_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER25
  PASSWORD = 'muv8bTXd8gZ8'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER25_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER25_RL TO USER SWTBER27_USER25;

-- ----------------------------------------------------------------------------
-- USER26
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER26
  COMMENT = 'Openflow HoL sandbox for user26. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER26.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER26_RL
  COMMENT = 'Openflow HoL login/execute-as role for user26. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER26 TO ROLE SWTBER27_USER26_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER26.PUBLIC TO ROLE SWTBER27_USER26_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER26_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER26.PUBLIC TO ROLE SWTBER27_USER26_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER26.PUBLIC TO ROLE SWTBER27_USER26_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER26_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER26
  PASSWORD = 'ZMjoYWluybv6'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER26_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER26_RL TO USER SWTBER27_USER26;

-- ----------------------------------------------------------------------------
-- USER27
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER27
  COMMENT = 'Openflow HoL sandbox for user27. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER27.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER27_RL
  COMMENT = 'Openflow HoL login/execute-as role for user27. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER27 TO ROLE SWTBER27_USER27_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER27.PUBLIC TO ROLE SWTBER27_USER27_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER27_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER27.PUBLIC TO ROLE SWTBER27_USER27_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER27.PUBLIC TO ROLE SWTBER27_USER27_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER27_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER27
  PASSWORD = 'hdIaFWyWrH6n'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER27_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER27_RL TO USER SWTBER27_USER27;

-- ----------------------------------------------------------------------------
-- USER28
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER28
  COMMENT = 'Openflow HoL sandbox for user28. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER28.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER28_RL
  COMMENT = 'Openflow HoL login/execute-as role for user28. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER28 TO ROLE SWTBER27_USER28_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER28.PUBLIC TO ROLE SWTBER27_USER28_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER28_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER28.PUBLIC TO ROLE SWTBER27_USER28_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER28.PUBLIC TO ROLE SWTBER27_USER28_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER28_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER28
  PASSWORD = 'tY6RzlSpfWFL'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER28_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER28_RL TO USER SWTBER27_USER28;

-- ----------------------------------------------------------------------------
-- USER29
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER29
  COMMENT = 'Openflow HoL sandbox for user29. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER29.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER29_RL
  COMMENT = 'Openflow HoL login/execute-as role for user29. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER29 TO ROLE SWTBER27_USER29_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER29.PUBLIC TO ROLE SWTBER27_USER29_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER29_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER29.PUBLIC TO ROLE SWTBER27_USER29_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER29.PUBLIC TO ROLE SWTBER27_USER29_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER29_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER29
  PASSWORD = 'smnpsla8bFBH'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER29_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER29_RL TO USER SWTBER27_USER29;

-- ----------------------------------------------------------------------------
-- USER30
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER30
  COMMENT = 'Openflow HoL sandbox for user30. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER30.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER30_RL
  COMMENT = 'Openflow HoL login/execute-as role for user30. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER30 TO ROLE SWTBER27_USER30_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER30.PUBLIC TO ROLE SWTBER27_USER30_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER30_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER30.PUBLIC TO ROLE SWTBER27_USER30_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER30.PUBLIC TO ROLE SWTBER27_USER30_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER30_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER30
  PASSWORD = 'j6FpNPVrrByd'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER30_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER30_RL TO USER SWTBER27_USER30;

-- ----------------------------------------------------------------------------
-- USER31
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER31
  COMMENT = 'Openflow HoL sandbox for user31. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER31.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER31_RL
  COMMENT = 'Openflow HoL login/execute-as role for user31. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER31 TO ROLE SWTBER27_USER31_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER31.PUBLIC TO ROLE SWTBER27_USER31_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER31_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER31.PUBLIC TO ROLE SWTBER27_USER31_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER31.PUBLIC TO ROLE SWTBER27_USER31_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER31_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER31
  PASSWORD = 'j7zit4vzz5MR'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER31_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER31_RL TO USER SWTBER27_USER31;

-- ----------------------------------------------------------------------------
-- USER32
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER32
  COMMENT = 'Openflow HoL sandbox for user32. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER32.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER32_RL
  COMMENT = 'Openflow HoL login/execute-as role for user32. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER32 TO ROLE SWTBER27_USER32_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER32.PUBLIC TO ROLE SWTBER27_USER32_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER32_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER32.PUBLIC TO ROLE SWTBER27_USER32_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER32.PUBLIC TO ROLE SWTBER27_USER32_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER32_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER32
  PASSWORD = 'jFwXV5xCxfym'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER32_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER32_RL TO USER SWTBER27_USER32;

-- ----------------------------------------------------------------------------
-- USER33
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER33
  COMMENT = 'Openflow HoL sandbox for user33. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER33.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER33_RL
  COMMENT = 'Openflow HoL login/execute-as role for user33. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER33 TO ROLE SWTBER27_USER33_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER33.PUBLIC TO ROLE SWTBER27_USER33_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER33_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER33.PUBLIC TO ROLE SWTBER27_USER33_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER33.PUBLIC TO ROLE SWTBER27_USER33_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER33_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER33
  PASSWORD = 'c26u4E5M9oy0'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER33_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER33_RL TO USER SWTBER27_USER33;

-- ----------------------------------------------------------------------------
-- USER34
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER34
  COMMENT = 'Openflow HoL sandbox for user34. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER34.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER34_RL
  COMMENT = 'Openflow HoL login/execute-as role for user34. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER34 TO ROLE SWTBER27_USER34_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER34.PUBLIC TO ROLE SWTBER27_USER34_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER34_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER34.PUBLIC TO ROLE SWTBER27_USER34_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER34.PUBLIC TO ROLE SWTBER27_USER34_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER34_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER34
  PASSWORD = 'qczR9sg3hmEU'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER34_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER34_RL TO USER SWTBER27_USER34;

-- ----------------------------------------------------------------------------
-- USER35
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER35
  COMMENT = 'Openflow HoL sandbox for user35. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER35.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER35_RL
  COMMENT = 'Openflow HoL login/execute-as role for user35. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER35 TO ROLE SWTBER27_USER35_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER35.PUBLIC TO ROLE SWTBER27_USER35_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER35_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER35.PUBLIC TO ROLE SWTBER27_USER35_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER35.PUBLIC TO ROLE SWTBER27_USER35_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER35_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER35
  PASSWORD = 'ZQ2tMhiDm3c5'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER35_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER35_RL TO USER SWTBER27_USER35;

-- ----------------------------------------------------------------------------
-- USER36
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER36
  COMMENT = 'Openflow HoL sandbox for user36. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER36.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER36_RL
  COMMENT = 'Openflow HoL login/execute-as role for user36. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER36 TO ROLE SWTBER27_USER36_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER36.PUBLIC TO ROLE SWTBER27_USER36_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER36_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER36.PUBLIC TO ROLE SWTBER27_USER36_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER36.PUBLIC TO ROLE SWTBER27_USER36_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER36_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER36
  PASSWORD = 'FPIz8EJsSnSd'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER36_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER36_RL TO USER SWTBER27_USER36;

-- ----------------------------------------------------------------------------
-- USER37
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER37
  COMMENT = 'Openflow HoL sandbox for user37. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER37.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER37_RL
  COMMENT = 'Openflow HoL login/execute-as role for user37. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER37 TO ROLE SWTBER27_USER37_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER37.PUBLIC TO ROLE SWTBER27_USER37_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER37_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER37.PUBLIC TO ROLE SWTBER27_USER37_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER37.PUBLIC TO ROLE SWTBER27_USER37_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER37_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER37
  PASSWORD = 'v2z1FMftv5Cl'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER37_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER37_RL TO USER SWTBER27_USER37;

-- ----------------------------------------------------------------------------
-- USER38
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER38
  COMMENT = 'Openflow HoL sandbox for user38. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER38.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER38_RL
  COMMENT = 'Openflow HoL login/execute-as role for user38. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER38 TO ROLE SWTBER27_USER38_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER38.PUBLIC TO ROLE SWTBER27_USER38_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER38_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER38.PUBLIC TO ROLE SWTBER27_USER38_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER38.PUBLIC TO ROLE SWTBER27_USER38_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER38_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER38
  PASSWORD = 'vHFnKIV1oUCZ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER38_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER38_RL TO USER SWTBER27_USER38;

-- ----------------------------------------------------------------------------
-- USER39
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER39
  COMMENT = 'Openflow HoL sandbox for user39. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER39.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER39_RL
  COMMENT = 'Openflow HoL login/execute-as role for user39. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER39 TO ROLE SWTBER27_USER39_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER39.PUBLIC TO ROLE SWTBER27_USER39_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER39_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER39.PUBLIC TO ROLE SWTBER27_USER39_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER39.PUBLIC TO ROLE SWTBER27_USER39_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER39_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER39
  PASSWORD = 'vboco5xX2qrw'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER39_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER39_RL TO USER SWTBER27_USER39;

-- ----------------------------------------------------------------------------
-- USER40
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER40
  COMMENT = 'Openflow HoL sandbox for user40. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER40.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER40_RL
  COMMENT = 'Openflow HoL login/execute-as role for user40. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER40 TO ROLE SWTBER27_USER40_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER40.PUBLIC TO ROLE SWTBER27_USER40_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER40_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER40.PUBLIC TO ROLE SWTBER27_USER40_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER40.PUBLIC TO ROLE SWTBER27_USER40_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER40_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER40
  PASSWORD = 'Pj7qFejqaKD1'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER40_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER40_RL TO USER SWTBER27_USER40;

-- ----------------------------------------------------------------------------
-- USER41
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER41
  COMMENT = 'Openflow HoL sandbox for user41. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER41.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER41_RL
  COMMENT = 'Openflow HoL login/execute-as role for user41. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER41 TO ROLE SWTBER27_USER41_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER41.PUBLIC TO ROLE SWTBER27_USER41_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER41_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER41.PUBLIC TO ROLE SWTBER27_USER41_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER41.PUBLIC TO ROLE SWTBER27_USER41_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER41_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER41
  PASSWORD = 'WdxVE7HTgukp'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER41_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER41_RL TO USER SWTBER27_USER41;

-- ----------------------------------------------------------------------------
-- USER42
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER42
  COMMENT = 'Openflow HoL sandbox for user42. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER42.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER42_RL
  COMMENT = 'Openflow HoL login/execute-as role for user42. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER42 TO ROLE SWTBER27_USER42_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER42.PUBLIC TO ROLE SWTBER27_USER42_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER42_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER42.PUBLIC TO ROLE SWTBER27_USER42_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER42.PUBLIC TO ROLE SWTBER27_USER42_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER42_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER42
  PASSWORD = 'csGZ8HzMPsmf'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER42_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER42_RL TO USER SWTBER27_USER42;

-- ----------------------------------------------------------------------------
-- USER43
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER43
  COMMENT = 'Openflow HoL sandbox for user43. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER43.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER43_RL
  COMMENT = 'Openflow HoL login/execute-as role for user43. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER43 TO ROLE SWTBER27_USER43_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER43.PUBLIC TO ROLE SWTBER27_USER43_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER43_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER43.PUBLIC TO ROLE SWTBER27_USER43_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER43.PUBLIC TO ROLE SWTBER27_USER43_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER43_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER43
  PASSWORD = '7Ld2NuPtcN3X'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER43_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER43_RL TO USER SWTBER27_USER43;

-- ----------------------------------------------------------------------------
-- USER44
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER44
  COMMENT = 'Openflow HoL sandbox for user44. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER44.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER44_RL
  COMMENT = 'Openflow HoL login/execute-as role for user44. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER44 TO ROLE SWTBER27_USER44_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER44.PUBLIC TO ROLE SWTBER27_USER44_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER44_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER44.PUBLIC TO ROLE SWTBER27_USER44_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER44.PUBLIC TO ROLE SWTBER27_USER44_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER44_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER44
  PASSWORD = 'T6UTtP9RVPkv'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER44_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER44_RL TO USER SWTBER27_USER44;

-- ----------------------------------------------------------------------------
-- USER45
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER45
  COMMENT = 'Openflow HoL sandbox for user45. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER45.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER45_RL
  COMMENT = 'Openflow HoL login/execute-as role for user45. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER45 TO ROLE SWTBER27_USER45_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER45.PUBLIC TO ROLE SWTBER27_USER45_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER45_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER45.PUBLIC TO ROLE SWTBER27_USER45_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER45.PUBLIC TO ROLE SWTBER27_USER45_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER45_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER45
  PASSWORD = 'uRjfZgB7YV1A'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER45_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER45_RL TO USER SWTBER27_USER45;

-- ----------------------------------------------------------------------------
-- USER46
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER46
  COMMENT = 'Openflow HoL sandbox for user46. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER46.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER46_RL
  COMMENT = 'Openflow HoL login/execute-as role for user46. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER46 TO ROLE SWTBER27_USER46_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER46.PUBLIC TO ROLE SWTBER27_USER46_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER46_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER46.PUBLIC TO ROLE SWTBER27_USER46_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER46.PUBLIC TO ROLE SWTBER27_USER46_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER46_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER46
  PASSWORD = 'HoXjysXE0K1t'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER46_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER46_RL TO USER SWTBER27_USER46;

-- ----------------------------------------------------------------------------
-- USER47
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER47
  COMMENT = 'Openflow HoL sandbox for user47. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER47.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER47_RL
  COMMENT = 'Openflow HoL login/execute-as role for user47. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER47 TO ROLE SWTBER27_USER47_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER47.PUBLIC TO ROLE SWTBER27_USER47_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER47_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER47.PUBLIC TO ROLE SWTBER27_USER47_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER47.PUBLIC TO ROLE SWTBER27_USER47_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER47_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER47
  PASSWORD = 'LnCMqAQeqj8x'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER47_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER47_RL TO USER SWTBER27_USER47;

-- ----------------------------------------------------------------------------
-- USER48
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER48
  COMMENT = 'Openflow HoL sandbox for user48. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER48.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER48_RL
  COMMENT = 'Openflow HoL login/execute-as role for user48. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER48 TO ROLE SWTBER27_USER48_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER48.PUBLIC TO ROLE SWTBER27_USER48_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER48_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER48.PUBLIC TO ROLE SWTBER27_USER48_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER48.PUBLIC TO ROLE SWTBER27_USER48_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER48_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER48
  PASSWORD = 'A8zzPc7l9tsg'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER48_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER48_RL TO USER SWTBER27_USER48;

-- ----------------------------------------------------------------------------
-- USER49
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER49
  COMMENT = 'Openflow HoL sandbox for user49. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER49.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER49_RL
  COMMENT = 'Openflow HoL login/execute-as role for user49. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER49 TO ROLE SWTBER27_USER49_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER49.PUBLIC TO ROLE SWTBER27_USER49_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER49_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER49.PUBLIC TO ROLE SWTBER27_USER49_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER49.PUBLIC TO ROLE SWTBER27_USER49_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER49_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER49
  PASSWORD = 'fUFUqpiZ1cL6'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER49_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER49_RL TO USER SWTBER27_USER49;

-- ----------------------------------------------------------------------------
-- USER50
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER50
  COMMENT = 'Openflow HoL sandbox for user50. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER50.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER50_RL
  COMMENT = 'Openflow HoL login/execute-as role for user50. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER50 TO ROLE SWTBER27_USER50_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER50.PUBLIC TO ROLE SWTBER27_USER50_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER50_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER50.PUBLIC TO ROLE SWTBER27_USER50_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER50.PUBLIC TO ROLE SWTBER27_USER50_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER50_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER50
  PASSWORD = 'vulc1lmgbHIU'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER50_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER50_RL TO USER SWTBER27_USER50;

-- ----------------------------------------------------------------------------
-- USER51
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER51
  COMMENT = 'Openflow HoL sandbox for user51. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER51.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER51_RL
  COMMENT = 'Openflow HoL login/execute-as role for user51. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER51 TO ROLE SWTBER27_USER51_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER51.PUBLIC TO ROLE SWTBER27_USER51_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER51_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER51.PUBLIC TO ROLE SWTBER27_USER51_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER51.PUBLIC TO ROLE SWTBER27_USER51_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER51_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER51
  PASSWORD = '5uTowYo8f26N'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER51_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER51_RL TO USER SWTBER27_USER51;

-- ----------------------------------------------------------------------------
-- USER52
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER52
  COMMENT = 'Openflow HoL sandbox for user52. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER52.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER52_RL
  COMMENT = 'Openflow HoL login/execute-as role for user52. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER52 TO ROLE SWTBER27_USER52_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER52.PUBLIC TO ROLE SWTBER27_USER52_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER52_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER52.PUBLIC TO ROLE SWTBER27_USER52_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER52.PUBLIC TO ROLE SWTBER27_USER52_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER52_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER52
  PASSWORD = '1S3NM9DKcDss'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER52_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER52_RL TO USER SWTBER27_USER52;

-- ----------------------------------------------------------------------------
-- USER53
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER53
  COMMENT = 'Openflow HoL sandbox for user53. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER53.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER53_RL
  COMMENT = 'Openflow HoL login/execute-as role for user53. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER53 TO ROLE SWTBER27_USER53_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER53.PUBLIC TO ROLE SWTBER27_USER53_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER53_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER53.PUBLIC TO ROLE SWTBER27_USER53_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER53.PUBLIC TO ROLE SWTBER27_USER53_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER53_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER53
  PASSWORD = 'iiorPy1Lh9R9'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER53_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER53_RL TO USER SWTBER27_USER53;

-- ----------------------------------------------------------------------------
-- USER54
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER54
  COMMENT = 'Openflow HoL sandbox for user54. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER54.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER54_RL
  COMMENT = 'Openflow HoL login/execute-as role for user54. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER54 TO ROLE SWTBER27_USER54_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER54.PUBLIC TO ROLE SWTBER27_USER54_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER54_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER54.PUBLIC TO ROLE SWTBER27_USER54_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER54.PUBLIC TO ROLE SWTBER27_USER54_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER54_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER54
  PASSWORD = '6yFfBkK4jGAj'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER54_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER54_RL TO USER SWTBER27_USER54;

-- ----------------------------------------------------------------------------
-- USER55
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER55
  COMMENT = 'Openflow HoL sandbox for user55. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER55.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER55_RL
  COMMENT = 'Openflow HoL login/execute-as role for user55. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER55 TO ROLE SWTBER27_USER55_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER55.PUBLIC TO ROLE SWTBER27_USER55_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER55_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER55.PUBLIC TO ROLE SWTBER27_USER55_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER55.PUBLIC TO ROLE SWTBER27_USER55_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER55_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER55
  PASSWORD = 'NyFcJr4IroS8'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER55_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER55_RL TO USER SWTBER27_USER55;

-- ----------------------------------------------------------------------------
-- USER56
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER56
  COMMENT = 'Openflow HoL sandbox for user56. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER56.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER56_RL
  COMMENT = 'Openflow HoL login/execute-as role for user56. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER56 TO ROLE SWTBER27_USER56_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER56.PUBLIC TO ROLE SWTBER27_USER56_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER56_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER56.PUBLIC TO ROLE SWTBER27_USER56_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER56.PUBLIC TO ROLE SWTBER27_USER56_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER56_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER56
  PASSWORD = 'fBEUdWu61x11'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER56_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER56_RL TO USER SWTBER27_USER56;

-- ----------------------------------------------------------------------------
-- USER57
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER57
  COMMENT = 'Openflow HoL sandbox for user57. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER57.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER57_RL
  COMMENT = 'Openflow HoL login/execute-as role for user57. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER57 TO ROLE SWTBER27_USER57_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER57.PUBLIC TO ROLE SWTBER27_USER57_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER57_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER57.PUBLIC TO ROLE SWTBER27_USER57_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER57.PUBLIC TO ROLE SWTBER27_USER57_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER57_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER57
  PASSWORD = 'HtVLale6gkw4'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER57_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER57_RL TO USER SWTBER27_USER57;

-- ----------------------------------------------------------------------------
-- USER58
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER58
  COMMENT = 'Openflow HoL sandbox for user58. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER58.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER58_RL
  COMMENT = 'Openflow HoL login/execute-as role for user58. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER58 TO ROLE SWTBER27_USER58_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER58.PUBLIC TO ROLE SWTBER27_USER58_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER58_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER58.PUBLIC TO ROLE SWTBER27_USER58_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER58.PUBLIC TO ROLE SWTBER27_USER58_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER58_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER58
  PASSWORD = 'WjR4O6sU9vrP'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER58_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER58_RL TO USER SWTBER27_USER58;

-- ----------------------------------------------------------------------------
-- USER59
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER59
  COMMENT = 'Openflow HoL sandbox for user59. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER59.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER59_RL
  COMMENT = 'Openflow HoL login/execute-as role for user59. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER59 TO ROLE SWTBER27_USER59_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER59.PUBLIC TO ROLE SWTBER27_USER59_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER59_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER59.PUBLIC TO ROLE SWTBER27_USER59_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER59.PUBLIC TO ROLE SWTBER27_USER59_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER59_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER59
  PASSWORD = '5kjfbCdJB6rL'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER59_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER59_RL TO USER SWTBER27_USER59;

-- ----------------------------------------------------------------------------
-- USER60
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER60
  COMMENT = 'Openflow HoL sandbox for user60. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER60.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER60_RL
  COMMENT = 'Openflow HoL login/execute-as role for user60. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER60 TO ROLE SWTBER27_USER60_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER60.PUBLIC TO ROLE SWTBER27_USER60_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER60_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER60.PUBLIC TO ROLE SWTBER27_USER60_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER60.PUBLIC TO ROLE SWTBER27_USER60_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER60_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER60
  PASSWORD = '8ehTiOTJgDap'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER60_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER60_RL TO USER SWTBER27_USER60;

-- ----------------------------------------------------------------------------
-- USER61
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER61
  COMMENT = 'Openflow HoL sandbox for user61. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER61.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER61_RL
  COMMENT = 'Openflow HoL login/execute-as role for user61. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER61 TO ROLE SWTBER27_USER61_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER61.PUBLIC TO ROLE SWTBER27_USER61_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER61_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER61.PUBLIC TO ROLE SWTBER27_USER61_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER61.PUBLIC TO ROLE SWTBER27_USER61_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER61_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER61
  PASSWORD = 'gj6R81tuJ8Px'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER61_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER61_RL TO USER SWTBER27_USER61;

-- ----------------------------------------------------------------------------
-- USER62
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER62
  COMMENT = 'Openflow HoL sandbox for user62. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER62.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER62_RL
  COMMENT = 'Openflow HoL login/execute-as role for user62. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER62 TO ROLE SWTBER27_USER62_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER62.PUBLIC TO ROLE SWTBER27_USER62_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER62_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER62.PUBLIC TO ROLE SWTBER27_USER62_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER62.PUBLIC TO ROLE SWTBER27_USER62_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER62_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER62
  PASSWORD = '8DBLiXjcHEi0'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER62_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER62_RL TO USER SWTBER27_USER62;

-- ----------------------------------------------------------------------------
-- USER63
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER63
  COMMENT = 'Openflow HoL sandbox for user63. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER63.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER63_RL
  COMMENT = 'Openflow HoL login/execute-as role for user63. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER63 TO ROLE SWTBER27_USER63_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER63.PUBLIC TO ROLE SWTBER27_USER63_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER63_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER63.PUBLIC TO ROLE SWTBER27_USER63_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER63.PUBLIC TO ROLE SWTBER27_USER63_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER63_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER63
  PASSWORD = '4KLEWyB9lezQ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER63_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER63_RL TO USER SWTBER27_USER63;

-- ----------------------------------------------------------------------------
-- USER64
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER64
  COMMENT = 'Openflow HoL sandbox for user64. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER64.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER64_RL
  COMMENT = 'Openflow HoL login/execute-as role for user64. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER64 TO ROLE SWTBER27_USER64_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER64.PUBLIC TO ROLE SWTBER27_USER64_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER64_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER64.PUBLIC TO ROLE SWTBER27_USER64_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER64.PUBLIC TO ROLE SWTBER27_USER64_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER64_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER64
  PASSWORD = 'syHpltzcr0ob'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER64_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER64_RL TO USER SWTBER27_USER64;

-- ----------------------------------------------------------------------------
-- USER65
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER65
  COMMENT = 'Openflow HoL sandbox for user65. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER65.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER65_RL
  COMMENT = 'Openflow HoL login/execute-as role for user65. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER65 TO ROLE SWTBER27_USER65_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER65.PUBLIC TO ROLE SWTBER27_USER65_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER65_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER65.PUBLIC TO ROLE SWTBER27_USER65_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER65.PUBLIC TO ROLE SWTBER27_USER65_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER65_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER65
  PASSWORD = 'Zwgab5ydwjqq'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER65_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER65_RL TO USER SWTBER27_USER65;

-- ----------------------------------------------------------------------------
-- USER66
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER66
  COMMENT = 'Openflow HoL sandbox for user66. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER66.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER66_RL
  COMMENT = 'Openflow HoL login/execute-as role for user66. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER66 TO ROLE SWTBER27_USER66_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER66.PUBLIC TO ROLE SWTBER27_USER66_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER66_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER66.PUBLIC TO ROLE SWTBER27_USER66_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER66.PUBLIC TO ROLE SWTBER27_USER66_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER66_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER66
  PASSWORD = 'bte8fTkPKtSG'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER66_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER66_RL TO USER SWTBER27_USER66;

-- ----------------------------------------------------------------------------
-- USER67
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER67
  COMMENT = 'Openflow HoL sandbox for user67. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER67.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER67_RL
  COMMENT = 'Openflow HoL login/execute-as role for user67. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER67 TO ROLE SWTBER27_USER67_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER67.PUBLIC TO ROLE SWTBER27_USER67_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER67_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER67.PUBLIC TO ROLE SWTBER27_USER67_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER67.PUBLIC TO ROLE SWTBER27_USER67_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER67_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER67
  PASSWORD = 'avU4vryQe8vk'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER67_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER67_RL TO USER SWTBER27_USER67;

-- ----------------------------------------------------------------------------
-- USER68
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER68
  COMMENT = 'Openflow HoL sandbox for user68. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER68.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER68_RL
  COMMENT = 'Openflow HoL login/execute-as role for user68. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER68 TO ROLE SWTBER27_USER68_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER68.PUBLIC TO ROLE SWTBER27_USER68_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER68_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER68.PUBLIC TO ROLE SWTBER27_USER68_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER68.PUBLIC TO ROLE SWTBER27_USER68_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER68_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER68
  PASSWORD = 'Ydgk6dSiSHqJ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER68_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER68_RL TO USER SWTBER27_USER68;

-- ----------------------------------------------------------------------------
-- USER69
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER69
  COMMENT = 'Openflow HoL sandbox for user69. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER69.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER69_RL
  COMMENT = 'Openflow HoL login/execute-as role for user69. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER69 TO ROLE SWTBER27_USER69_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER69.PUBLIC TO ROLE SWTBER27_USER69_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER69_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER69.PUBLIC TO ROLE SWTBER27_USER69_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER69.PUBLIC TO ROLE SWTBER27_USER69_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER69_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER69
  PASSWORD = 'UJjhEWbUV3x9'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER69_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER69_RL TO USER SWTBER27_USER69;

-- ----------------------------------------------------------------------------
-- USER70
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER70
  COMMENT = 'Openflow HoL sandbox for user70. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER70.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER70_RL
  COMMENT = 'Openflow HoL login/execute-as role for user70. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER70 TO ROLE SWTBER27_USER70_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER70.PUBLIC TO ROLE SWTBER27_USER70_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER70_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER70.PUBLIC TO ROLE SWTBER27_USER70_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER70.PUBLIC TO ROLE SWTBER27_USER70_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER70_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER70
  PASSWORD = '240zTwIH3kW8'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER70_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER70_RL TO USER SWTBER27_USER70;

-- ----------------------------------------------------------------------------
-- USER71
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER71
  COMMENT = 'Openflow HoL sandbox for user71. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER71.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER71_RL
  COMMENT = 'Openflow HoL login/execute-as role for user71. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER71 TO ROLE SWTBER27_USER71_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER71.PUBLIC TO ROLE SWTBER27_USER71_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER71_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER71.PUBLIC TO ROLE SWTBER27_USER71_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER71.PUBLIC TO ROLE SWTBER27_USER71_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER71_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER71
  PASSWORD = '2ePKdNfUBk0c'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER71_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER71_RL TO USER SWTBER27_USER71;

-- ----------------------------------------------------------------------------
-- USER72
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER72
  COMMENT = 'Openflow HoL sandbox for user72. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER72.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER72_RL
  COMMENT = 'Openflow HoL login/execute-as role for user72. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER72 TO ROLE SWTBER27_USER72_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER72.PUBLIC TO ROLE SWTBER27_USER72_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER72_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER72.PUBLIC TO ROLE SWTBER27_USER72_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER72.PUBLIC TO ROLE SWTBER27_USER72_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER72_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER72
  PASSWORD = 'eAvjRI1FTmpl'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER72_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER72_RL TO USER SWTBER27_USER72;

-- ----------------------------------------------------------------------------
-- USER73
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER73
  COMMENT = 'Openflow HoL sandbox for user73. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER73.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER73_RL
  COMMENT = 'Openflow HoL login/execute-as role for user73. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER73 TO ROLE SWTBER27_USER73_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER73.PUBLIC TO ROLE SWTBER27_USER73_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER73_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER73.PUBLIC TO ROLE SWTBER27_USER73_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER73.PUBLIC TO ROLE SWTBER27_USER73_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER73_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER73
  PASSWORD = 'Q3zv5OiVpNCi'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER73_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER73_RL TO USER SWTBER27_USER73;

-- ----------------------------------------------------------------------------
-- USER74
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER74
  COMMENT = 'Openflow HoL sandbox for user74. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER74.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER74_RL
  COMMENT = 'Openflow HoL login/execute-as role for user74. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER74 TO ROLE SWTBER27_USER74_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER74.PUBLIC TO ROLE SWTBER27_USER74_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER74_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER74.PUBLIC TO ROLE SWTBER27_USER74_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER74.PUBLIC TO ROLE SWTBER27_USER74_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER74_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER74
  PASSWORD = 'YsFJQ4g7S9Pv'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER74_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER74_RL TO USER SWTBER27_USER74;

-- ----------------------------------------------------------------------------
-- USER75
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER75
  COMMENT = 'Openflow HoL sandbox for user75. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER75.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER75_RL
  COMMENT = 'Openflow HoL login/execute-as role for user75. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER75 TO ROLE SWTBER27_USER75_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER75.PUBLIC TO ROLE SWTBER27_USER75_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER75_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER75.PUBLIC TO ROLE SWTBER27_USER75_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER75.PUBLIC TO ROLE SWTBER27_USER75_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER75_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER75
  PASSWORD = 'Fx5E30a0mi2U'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER75_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER75_RL TO USER SWTBER27_USER75;

-- ----------------------------------------------------------------------------
-- USER76
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER76
  COMMENT = 'Openflow HoL sandbox for user76. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER76.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER76_RL
  COMMENT = 'Openflow HoL login/execute-as role for user76. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER76 TO ROLE SWTBER27_USER76_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER76.PUBLIC TO ROLE SWTBER27_USER76_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER76_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER76.PUBLIC TO ROLE SWTBER27_USER76_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER76.PUBLIC TO ROLE SWTBER27_USER76_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER76_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER76
  PASSWORD = 'EbD3jRLhahQI'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER76_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER76_RL TO USER SWTBER27_USER76;

-- ----------------------------------------------------------------------------
-- USER77
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER77
  COMMENT = 'Openflow HoL sandbox for user77. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER77.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER77_RL
  COMMENT = 'Openflow HoL login/execute-as role for user77. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER77 TO ROLE SWTBER27_USER77_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER77.PUBLIC TO ROLE SWTBER27_USER77_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER77_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER77.PUBLIC TO ROLE SWTBER27_USER77_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER77.PUBLIC TO ROLE SWTBER27_USER77_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER77_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER77
  PASSWORD = 'XsV3kntsc54g'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER77_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER77_RL TO USER SWTBER27_USER77;

-- ----------------------------------------------------------------------------
-- USER78
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER78
  COMMENT = 'Openflow HoL sandbox for user78. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER78.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER78_RL
  COMMENT = 'Openflow HoL login/execute-as role for user78. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER78 TO ROLE SWTBER27_USER78_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER78.PUBLIC TO ROLE SWTBER27_USER78_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER78_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER78.PUBLIC TO ROLE SWTBER27_USER78_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER78.PUBLIC TO ROLE SWTBER27_USER78_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER78_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER78
  PASSWORD = 'piq2U32ISLBv'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER78_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER78_RL TO USER SWTBER27_USER78;

-- ----------------------------------------------------------------------------
-- USER79
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER79
  COMMENT = 'Openflow HoL sandbox for user79. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER79.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER79_RL
  COMMENT = 'Openflow HoL login/execute-as role for user79. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER79 TO ROLE SWTBER27_USER79_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER79.PUBLIC TO ROLE SWTBER27_USER79_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER79_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER79.PUBLIC TO ROLE SWTBER27_USER79_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER79.PUBLIC TO ROLE SWTBER27_USER79_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER79_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER79
  PASSWORD = 'rwOkKFz76nEl'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER79_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER79_RL TO USER SWTBER27_USER79;

-- ----------------------------------------------------------------------------
-- USER80
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER80
  COMMENT = 'Openflow HoL sandbox for user80. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER80.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER80_RL
  COMMENT = 'Openflow HoL login/execute-as role for user80. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER80 TO ROLE SWTBER27_USER80_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER80.PUBLIC TO ROLE SWTBER27_USER80_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER80_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER80.PUBLIC TO ROLE SWTBER27_USER80_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER80.PUBLIC TO ROLE SWTBER27_USER80_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER80_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER80
  PASSWORD = 'i8r3uGMkRy3o'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER80_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER80_RL TO USER SWTBER27_USER80;

-- ----------------------------------------------------------------------------
-- USER81
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER81
  COMMENT = 'Openflow HoL sandbox for user81. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER81.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER81_RL
  COMMENT = 'Openflow HoL login/execute-as role for user81. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER81 TO ROLE SWTBER27_USER81_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER81.PUBLIC TO ROLE SWTBER27_USER81_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER81_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER81.PUBLIC TO ROLE SWTBER27_USER81_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER81.PUBLIC TO ROLE SWTBER27_USER81_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER81_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER81
  PASSWORD = 'Y8GIuwiEfSc0'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER81_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER81_RL TO USER SWTBER27_USER81;

-- ----------------------------------------------------------------------------
-- USER82
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER82
  COMMENT = 'Openflow HoL sandbox for user82. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER82.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER82_RL
  COMMENT = 'Openflow HoL login/execute-as role for user82. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER82 TO ROLE SWTBER27_USER82_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER82.PUBLIC TO ROLE SWTBER27_USER82_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER82_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER82.PUBLIC TO ROLE SWTBER27_USER82_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER82.PUBLIC TO ROLE SWTBER27_USER82_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER82_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER82
  PASSWORD = 'Q4JK6nJYJ5uU'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER82_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER82_RL TO USER SWTBER27_USER82;

-- ----------------------------------------------------------------------------
-- USER83
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER83
  COMMENT = 'Openflow HoL sandbox for user83. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER83.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER83_RL
  COMMENT = 'Openflow HoL login/execute-as role for user83. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER83 TO ROLE SWTBER27_USER83_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER83.PUBLIC TO ROLE SWTBER27_USER83_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER83_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER83.PUBLIC TO ROLE SWTBER27_USER83_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER83.PUBLIC TO ROLE SWTBER27_USER83_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER83_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER83
  PASSWORD = 'OT48mje9QxTp'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER83_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER83_RL TO USER SWTBER27_USER83;

-- ----------------------------------------------------------------------------
-- USER84
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER84
  COMMENT = 'Openflow HoL sandbox for user84. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER84.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER84_RL
  COMMENT = 'Openflow HoL login/execute-as role for user84. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER84 TO ROLE SWTBER27_USER84_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER84.PUBLIC TO ROLE SWTBER27_USER84_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER84_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER84.PUBLIC TO ROLE SWTBER27_USER84_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER84.PUBLIC TO ROLE SWTBER27_USER84_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER84_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER84
  PASSWORD = '0raGCQR5ZM3q'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER84_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER84_RL TO USER SWTBER27_USER84;

-- ----------------------------------------------------------------------------
-- USER85
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER85
  COMMENT = 'Openflow HoL sandbox for user85. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER85.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER85_RL
  COMMENT = 'Openflow HoL login/execute-as role for user85. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER85 TO ROLE SWTBER27_USER85_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER85.PUBLIC TO ROLE SWTBER27_USER85_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER85_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER85.PUBLIC TO ROLE SWTBER27_USER85_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER85.PUBLIC TO ROLE SWTBER27_USER85_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER85_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER85
  PASSWORD = 'huwwW2yFtUJr'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER85_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER85_RL TO USER SWTBER27_USER85;

-- ----------------------------------------------------------------------------
-- USER86
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER86
  COMMENT = 'Openflow HoL sandbox for user86. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER86.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER86_RL
  COMMENT = 'Openflow HoL login/execute-as role for user86. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER86 TO ROLE SWTBER27_USER86_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER86.PUBLIC TO ROLE SWTBER27_USER86_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER86_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER86.PUBLIC TO ROLE SWTBER27_USER86_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER86.PUBLIC TO ROLE SWTBER27_USER86_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER86_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER86
  PASSWORD = '9bnHq87LGAyu'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER86_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER86_RL TO USER SWTBER27_USER86;

-- ----------------------------------------------------------------------------
-- USER87
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER87
  COMMENT = 'Openflow HoL sandbox for user87. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER87.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER87_RL
  COMMENT = 'Openflow HoL login/execute-as role for user87. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER87 TO ROLE SWTBER27_USER87_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER87.PUBLIC TO ROLE SWTBER27_USER87_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER87_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER87.PUBLIC TO ROLE SWTBER27_USER87_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER87.PUBLIC TO ROLE SWTBER27_USER87_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER87_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER87
  PASSWORD = 'S72xmP82bl7Q'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER87_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER87_RL TO USER SWTBER27_USER87;

-- ----------------------------------------------------------------------------
-- USER88
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER88
  COMMENT = 'Openflow HoL sandbox for user88. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER88.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER88_RL
  COMMENT = 'Openflow HoL login/execute-as role for user88. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER88 TO ROLE SWTBER27_USER88_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER88.PUBLIC TO ROLE SWTBER27_USER88_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER88_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER88.PUBLIC TO ROLE SWTBER27_USER88_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER88.PUBLIC TO ROLE SWTBER27_USER88_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER88_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER88
  PASSWORD = 'F2DereInCWms'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER88_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER88_RL TO USER SWTBER27_USER88;

-- ----------------------------------------------------------------------------
-- USER89
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER89
  COMMENT = 'Openflow HoL sandbox for user89. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER89.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER89_RL
  COMMENT = 'Openflow HoL login/execute-as role for user89. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER89 TO ROLE SWTBER27_USER89_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER89.PUBLIC TO ROLE SWTBER27_USER89_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER89_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER89.PUBLIC TO ROLE SWTBER27_USER89_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER89.PUBLIC TO ROLE SWTBER27_USER89_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER89_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER89
  PASSWORD = '89QXpj5C657S'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER89_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER89_RL TO USER SWTBER27_USER89;

-- ----------------------------------------------------------------------------
-- USER90
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER90
  COMMENT = 'Openflow HoL sandbox for user90. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER90.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER90_RL
  COMMENT = 'Openflow HoL login/execute-as role for user90. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER90 TO ROLE SWTBER27_USER90_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER90.PUBLIC TO ROLE SWTBER27_USER90_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER90_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER90.PUBLIC TO ROLE SWTBER27_USER90_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER90.PUBLIC TO ROLE SWTBER27_USER90_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER90_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER90
  PASSWORD = 'XB2bHd7zY8Xo'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER90_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER90_RL TO USER SWTBER27_USER90;

-- ----------------------------------------------------------------------------
-- USER91
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER91
  COMMENT = 'Openflow HoL sandbox for user91. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER91.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER91_RL
  COMMENT = 'Openflow HoL login/execute-as role for user91. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER91 TO ROLE SWTBER27_USER91_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER91.PUBLIC TO ROLE SWTBER27_USER91_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER91_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER91.PUBLIC TO ROLE SWTBER27_USER91_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER91.PUBLIC TO ROLE SWTBER27_USER91_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER91_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER91
  PASSWORD = 'v8N8bi8Fnb1i'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER91_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER91_RL TO USER SWTBER27_USER91;

-- ----------------------------------------------------------------------------
-- USER92
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER92
  COMMENT = 'Openflow HoL sandbox for user92. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER92.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER92_RL
  COMMENT = 'Openflow HoL login/execute-as role for user92. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER92 TO ROLE SWTBER27_USER92_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER92.PUBLIC TO ROLE SWTBER27_USER92_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER92_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER92.PUBLIC TO ROLE SWTBER27_USER92_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER92.PUBLIC TO ROLE SWTBER27_USER92_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER92_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER92
  PASSWORD = '8FPfCUmu57Jq'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER92_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER92_RL TO USER SWTBER27_USER92;

-- ----------------------------------------------------------------------------
-- USER93
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER93
  COMMENT = 'Openflow HoL sandbox for user93. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER93.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER93_RL
  COMMENT = 'Openflow HoL login/execute-as role for user93. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER93 TO ROLE SWTBER27_USER93_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER93.PUBLIC TO ROLE SWTBER27_USER93_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER93_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER93.PUBLIC TO ROLE SWTBER27_USER93_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER93.PUBLIC TO ROLE SWTBER27_USER93_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER93_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER93
  PASSWORD = 'YXuufpkQfkn7'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER93_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER93_RL TO USER SWTBER27_USER93;

-- ----------------------------------------------------------------------------
-- USER94
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER94
  COMMENT = 'Openflow HoL sandbox for user94. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER94.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER94_RL
  COMMENT = 'Openflow HoL login/execute-as role for user94. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER94 TO ROLE SWTBER27_USER94_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER94.PUBLIC TO ROLE SWTBER27_USER94_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER94_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER94.PUBLIC TO ROLE SWTBER27_USER94_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER94.PUBLIC TO ROLE SWTBER27_USER94_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER94_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER94
  PASSWORD = 'Iaph4D3nLAJK'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER94_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER94_RL TO USER SWTBER27_USER94;

-- ----------------------------------------------------------------------------
-- USER95
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER95
  COMMENT = 'Openflow HoL sandbox for user95. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER95.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER95_RL
  COMMENT = 'Openflow HoL login/execute-as role for user95. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER95 TO ROLE SWTBER27_USER95_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER95.PUBLIC TO ROLE SWTBER27_USER95_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER95_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER95.PUBLIC TO ROLE SWTBER27_USER95_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER95.PUBLIC TO ROLE SWTBER27_USER95_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER95_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER95
  PASSWORD = 'jVBc1NqynpKn'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER95_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER95_RL TO USER SWTBER27_USER95;

-- ----------------------------------------------------------------------------
-- USER96
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER96
  COMMENT = 'Openflow HoL sandbox for user96. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER96.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER96_RL
  COMMENT = 'Openflow HoL login/execute-as role for user96. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER96 TO ROLE SWTBER27_USER96_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER96.PUBLIC TO ROLE SWTBER27_USER96_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER96_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER96.PUBLIC TO ROLE SWTBER27_USER96_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER96.PUBLIC TO ROLE SWTBER27_USER96_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER96_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER96
  PASSWORD = 'fi2MwGfjjt3a'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER96_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER96_RL TO USER SWTBER27_USER96;

-- ----------------------------------------------------------------------------
-- USER97
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER97
  COMMENT = 'Openflow HoL sandbox for user97. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER97.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER97_RL
  COMMENT = 'Openflow HoL login/execute-as role for user97. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER97 TO ROLE SWTBER27_USER97_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER97.PUBLIC TO ROLE SWTBER27_USER97_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER97_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER97.PUBLIC TO ROLE SWTBER27_USER97_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER97.PUBLIC TO ROLE SWTBER27_USER97_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER97_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER97
  PASSWORD = 'hraS99lhDnUe'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER97_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER97_RL TO USER SWTBER27_USER97;

-- ----------------------------------------------------------------------------
-- USER98
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER98
  COMMENT = 'Openflow HoL sandbox for user98. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER98.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER98_RL
  COMMENT = 'Openflow HoL login/execute-as role for user98. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER98 TO ROLE SWTBER27_USER98_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER98.PUBLIC TO ROLE SWTBER27_USER98_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER98_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER98.PUBLIC TO ROLE SWTBER27_USER98_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER98.PUBLIC TO ROLE SWTBER27_USER98_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER98_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER98
  PASSWORD = 'DOCoJ9QGktGe'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER98_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER98_RL TO USER SWTBER27_USER98;

-- ----------------------------------------------------------------------------
-- USER99
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER99
  COMMENT = 'Openflow HoL sandbox for user99. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER99.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER99_RL
  COMMENT = 'Openflow HoL login/execute-as role for user99. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER99 TO ROLE SWTBER27_USER99_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER99.PUBLIC TO ROLE SWTBER27_USER99_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER99_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER99.PUBLIC TO ROLE SWTBER27_USER99_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER99.PUBLIC TO ROLE SWTBER27_USER99_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER99_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER99
  PASSWORD = 'Dd5LBTra34P4'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER99_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER99_RL TO USER SWTBER27_USER99;

-- ----------------------------------------------------------------------------
-- USER100
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER100
  COMMENT = 'Openflow HoL sandbox for user100. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER100.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER100_RL
  COMMENT = 'Openflow HoL login/execute-as role for user100. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER100 TO ROLE SWTBER27_USER100_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER100.PUBLIC TO ROLE SWTBER27_USER100_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER100_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER100.PUBLIC TO ROLE SWTBER27_USER100_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER100.PUBLIC TO ROLE SWTBER27_USER100_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER100_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER100
  PASSWORD = 'JpDbrU0rcMtC'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER100_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER100_RL TO USER SWTBER27_USER100;

-- ----------------------------------------------------------------------------
-- USER101
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER101
  COMMENT = 'Openflow HoL sandbox for user101. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER101.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER101_RL
  COMMENT = 'Openflow HoL login/execute-as role for user101. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER101 TO ROLE SWTBER27_USER101_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER101.PUBLIC TO ROLE SWTBER27_USER101_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER101_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER101.PUBLIC TO ROLE SWTBER27_USER101_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER101.PUBLIC TO ROLE SWTBER27_USER101_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER101_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER101
  PASSWORD = 'do64UpoxtfXA'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER101_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER101_RL TO USER SWTBER27_USER101;

-- ----------------------------------------------------------------------------
-- USER102
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER102
  COMMENT = 'Openflow HoL sandbox for user102. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER102.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER102_RL
  COMMENT = 'Openflow HoL login/execute-as role for user102. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER102 TO ROLE SWTBER27_USER102_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER102.PUBLIC TO ROLE SWTBER27_USER102_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER102_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER102.PUBLIC TO ROLE SWTBER27_USER102_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER102.PUBLIC TO ROLE SWTBER27_USER102_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER102_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER102
  PASSWORD = 'qPICRPwH3uep'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER102_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER102_RL TO USER SWTBER27_USER102;

-- ----------------------------------------------------------------------------
-- USER103
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER103
  COMMENT = 'Openflow HoL sandbox for user103. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER103.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER103_RL
  COMMENT = 'Openflow HoL login/execute-as role for user103. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER103 TO ROLE SWTBER27_USER103_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER103.PUBLIC TO ROLE SWTBER27_USER103_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER103_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER103.PUBLIC TO ROLE SWTBER27_USER103_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER103.PUBLIC TO ROLE SWTBER27_USER103_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER103_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER103
  PASSWORD = 'OEXWyX13NSgf'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER103_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER103_RL TO USER SWTBER27_USER103;

-- ----------------------------------------------------------------------------
-- USER104
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER104
  COMMENT = 'Openflow HoL sandbox for user104. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER104.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER104_RL
  COMMENT = 'Openflow HoL login/execute-as role for user104. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER104 TO ROLE SWTBER27_USER104_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER104.PUBLIC TO ROLE SWTBER27_USER104_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER104_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER104.PUBLIC TO ROLE SWTBER27_USER104_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER104.PUBLIC TO ROLE SWTBER27_USER104_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER104_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER104
  PASSWORD = 'nwoBySKzZ3KI'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER104_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER104_RL TO USER SWTBER27_USER104;

-- ----------------------------------------------------------------------------
-- USER105
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER105
  COMMENT = 'Openflow HoL sandbox for user105. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER105.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER105_RL
  COMMENT = 'Openflow HoL login/execute-as role for user105. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER105 TO ROLE SWTBER27_USER105_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER105.PUBLIC TO ROLE SWTBER27_USER105_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER105_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER105.PUBLIC TO ROLE SWTBER27_USER105_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER105.PUBLIC TO ROLE SWTBER27_USER105_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER105_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER105
  PASSWORD = 'koErIw3iNwwQ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER105_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER105_RL TO USER SWTBER27_USER105;

-- ----------------------------------------------------------------------------
-- USER106
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER106
  COMMENT = 'Openflow HoL sandbox for user106. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER106.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER106_RL
  COMMENT = 'Openflow HoL login/execute-as role for user106. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER106 TO ROLE SWTBER27_USER106_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER106.PUBLIC TO ROLE SWTBER27_USER106_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER106_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER106.PUBLIC TO ROLE SWTBER27_USER106_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER106.PUBLIC TO ROLE SWTBER27_USER106_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER106_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER106
  PASSWORD = '7MOB8x08Da6D'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER106_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER106_RL TO USER SWTBER27_USER106;

-- ----------------------------------------------------------------------------
-- USER107
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER107
  COMMENT = 'Openflow HoL sandbox for user107. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER107.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER107_RL
  COMMENT = 'Openflow HoL login/execute-as role for user107. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER107 TO ROLE SWTBER27_USER107_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER107.PUBLIC TO ROLE SWTBER27_USER107_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER107_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER107.PUBLIC TO ROLE SWTBER27_USER107_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER107.PUBLIC TO ROLE SWTBER27_USER107_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER107_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER107
  PASSWORD = 'abkqW57Y6tWl'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER107_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER107_RL TO USER SWTBER27_USER107;

-- ----------------------------------------------------------------------------
-- USER108
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER108
  COMMENT = 'Openflow HoL sandbox for user108. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER108.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER108_RL
  COMMENT = 'Openflow HoL login/execute-as role for user108. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER108 TO ROLE SWTBER27_USER108_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER108.PUBLIC TO ROLE SWTBER27_USER108_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER108_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER108.PUBLIC TO ROLE SWTBER27_USER108_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER108.PUBLIC TO ROLE SWTBER27_USER108_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER108_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER108
  PASSWORD = 'CORwHhPo2OAJ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER108_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER108_RL TO USER SWTBER27_USER108;

-- ----------------------------------------------------------------------------
-- USER109
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER109
  COMMENT = 'Openflow HoL sandbox for user109. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER109.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER109_RL
  COMMENT = 'Openflow HoL login/execute-as role for user109. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER109 TO ROLE SWTBER27_USER109_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER109.PUBLIC TO ROLE SWTBER27_USER109_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER109_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER109.PUBLIC TO ROLE SWTBER27_USER109_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER109.PUBLIC TO ROLE SWTBER27_USER109_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER109_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER109
  PASSWORD = 'RExAo8H3kAyu'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER109_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER109_RL TO USER SWTBER27_USER109;

-- ----------------------------------------------------------------------------
-- USER110
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER110
  COMMENT = 'Openflow HoL sandbox for user110. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER110.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER110_RL
  COMMENT = 'Openflow HoL login/execute-as role for user110. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER110 TO ROLE SWTBER27_USER110_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER110.PUBLIC TO ROLE SWTBER27_USER110_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER110_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER110.PUBLIC TO ROLE SWTBER27_USER110_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER110.PUBLIC TO ROLE SWTBER27_USER110_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER110_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER110
  PASSWORD = 'CEBHjJxScR7i'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER110_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER110_RL TO USER SWTBER27_USER110;

-- ----------------------------------------------------------------------------
-- USER111
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER111
  COMMENT = 'Openflow HoL sandbox for user111. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER111.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER111_RL
  COMMENT = 'Openflow HoL login/execute-as role for user111. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER111 TO ROLE SWTBER27_USER111_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER111.PUBLIC TO ROLE SWTBER27_USER111_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER111_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER111.PUBLIC TO ROLE SWTBER27_USER111_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER111.PUBLIC TO ROLE SWTBER27_USER111_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER111_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER111
  PASSWORD = '99G01mmtih2r'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER111_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER111_RL TO USER SWTBER27_USER111;

-- ----------------------------------------------------------------------------
-- USER112
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER112
  COMMENT = 'Openflow HoL sandbox for user112. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER112.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER112_RL
  COMMENT = 'Openflow HoL login/execute-as role for user112. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER112 TO ROLE SWTBER27_USER112_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER112.PUBLIC TO ROLE SWTBER27_USER112_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER112_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER112.PUBLIC TO ROLE SWTBER27_USER112_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER112.PUBLIC TO ROLE SWTBER27_USER112_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER112_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER112
  PASSWORD = 'Lz3jGbLHDhAW'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER112_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER112_RL TO USER SWTBER27_USER112;

-- ----------------------------------------------------------------------------
-- USER113
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER113
  COMMENT = 'Openflow HoL sandbox for user113. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER113.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER113_RL
  COMMENT = 'Openflow HoL login/execute-as role for user113. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER113 TO ROLE SWTBER27_USER113_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER113.PUBLIC TO ROLE SWTBER27_USER113_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER113_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER113.PUBLIC TO ROLE SWTBER27_USER113_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER113.PUBLIC TO ROLE SWTBER27_USER113_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER113_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER113
  PASSWORD = 'bLeCRD8DAy9G'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER113_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER113_RL TO USER SWTBER27_USER113;

-- ----------------------------------------------------------------------------
-- USER114
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER114
  COMMENT = 'Openflow HoL sandbox for user114. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER114.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER114_RL
  COMMENT = 'Openflow HoL login/execute-as role for user114. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER114 TO ROLE SWTBER27_USER114_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER114.PUBLIC TO ROLE SWTBER27_USER114_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER114_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER114.PUBLIC TO ROLE SWTBER27_USER114_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER114.PUBLIC TO ROLE SWTBER27_USER114_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER114_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER114
  PASSWORD = 'hwvJUnyR59NZ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER114_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER114_RL TO USER SWTBER27_USER114;

-- ----------------------------------------------------------------------------
-- USER115
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER115
  COMMENT = 'Openflow HoL sandbox for user115. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER115.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER115_RL
  COMMENT = 'Openflow HoL login/execute-as role for user115. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER115 TO ROLE SWTBER27_USER115_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER115.PUBLIC TO ROLE SWTBER27_USER115_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER115_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER115.PUBLIC TO ROLE SWTBER27_USER115_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER115.PUBLIC TO ROLE SWTBER27_USER115_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER115_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER115
  PASSWORD = 'whad2ei4RAm6'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER115_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER115_RL TO USER SWTBER27_USER115;

-- ----------------------------------------------------------------------------
-- USER116
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER116
  COMMENT = 'Openflow HoL sandbox for user116. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER116.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER116_RL
  COMMENT = 'Openflow HoL login/execute-as role for user116. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER116 TO ROLE SWTBER27_USER116_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER116.PUBLIC TO ROLE SWTBER27_USER116_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER116_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER116.PUBLIC TO ROLE SWTBER27_USER116_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER116.PUBLIC TO ROLE SWTBER27_USER116_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER116_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER116
  PASSWORD = 'FoFdMLZ3kRM3'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER116_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER116_RL TO USER SWTBER27_USER116;

-- ----------------------------------------------------------------------------
-- USER117
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER117
  COMMENT = 'Openflow HoL sandbox for user117. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER117.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER117_RL
  COMMENT = 'Openflow HoL login/execute-as role for user117. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER117 TO ROLE SWTBER27_USER117_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER117.PUBLIC TO ROLE SWTBER27_USER117_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER117_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER117.PUBLIC TO ROLE SWTBER27_USER117_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER117.PUBLIC TO ROLE SWTBER27_USER117_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER117_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER117
  PASSWORD = 'SgMeeDZncx9z'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER117_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER117_RL TO USER SWTBER27_USER117;

-- ----------------------------------------------------------------------------
-- USER118
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER118
  COMMENT = 'Openflow HoL sandbox for user118. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER118.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER118_RL
  COMMENT = 'Openflow HoL login/execute-as role for user118. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER118 TO ROLE SWTBER27_USER118_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER118.PUBLIC TO ROLE SWTBER27_USER118_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER118_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER118.PUBLIC TO ROLE SWTBER27_USER118_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER118.PUBLIC TO ROLE SWTBER27_USER118_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER118_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER118
  PASSWORD = '4UDsIhq3hR6w'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER118_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER118_RL TO USER SWTBER27_USER118;

-- ----------------------------------------------------------------------------
-- USER119
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER119
  COMMENT = 'Openflow HoL sandbox for user119. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER119.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER119_RL
  COMMENT = 'Openflow HoL login/execute-as role for user119. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER119 TO ROLE SWTBER27_USER119_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER119.PUBLIC TO ROLE SWTBER27_USER119_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER119_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER119.PUBLIC TO ROLE SWTBER27_USER119_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER119.PUBLIC TO ROLE SWTBER27_USER119_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER119_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER119
  PASSWORD = 'VgtO7uNdjGeQ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER119_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER119_RL TO USER SWTBER27_USER119;

-- ----------------------------------------------------------------------------
-- USER120
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER120
  COMMENT = 'Openflow HoL sandbox for user120. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER120.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER120_RL
  COMMENT = 'Openflow HoL login/execute-as role for user120. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER120 TO ROLE SWTBER27_USER120_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER120.PUBLIC TO ROLE SWTBER27_USER120_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER120_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER120.PUBLIC TO ROLE SWTBER27_USER120_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER120.PUBLIC TO ROLE SWTBER27_USER120_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER120_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER120
  PASSWORD = 'LmrHtLT4ZXx3'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER120_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER120_RL TO USER SWTBER27_USER120;

-- ----------------------------------------------------------------------------
-- USER121
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER121
  COMMENT = 'Openflow HoL sandbox for user121. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER121.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER121_RL
  COMMENT = 'Openflow HoL login/execute-as role for user121. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER121 TO ROLE SWTBER27_USER121_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER121.PUBLIC TO ROLE SWTBER27_USER121_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER121_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER121.PUBLIC TO ROLE SWTBER27_USER121_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER121.PUBLIC TO ROLE SWTBER27_USER121_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER121_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER121
  PASSWORD = '6OSyzjtiKUNx'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER121_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER121_RL TO USER SWTBER27_USER121;

-- ----------------------------------------------------------------------------
-- USER122
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER122
  COMMENT = 'Openflow HoL sandbox for user122. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER122.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER122_RL
  COMMENT = 'Openflow HoL login/execute-as role for user122. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER122 TO ROLE SWTBER27_USER122_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER122.PUBLIC TO ROLE SWTBER27_USER122_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER122_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER122.PUBLIC TO ROLE SWTBER27_USER122_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER122.PUBLIC TO ROLE SWTBER27_USER122_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER122_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER122
  PASSWORD = '6waq8ezlnASO'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER122_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER122_RL TO USER SWTBER27_USER122;

-- ----------------------------------------------------------------------------
-- USER123
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER123
  COMMENT = 'Openflow HoL sandbox for user123. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER123.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER123_RL
  COMMENT = 'Openflow HoL login/execute-as role for user123. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER123 TO ROLE SWTBER27_USER123_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER123.PUBLIC TO ROLE SWTBER27_USER123_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER123_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER123.PUBLIC TO ROLE SWTBER27_USER123_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER123.PUBLIC TO ROLE SWTBER27_USER123_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER123_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER123
  PASSWORD = 'FT2994UV8d21'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER123_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER123_RL TO USER SWTBER27_USER123;

-- ----------------------------------------------------------------------------
-- USER124
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER124
  COMMENT = 'Openflow HoL sandbox for user124. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER124.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER124_RL
  COMMENT = 'Openflow HoL login/execute-as role for user124. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER124 TO ROLE SWTBER27_USER124_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER124.PUBLIC TO ROLE SWTBER27_USER124_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER124_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER124.PUBLIC TO ROLE SWTBER27_USER124_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER124.PUBLIC TO ROLE SWTBER27_USER124_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER124_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER124
  PASSWORD = 'gs8X5uJddAOk'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER124_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER124_RL TO USER SWTBER27_USER124;

-- ----------------------------------------------------------------------------
-- USER125
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER125
  COMMENT = 'Openflow HoL sandbox for user125. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER125.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER125_RL
  COMMENT = 'Openflow HoL login/execute-as role for user125. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER125 TO ROLE SWTBER27_USER125_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER125.PUBLIC TO ROLE SWTBER27_USER125_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER125_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER125.PUBLIC TO ROLE SWTBER27_USER125_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER125.PUBLIC TO ROLE SWTBER27_USER125_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER125_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER125
  PASSWORD = 'Hu6SIR3itS3c'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER125_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER125_RL TO USER SWTBER27_USER125;

-- ----------------------------------------------------------------------------
-- USER126
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER126
  COMMENT = 'Openflow HoL sandbox for user126. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER126.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER126_RL
  COMMENT = 'Openflow HoL login/execute-as role for user126. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER126 TO ROLE SWTBER27_USER126_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER126.PUBLIC TO ROLE SWTBER27_USER126_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER126_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER126.PUBLIC TO ROLE SWTBER27_USER126_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER126.PUBLIC TO ROLE SWTBER27_USER126_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER126_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER126
  PASSWORD = 'et7KQHlj3zA0'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER126_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER126_RL TO USER SWTBER27_USER126;

-- ----------------------------------------------------------------------------
-- USER127
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER127
  COMMENT = 'Openflow HoL sandbox for user127. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER127.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER127_RL
  COMMENT = 'Openflow HoL login/execute-as role for user127. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER127 TO ROLE SWTBER27_USER127_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER127.PUBLIC TO ROLE SWTBER27_USER127_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER127_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER127.PUBLIC TO ROLE SWTBER27_USER127_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER127.PUBLIC TO ROLE SWTBER27_USER127_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER127_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER127
  PASSWORD = 'UdCJn9u7SAzS'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER127_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER127_RL TO USER SWTBER27_USER127;

-- ----------------------------------------------------------------------------
-- USER128
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER128
  COMMENT = 'Openflow HoL sandbox for user128. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER128.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER128_RL
  COMMENT = 'Openflow HoL login/execute-as role for user128. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER128 TO ROLE SWTBER27_USER128_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER128.PUBLIC TO ROLE SWTBER27_USER128_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER128_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER128.PUBLIC TO ROLE SWTBER27_USER128_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER128.PUBLIC TO ROLE SWTBER27_USER128_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER128_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER128
  PASSWORD = 'tUSq7qZnexaN'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER128_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER128_RL TO USER SWTBER27_USER128;

-- ----------------------------------------------------------------------------
-- USER129
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER129
  COMMENT = 'Openflow HoL sandbox for user129. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER129.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER129_RL
  COMMENT = 'Openflow HoL login/execute-as role for user129. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER129 TO ROLE SWTBER27_USER129_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER129.PUBLIC TO ROLE SWTBER27_USER129_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER129_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER129.PUBLIC TO ROLE SWTBER27_USER129_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER129.PUBLIC TO ROLE SWTBER27_USER129_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER129_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER129
  PASSWORD = 'TnZ6hoRxuscH'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER129_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER129_RL TO USER SWTBER27_USER129;

-- ----------------------------------------------------------------------------
-- USER130
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER130
  COMMENT = 'Openflow HoL sandbox for user130. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER130.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER130_RL
  COMMENT = 'Openflow HoL login/execute-as role for user130. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER130 TO ROLE SWTBER27_USER130_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER130.PUBLIC TO ROLE SWTBER27_USER130_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER130_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER130.PUBLIC TO ROLE SWTBER27_USER130_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER130.PUBLIC TO ROLE SWTBER27_USER130_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER130_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER130
  PASSWORD = 'Mi31hKwo9lIJ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER130_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER130_RL TO USER SWTBER27_USER130;

-- ----------------------------------------------------------------------------
-- USER131
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER131
  COMMENT = 'Openflow HoL sandbox for user131. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER131.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER131_RL
  COMMENT = 'Openflow HoL login/execute-as role for user131. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER131 TO ROLE SWTBER27_USER131_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER131.PUBLIC TO ROLE SWTBER27_USER131_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER131_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER131.PUBLIC TO ROLE SWTBER27_USER131_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER131.PUBLIC TO ROLE SWTBER27_USER131_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER131_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER131
  PASSWORD = '9B5ZSlHT4KiQ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER131_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER131_RL TO USER SWTBER27_USER131;

-- ----------------------------------------------------------------------------
-- USER132
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER132
  COMMENT = 'Openflow HoL sandbox for user132. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER132.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER132_RL
  COMMENT = 'Openflow HoL login/execute-as role for user132. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER132 TO ROLE SWTBER27_USER132_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER132.PUBLIC TO ROLE SWTBER27_USER132_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER132_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER132.PUBLIC TO ROLE SWTBER27_USER132_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER132.PUBLIC TO ROLE SWTBER27_USER132_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER132_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER132
  PASSWORD = 'jFbeHkLlV1bU'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER132_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER132_RL TO USER SWTBER27_USER132;

-- ----------------------------------------------------------------------------
-- USER133
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER133
  COMMENT = 'Openflow HoL sandbox for user133. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER133.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER133_RL
  COMMENT = 'Openflow HoL login/execute-as role for user133. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER133 TO ROLE SWTBER27_USER133_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER133.PUBLIC TO ROLE SWTBER27_USER133_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER133_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER133.PUBLIC TO ROLE SWTBER27_USER133_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER133.PUBLIC TO ROLE SWTBER27_USER133_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER133_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER133
  PASSWORD = 'mjBVOt1fDCYJ'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER133_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER133_RL TO USER SWTBER27_USER133;

-- ----------------------------------------------------------------------------
-- USER134
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER134
  COMMENT = 'Openflow HoL sandbox for user134. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER134.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER134_RL
  COMMENT = 'Openflow HoL login/execute-as role for user134. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER134 TO ROLE SWTBER27_USER134_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER134.PUBLIC TO ROLE SWTBER27_USER134_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER134_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER134.PUBLIC TO ROLE SWTBER27_USER134_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER134.PUBLIC TO ROLE SWTBER27_USER134_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER134_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER134
  PASSWORD = 'rePsmXIxfTj4'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER134_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER134_RL TO USER SWTBER27_USER134;

-- ----------------------------------------------------------------------------
-- USER135
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER135
  COMMENT = 'Openflow HoL sandbox for user135. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER135.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER135_RL
  COMMENT = 'Openflow HoL login/execute-as role for user135. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER135 TO ROLE SWTBER27_USER135_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER135.PUBLIC TO ROLE SWTBER27_USER135_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER135_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER135.PUBLIC TO ROLE SWTBER27_USER135_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER135.PUBLIC TO ROLE SWTBER27_USER135_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER135_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER135
  PASSWORD = 'nu7l0zlN7TnG'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER135_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER135_RL TO USER SWTBER27_USER135;

-- ----------------------------------------------------------------------------
-- USER136
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER136
  COMMENT = 'Openflow HoL sandbox for user136. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER136.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER136_RL
  COMMENT = 'Openflow HoL login/execute-as role for user136. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER136 TO ROLE SWTBER27_USER136_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER136.PUBLIC TO ROLE SWTBER27_USER136_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER136_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER136.PUBLIC TO ROLE SWTBER27_USER136_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER136.PUBLIC TO ROLE SWTBER27_USER136_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER136_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER136
  PASSWORD = 'kJodr9Vfq8Hj'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER136_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER136_RL TO USER SWTBER27_USER136;

-- ----------------------------------------------------------------------------
-- USER137
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER137
  COMMENT = 'Openflow HoL sandbox for user137. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER137.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER137_RL
  COMMENT = 'Openflow HoL login/execute-as role for user137. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER137 TO ROLE SWTBER27_USER137_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER137.PUBLIC TO ROLE SWTBER27_USER137_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER137_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER137.PUBLIC TO ROLE SWTBER27_USER137_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER137.PUBLIC TO ROLE SWTBER27_USER137_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER137_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER137
  PASSWORD = 'NeszJQq9L4Xn'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER137_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER137_RL TO USER SWTBER27_USER137;

-- ----------------------------------------------------------------------------
-- USER138
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER138
  COMMENT = 'Openflow HoL sandbox for user138. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER138.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER138_RL
  COMMENT = 'Openflow HoL login/execute-as role for user138. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER138 TO ROLE SWTBER27_USER138_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER138.PUBLIC TO ROLE SWTBER27_USER138_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER138_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER138.PUBLIC TO ROLE SWTBER27_USER138_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER138.PUBLIC TO ROLE SWTBER27_USER138_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER138_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER138
  PASSWORD = 'OdS2WHC3P3UF'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER138_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER138_RL TO USER SWTBER27_USER138;

-- ----------------------------------------------------------------------------
-- USER139
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER139
  COMMENT = 'Openflow HoL sandbox for user139. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER139.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER139_RL
  COMMENT = 'Openflow HoL login/execute-as role for user139. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER139 TO ROLE SWTBER27_USER139_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER139.PUBLIC TO ROLE SWTBER27_USER139_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER139_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER139.PUBLIC TO ROLE SWTBER27_USER139_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER139.PUBLIC TO ROLE SWTBER27_USER139_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER139_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER139
  PASSWORD = 'TcVtsBmqaz1a'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER139_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER139_RL TO USER SWTBER27_USER139;

-- ----------------------------------------------------------------------------
-- USER140
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER140
  COMMENT = 'Openflow HoL sandbox for user140. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER140.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER140_RL
  COMMENT = 'Openflow HoL login/execute-as role for user140. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER140 TO ROLE SWTBER27_USER140_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER140.PUBLIC TO ROLE SWTBER27_USER140_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER140_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER140.PUBLIC TO ROLE SWTBER27_USER140_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER140.PUBLIC TO ROLE SWTBER27_USER140_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER140_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER140
  PASSWORD = 'Mzv6wxWoEHzz'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER140_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER140_RL TO USER SWTBER27_USER140;

-- ----------------------------------------------------------------------------
-- USER141
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER141
  COMMENT = 'Openflow HoL sandbox for user141. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER141.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER141_RL
  COMMENT = 'Openflow HoL login/execute-as role for user141. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER141 TO ROLE SWTBER27_USER141_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER141.PUBLIC TO ROLE SWTBER27_USER141_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER141_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER141.PUBLIC TO ROLE SWTBER27_USER141_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER141.PUBLIC TO ROLE SWTBER27_USER141_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER141_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER141
  PASSWORD = 'dqvqPBO7Ynm1'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER141_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER141_RL TO USER SWTBER27_USER141;

-- ----------------------------------------------------------------------------
-- USER142
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER142
  COMMENT = 'Openflow HoL sandbox for user142. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER142.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER142_RL
  COMMENT = 'Openflow HoL login/execute-as role for user142. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER142 TO ROLE SWTBER27_USER142_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER142.PUBLIC TO ROLE SWTBER27_USER142_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER142_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER142.PUBLIC TO ROLE SWTBER27_USER142_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER142.PUBLIC TO ROLE SWTBER27_USER142_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER142_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER142
  PASSWORD = 'ZI1x1mBLWuNE'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER142_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER142_RL TO USER SWTBER27_USER142;

-- ----------------------------------------------------------------------------
-- USER143
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER143
  COMMENT = 'Openflow HoL sandbox for user143. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER143.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER143_RL
  COMMENT = 'Openflow HoL login/execute-as role for user143. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER143 TO ROLE SWTBER27_USER143_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER143.PUBLIC TO ROLE SWTBER27_USER143_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER143_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER143.PUBLIC TO ROLE SWTBER27_USER143_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER143.PUBLIC TO ROLE SWTBER27_USER143_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER143_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER143
  PASSWORD = 'GDqDFPplFl8T'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER143_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER143_RL TO USER SWTBER27_USER143;

-- ----------------------------------------------------------------------------
-- USER144
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER144
  COMMENT = 'Openflow HoL sandbox for user144. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER144.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER144_RL
  COMMENT = 'Openflow HoL login/execute-as role for user144. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER144 TO ROLE SWTBER27_USER144_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER144.PUBLIC TO ROLE SWTBER27_USER144_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER144_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER144.PUBLIC TO ROLE SWTBER27_USER144_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER144.PUBLIC TO ROLE SWTBER27_USER144_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER144_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER144
  PASSWORD = 'NtgiJEgkuq1b'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER144_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER144_RL TO USER SWTBER27_USER144;

-- ----------------------------------------------------------------------------
-- USER145
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER145
  COMMENT = 'Openflow HoL sandbox for user145. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER145.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER145_RL
  COMMENT = 'Openflow HoL login/execute-as role for user145. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER145 TO ROLE SWTBER27_USER145_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER145.PUBLIC TO ROLE SWTBER27_USER145_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER145_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER145.PUBLIC TO ROLE SWTBER27_USER145_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER145.PUBLIC TO ROLE SWTBER27_USER145_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER145_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER145
  PASSWORD = 'Hhb0qIuOGXHm'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER145_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER145_RL TO USER SWTBER27_USER145;

-- ----------------------------------------------------------------------------
-- USER146
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER146
  COMMENT = 'Openflow HoL sandbox for user146. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER146.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER146_RL
  COMMENT = 'Openflow HoL login/execute-as role for user146. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER146 TO ROLE SWTBER27_USER146_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER146.PUBLIC TO ROLE SWTBER27_USER146_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER146_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER146.PUBLIC TO ROLE SWTBER27_USER146_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER146.PUBLIC TO ROLE SWTBER27_USER146_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER146_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER146
  PASSWORD = 'G7AyBGrlZdBM'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER146_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER146_RL TO USER SWTBER27_USER146;

-- ----------------------------------------------------------------------------
-- USER147
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER147
  COMMENT = 'Openflow HoL sandbox for user147. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER147.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER147_RL
  COMMENT = 'Openflow HoL login/execute-as role for user147. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER147 TO ROLE SWTBER27_USER147_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER147.PUBLIC TO ROLE SWTBER27_USER147_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER147_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER147.PUBLIC TO ROLE SWTBER27_USER147_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER147.PUBLIC TO ROLE SWTBER27_USER147_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER147_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER147
  PASSWORD = 'R5xuhcnBUDI1'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER147_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER147_RL TO USER SWTBER27_USER147;

-- ----------------------------------------------------------------------------
-- USER148
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER148
  COMMENT = 'Openflow HoL sandbox for user148. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER148.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER148_RL
  COMMENT = 'Openflow HoL login/execute-as role for user148. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER148 TO ROLE SWTBER27_USER148_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER148.PUBLIC TO ROLE SWTBER27_USER148_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER148_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER148.PUBLIC TO ROLE SWTBER27_USER148_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER148.PUBLIC TO ROLE SWTBER27_USER148_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER148_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER148
  PASSWORD = 'g7EOCj53vDTE'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER148_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER148_RL TO USER SWTBER27_USER148;

-- ----------------------------------------------------------------------------
-- USER149
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER149
  COMMENT = 'Openflow HoL sandbox for user149. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER149.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER149_RL
  COMMENT = 'Openflow HoL login/execute-as role for user149. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER149 TO ROLE SWTBER27_USER149_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER149.PUBLIC TO ROLE SWTBER27_USER149_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER149_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER149.PUBLIC TO ROLE SWTBER27_USER149_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER149.PUBLIC TO ROLE SWTBER27_USER149_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER149_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER149
  PASSWORD = 'lPK3qFbKMToz'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER149_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER149_RL TO USER SWTBER27_USER149;

-- ----------------------------------------------------------------------------
-- USER150
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER150
  COMMENT = 'Openflow HoL sandbox for user150. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER150.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER150_RL
  COMMENT = 'Openflow HoL login/execute-as role for user150. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER150 TO ROLE SWTBER27_USER150_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER150.PUBLIC TO ROLE SWTBER27_USER150_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER150_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER150.PUBLIC TO ROLE SWTBER27_USER150_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER150.PUBLIC TO ROLE SWTBER27_USER150_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER150_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER150
  PASSWORD = 'b5FnWQGMPumK'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER150_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER150_RL TO USER SWTBER27_USER150;

-- ----------------------------------------------------------------------------
-- USER151
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER151
  COMMENT = 'Openflow HoL sandbox for user151. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER151.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER151_RL
  COMMENT = 'Openflow HoL login/execute-as role for user151. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER151 TO ROLE SWTBER27_USER151_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER151.PUBLIC TO ROLE SWTBER27_USER151_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER151_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER151.PUBLIC TO ROLE SWTBER27_USER151_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER151.PUBLIC TO ROLE SWTBER27_USER151_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER151_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER151
  PASSWORD = 't6HIOjl5R2OW'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER151_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER151_RL TO USER SWTBER27_USER151;

-- ----------------------------------------------------------------------------
-- USER152
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER152
  COMMENT = 'Openflow HoL sandbox for user152. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER152.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER152_RL
  COMMENT = 'Openflow HoL login/execute-as role for user152. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER152 TO ROLE SWTBER27_USER152_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER152.PUBLIC TO ROLE SWTBER27_USER152_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER152_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER152.PUBLIC TO ROLE SWTBER27_USER152_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER152.PUBLIC TO ROLE SWTBER27_USER152_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER152_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER152
  PASSWORD = 'NYWKqmNGHU93'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER152_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER152_RL TO USER SWTBER27_USER152;

-- ----------------------------------------------------------------------------
-- USER153
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER153
  COMMENT = 'Openflow HoL sandbox for user153. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER153.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER153_RL
  COMMENT = 'Openflow HoL login/execute-as role for user153. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER153 TO ROLE SWTBER27_USER153_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER153.PUBLIC TO ROLE SWTBER27_USER153_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER153_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER153.PUBLIC TO ROLE SWTBER27_USER153_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER153.PUBLIC TO ROLE SWTBER27_USER153_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER153_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER153
  PASSWORD = 'vTk5gYfgFcnr'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER153_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER153_RL TO USER SWTBER27_USER153;

-- ----------------------------------------------------------------------------
-- USER154
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER154
  COMMENT = 'Openflow HoL sandbox for user154. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER154.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER154_RL
  COMMENT = 'Openflow HoL login/execute-as role for user154. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER154 TO ROLE SWTBER27_USER154_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER154.PUBLIC TO ROLE SWTBER27_USER154_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER154_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER154.PUBLIC TO ROLE SWTBER27_USER154_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER154.PUBLIC TO ROLE SWTBER27_USER154_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER154_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER154
  PASSWORD = 'h7LkCTtyuMri'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER154_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER154_RL TO USER SWTBER27_USER154;

-- ----------------------------------------------------------------------------
-- USER155
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER155
  COMMENT = 'Openflow HoL sandbox for user155. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER155.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER155_RL
  COMMENT = 'Openflow HoL login/execute-as role for user155. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER155 TO ROLE SWTBER27_USER155_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER155.PUBLIC TO ROLE SWTBER27_USER155_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER155_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER155.PUBLIC TO ROLE SWTBER27_USER155_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER155.PUBLIC TO ROLE SWTBER27_USER155_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER155_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER155
  PASSWORD = 'qOnsUQT2YdpD'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER155_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER155_RL TO USER SWTBER27_USER155;

-- ----------------------------------------------------------------------------
-- USER156
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER156
  COMMENT = 'Openflow HoL sandbox for user156. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER156.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER156_RL
  COMMENT = 'Openflow HoL login/execute-as role for user156. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER156 TO ROLE SWTBER27_USER156_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER156.PUBLIC TO ROLE SWTBER27_USER156_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER156_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER156.PUBLIC TO ROLE SWTBER27_USER156_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER156.PUBLIC TO ROLE SWTBER27_USER156_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER156_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER156
  PASSWORD = 'SWgEuWBks3cw'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER156_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER156_RL TO USER SWTBER27_USER156;

-- ----------------------------------------------------------------------------
-- USER157
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER157
  COMMENT = 'Openflow HoL sandbox for user157. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER157.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER157_RL
  COMMENT = 'Openflow HoL login/execute-as role for user157. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER157 TO ROLE SWTBER27_USER157_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER157.PUBLIC TO ROLE SWTBER27_USER157_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER157_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER157.PUBLIC TO ROLE SWTBER27_USER157_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER157.PUBLIC TO ROLE SWTBER27_USER157_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER157_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER157
  PASSWORD = '4uC3ulgqqyDd'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER157_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER157_RL TO USER SWTBER27_USER157;

-- ----------------------------------------------------------------------------
-- USER158
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER158
  COMMENT = 'Openflow HoL sandbox for user158. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER158.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER158_RL
  COMMENT = 'Openflow HoL login/execute-as role for user158. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER158 TO ROLE SWTBER27_USER158_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER158.PUBLIC TO ROLE SWTBER27_USER158_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER158_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER158.PUBLIC TO ROLE SWTBER27_USER158_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER158.PUBLIC TO ROLE SWTBER27_USER158_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER158_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER158
  PASSWORD = 'nngOjKm3easI'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER158_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER158_RL TO USER SWTBER27_USER158;

-- ----------------------------------------------------------------------------
-- USER159
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER159
  COMMENT = 'Openflow HoL sandbox for user159. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER159.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER159_RL
  COMMENT = 'Openflow HoL login/execute-as role for user159. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER159 TO ROLE SWTBER27_USER159_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER159.PUBLIC TO ROLE SWTBER27_USER159_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER159_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER159.PUBLIC TO ROLE SWTBER27_USER159_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER159.PUBLIC TO ROLE SWTBER27_USER159_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER159_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER159
  PASSWORD = 'iMPT7CvhGomd'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER159_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER159_RL TO USER SWTBER27_USER159;

-- ----------------------------------------------------------------------------
-- USER160
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER160
  COMMENT = 'Openflow HoL sandbox for user160. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER160.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER160_RL
  COMMENT = 'Openflow HoL login/execute-as role for user160. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER160 TO ROLE SWTBER27_USER160_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER160.PUBLIC TO ROLE SWTBER27_USER160_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER160_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER160.PUBLIC TO ROLE SWTBER27_USER160_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER160.PUBLIC TO ROLE SWTBER27_USER160_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER160_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER160
  PASSWORD = '3Z4kO4bUhboG'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER160_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER160_RL TO USER SWTBER27_USER160;

-- ----------------------------------------------------------------------------
-- USER161
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER161
  COMMENT = 'Openflow HoL sandbox for user161. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER161.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER161_RL
  COMMENT = 'Openflow HoL login/execute-as role for user161. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER161 TO ROLE SWTBER27_USER161_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER161.PUBLIC TO ROLE SWTBER27_USER161_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER161_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER161.PUBLIC TO ROLE SWTBER27_USER161_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER161.PUBLIC TO ROLE SWTBER27_USER161_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER161_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER161
  PASSWORD = 'W0I3C4G9wAtd'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER161_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER161_RL TO USER SWTBER27_USER161;

-- ----------------------------------------------------------------------------
-- USER162
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER162
  COMMENT = 'Openflow HoL sandbox for user162. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER162.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER162_RL
  COMMENT = 'Openflow HoL login/execute-as role for user162. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER162 TO ROLE SWTBER27_USER162_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER162.PUBLIC TO ROLE SWTBER27_USER162_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER162_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER162.PUBLIC TO ROLE SWTBER27_USER162_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER162.PUBLIC TO ROLE SWTBER27_USER162_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER162_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER162
  PASSWORD = 'JDaC7dHc1Z4L'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER162_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER162_RL TO USER SWTBER27_USER162;

-- ----------------------------------------------------------------------------
-- USER163
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER163
  COMMENT = 'Openflow HoL sandbox for user163. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER163.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER163_RL
  COMMENT = 'Openflow HoL login/execute-as role for user163. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER163 TO ROLE SWTBER27_USER163_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER163.PUBLIC TO ROLE SWTBER27_USER163_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER163_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER163.PUBLIC TO ROLE SWTBER27_USER163_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER163.PUBLIC TO ROLE SWTBER27_USER163_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER163_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER163
  PASSWORD = 'rzHecrXt4lzi'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER163_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER163_RL TO USER SWTBER27_USER163;

-- ----------------------------------------------------------------------------
-- USER164
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER164
  COMMENT = 'Openflow HoL sandbox for user164. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER164.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER164_RL
  COMMENT = 'Openflow HoL login/execute-as role for user164. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER164 TO ROLE SWTBER27_USER164_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER164.PUBLIC TO ROLE SWTBER27_USER164_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER164_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER164.PUBLIC TO ROLE SWTBER27_USER164_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER164.PUBLIC TO ROLE SWTBER27_USER164_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER164_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER164
  PASSWORD = 'Q91eShsbMS94'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER164_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER164_RL TO USER SWTBER27_USER164;

-- ----------------------------------------------------------------------------
-- USER165
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER165
  COMMENT = 'Openflow HoL sandbox for user165. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER165.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER165_RL
  COMMENT = 'Openflow HoL login/execute-as role for user165. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER165 TO ROLE SWTBER27_USER165_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER165.PUBLIC TO ROLE SWTBER27_USER165_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER165_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER165.PUBLIC TO ROLE SWTBER27_USER165_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER165.PUBLIC TO ROLE SWTBER27_USER165_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER165_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER165
  PASSWORD = 'ZEB08SeRZSlt'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER165_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER165_RL TO USER SWTBER27_USER165;

-- ----------------------------------------------------------------------------
-- USER166
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER166
  COMMENT = 'Openflow HoL sandbox for user166. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER166.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER166_RL
  COMMENT = 'Openflow HoL login/execute-as role for user166. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER166 TO ROLE SWTBER27_USER166_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER166.PUBLIC TO ROLE SWTBER27_USER166_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER166_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER166.PUBLIC TO ROLE SWTBER27_USER166_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER166.PUBLIC TO ROLE SWTBER27_USER166_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER166_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER166
  PASSWORD = 'Ys2ZDAX7K20r'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER166_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER166_RL TO USER SWTBER27_USER166;

-- ----------------------------------------------------------------------------
-- USER167
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER167
  COMMENT = 'Openflow HoL sandbox for user167. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER167.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER167_RL
  COMMENT = 'Openflow HoL login/execute-as role for user167. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER167 TO ROLE SWTBER27_USER167_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER167.PUBLIC TO ROLE SWTBER27_USER167_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER167_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER167.PUBLIC TO ROLE SWTBER27_USER167_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER167.PUBLIC TO ROLE SWTBER27_USER167_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER167_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER167
  PASSWORD = 'OqCB6QjRICW4'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER167_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER167_RL TO USER SWTBER27_USER167;

-- ----------------------------------------------------------------------------
-- USER168
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER168
  COMMENT = 'Openflow HoL sandbox for user168. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER168.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER168_RL
  COMMENT = 'Openflow HoL login/execute-as role for user168. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER168 TO ROLE SWTBER27_USER168_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER168.PUBLIC TO ROLE SWTBER27_USER168_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER168_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER168.PUBLIC TO ROLE SWTBER27_USER168_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER168.PUBLIC TO ROLE SWTBER27_USER168_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER168_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER168
  PASSWORD = 'aKYFCYxcW6gC'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER168_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER168_RL TO USER SWTBER27_USER168;

-- ----------------------------------------------------------------------------
-- USER169
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER169
  COMMENT = 'Openflow HoL sandbox for user169. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER169.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER169_RL
  COMMENT = 'Openflow HoL login/execute-as role for user169. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER169 TO ROLE SWTBER27_USER169_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER169.PUBLIC TO ROLE SWTBER27_USER169_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER169_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER169.PUBLIC TO ROLE SWTBER27_USER169_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER169.PUBLIC TO ROLE SWTBER27_USER169_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER169_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER169
  PASSWORD = 'mMSA7xl4Kz8E'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER169_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER169_RL TO USER SWTBER27_USER169;

-- ----------------------------------------------------------------------------
-- USER170
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER170
  COMMENT = 'Openflow HoL sandbox for user170. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER170.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER170_RL
  COMMENT = 'Openflow HoL login/execute-as role for user170. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER170 TO ROLE SWTBER27_USER170_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER170.PUBLIC TO ROLE SWTBER27_USER170_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER170_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER170.PUBLIC TO ROLE SWTBER27_USER170_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER170.PUBLIC TO ROLE SWTBER27_USER170_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER170_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER170
  PASSWORD = 'CFJqo6pQOx3p'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER170_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER170_RL TO USER SWTBER27_USER170;

-- ----------------------------------------------------------------------------
-- USER171
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER171
  COMMENT = 'Openflow HoL sandbox for user171. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER171.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER171_RL
  COMMENT = 'Openflow HoL login/execute-as role for user171. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER171 TO ROLE SWTBER27_USER171_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER171.PUBLIC TO ROLE SWTBER27_USER171_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER171_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER171.PUBLIC TO ROLE SWTBER27_USER171_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER171.PUBLIC TO ROLE SWTBER27_USER171_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER171_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER171
  PASSWORD = 'IEqM29vnUKoS'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER171_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER171_RL TO USER SWTBER27_USER171;

-- ----------------------------------------------------------------------------
-- USER172
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER172
  COMMENT = 'Openflow HoL sandbox for user172. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER172.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER172_RL
  COMMENT = 'Openflow HoL login/execute-as role for user172. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER172 TO ROLE SWTBER27_USER172_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER172.PUBLIC TO ROLE SWTBER27_USER172_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER172_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER172.PUBLIC TO ROLE SWTBER27_USER172_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER172.PUBLIC TO ROLE SWTBER27_USER172_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER172_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER172
  PASSWORD = '7p5RPnRa61Uz'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER172_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER172_RL TO USER SWTBER27_USER172;

-- ----------------------------------------------------------------------------
-- USER173
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER173
  COMMENT = 'Openflow HoL sandbox for user173. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER173.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER173_RL
  COMMENT = 'Openflow HoL login/execute-as role for user173. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER173 TO ROLE SWTBER27_USER173_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER173.PUBLIC TO ROLE SWTBER27_USER173_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER173_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER173.PUBLIC TO ROLE SWTBER27_USER173_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER173.PUBLIC TO ROLE SWTBER27_USER173_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER173_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER173
  PASSWORD = 'MeeZwS36qfl7'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER173_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER173_RL TO USER SWTBER27_USER173;

-- ----------------------------------------------------------------------------
-- USER174
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER174
  COMMENT = 'Openflow HoL sandbox for user174. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER174.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER174_RL
  COMMENT = 'Openflow HoL login/execute-as role for user174. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER174 TO ROLE SWTBER27_USER174_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER174.PUBLIC TO ROLE SWTBER27_USER174_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER174_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER174.PUBLIC TO ROLE SWTBER27_USER174_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER174.PUBLIC TO ROLE SWTBER27_USER174_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER174_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER174
  PASSWORD = '1F0gsA9jfFmr'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER174_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER174_RL TO USER SWTBER27_USER174;

-- ----------------------------------------------------------------------------
-- USER175
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER175
  COMMENT = 'Openflow HoL sandbox for user175. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER175.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER175_RL
  COMMENT = 'Openflow HoL login/execute-as role for user175. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER175 TO ROLE SWTBER27_USER175_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER175.PUBLIC TO ROLE SWTBER27_USER175_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER175_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER175.PUBLIC TO ROLE SWTBER27_USER175_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER175.PUBLIC TO ROLE SWTBER27_USER175_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER175_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER175
  PASSWORD = 'GMpx7GgyvhpE'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER175_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER175_RL TO USER SWTBER27_USER175;

-- ----------------------------------------------------------------------------
-- USER176
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER176
  COMMENT = 'Openflow HoL sandbox for user176. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER176.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER176_RL
  COMMENT = 'Openflow HoL login/execute-as role for user176. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER176 TO ROLE SWTBER27_USER176_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER176.PUBLIC TO ROLE SWTBER27_USER176_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER176_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER176.PUBLIC TO ROLE SWTBER27_USER176_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER176.PUBLIC TO ROLE SWTBER27_USER176_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER176_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER176
  PASSWORD = '4BIT8F5EyJiV'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER176_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER176_RL TO USER SWTBER27_USER176;

-- ----------------------------------------------------------------------------
-- USER177
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER177
  COMMENT = 'Openflow HoL sandbox for user177. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER177.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER177_RL
  COMMENT = 'Openflow HoL login/execute-as role for user177. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER177 TO ROLE SWTBER27_USER177_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER177.PUBLIC TO ROLE SWTBER27_USER177_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER177_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER177.PUBLIC TO ROLE SWTBER27_USER177_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER177.PUBLIC TO ROLE SWTBER27_USER177_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER177_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER177
  PASSWORD = 'QpFfBT6iHkob'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER177_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER177_RL TO USER SWTBER27_USER177;

-- ----------------------------------------------------------------------------
-- USER178
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER178
  COMMENT = 'Openflow HoL sandbox for user178. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER178.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER178_RL
  COMMENT = 'Openflow HoL login/execute-as role for user178. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER178 TO ROLE SWTBER27_USER178_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER178.PUBLIC TO ROLE SWTBER27_USER178_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER178_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER178.PUBLIC TO ROLE SWTBER27_USER178_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER178.PUBLIC TO ROLE SWTBER27_USER178_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER178_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER178
  PASSWORD = 'l1TJtGN4MVca'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER178_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER178_RL TO USER SWTBER27_USER178;

-- ----------------------------------------------------------------------------
-- USER179
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER179
  COMMENT = 'Openflow HoL sandbox for user179. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER179.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER179_RL
  COMMENT = 'Openflow HoL login/execute-as role for user179. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER179 TO ROLE SWTBER27_USER179_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER179.PUBLIC TO ROLE SWTBER27_USER179_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER179_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER179.PUBLIC TO ROLE SWTBER27_USER179_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER179.PUBLIC TO ROLE SWTBER27_USER179_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER179_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER179
  PASSWORD = 'DXQIHcr36pwB'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER179_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER179_RL TO USER SWTBER27_USER179;

-- ----------------------------------------------------------------------------
-- USER180
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER180
  COMMENT = 'Openflow HoL sandbox for user180. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER180.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER180_RL
  COMMENT = 'Openflow HoL login/execute-as role for user180. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER180 TO ROLE SWTBER27_USER180_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER180.PUBLIC TO ROLE SWTBER27_USER180_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER180_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER180.PUBLIC TO ROLE SWTBER27_USER180_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER180.PUBLIC TO ROLE SWTBER27_USER180_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER180_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER180
  PASSWORD = 'PMYbCge4XAYM'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER180_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER180_RL TO USER SWTBER27_USER180;

-- ----------------------------------------------------------------------------
-- USER181
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER181
  COMMENT = 'Openflow HoL sandbox for user181. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER181.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER181_RL
  COMMENT = 'Openflow HoL login/execute-as role for user181. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER181 TO ROLE SWTBER27_USER181_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER181.PUBLIC TO ROLE SWTBER27_USER181_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER181_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER181.PUBLIC TO ROLE SWTBER27_USER181_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER181.PUBLIC TO ROLE SWTBER27_USER181_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER181_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER181
  PASSWORD = '7umUJ1b0WPtt'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER181_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER181_RL TO USER SWTBER27_USER181;

-- ----------------------------------------------------------------------------
-- USER182
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER182
  COMMENT = 'Openflow HoL sandbox for user182. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER182.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER182_RL
  COMMENT = 'Openflow HoL login/execute-as role for user182. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER182 TO ROLE SWTBER27_USER182_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER182.PUBLIC TO ROLE SWTBER27_USER182_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER182_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER182.PUBLIC TO ROLE SWTBER27_USER182_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER182.PUBLIC TO ROLE SWTBER27_USER182_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER182_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER182
  PASSWORD = 'WTLSqgQ8gTvl'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER182_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER182_RL TO USER SWTBER27_USER182;

-- ----------------------------------------------------------------------------
-- USER183
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER183
  COMMENT = 'Openflow HoL sandbox for user183. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER183.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER183_RL
  COMMENT = 'Openflow HoL login/execute-as role for user183. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER183 TO ROLE SWTBER27_USER183_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER183.PUBLIC TO ROLE SWTBER27_USER183_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER183_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER183.PUBLIC TO ROLE SWTBER27_USER183_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER183.PUBLIC TO ROLE SWTBER27_USER183_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER183_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER183
  PASSWORD = '93EsYHvB9x82'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER183_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER183_RL TO USER SWTBER27_USER183;

-- ----------------------------------------------------------------------------
-- USER184
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER184
  COMMENT = 'Openflow HoL sandbox for user184. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER184.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER184_RL
  COMMENT = 'Openflow HoL login/execute-as role for user184. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER184 TO ROLE SWTBER27_USER184_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER184.PUBLIC TO ROLE SWTBER27_USER184_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER184_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER184.PUBLIC TO ROLE SWTBER27_USER184_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER184.PUBLIC TO ROLE SWTBER27_USER184_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER184_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER184
  PASSWORD = 'UGrqf4NrT0E5'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER184_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER184_RL TO USER SWTBER27_USER184;

-- ----------------------------------------------------------------------------
-- USER185
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER185
  COMMENT = 'Openflow HoL sandbox for user185. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER185.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER185_RL
  COMMENT = 'Openflow HoL login/execute-as role for user185. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER185 TO ROLE SWTBER27_USER185_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER185.PUBLIC TO ROLE SWTBER27_USER185_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER185_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER185.PUBLIC TO ROLE SWTBER27_USER185_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER185.PUBLIC TO ROLE SWTBER27_USER185_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER185_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER185
  PASSWORD = '3iELbkPn5HTX'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER185_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER185_RL TO USER SWTBER27_USER185;

-- ----------------------------------------------------------------------------
-- USER186
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER186
  COMMENT = 'Openflow HoL sandbox for user186. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER186.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER186_RL
  COMMENT = 'Openflow HoL login/execute-as role for user186. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER186 TO ROLE SWTBER27_USER186_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER186.PUBLIC TO ROLE SWTBER27_USER186_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER186_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER186.PUBLIC TO ROLE SWTBER27_USER186_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER186.PUBLIC TO ROLE SWTBER27_USER186_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER186_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER186
  PASSWORD = '47PZRjYU4zBR'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER186_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER186_RL TO USER SWTBER27_USER186;

-- ----------------------------------------------------------------------------
-- USER187
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER187
  COMMENT = 'Openflow HoL sandbox for user187. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER187.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER187_RL
  COMMENT = 'Openflow HoL login/execute-as role for user187. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER187 TO ROLE SWTBER27_USER187_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER187.PUBLIC TO ROLE SWTBER27_USER187_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER187_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER187.PUBLIC TO ROLE SWTBER27_USER187_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER187.PUBLIC TO ROLE SWTBER27_USER187_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER187_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER187
  PASSWORD = '2NQMy1wM4WTz'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER187_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER187_RL TO USER SWTBER27_USER187;

-- ----------------------------------------------------------------------------
-- USER188
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER188
  COMMENT = 'Openflow HoL sandbox for user188. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER188.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER188_RL
  COMMENT = 'Openflow HoL login/execute-as role for user188. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER188 TO ROLE SWTBER27_USER188_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER188.PUBLIC TO ROLE SWTBER27_USER188_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER188_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER188.PUBLIC TO ROLE SWTBER27_USER188_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER188.PUBLIC TO ROLE SWTBER27_USER188_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER188_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER188
  PASSWORD = 'PhjNY9QCZZU8'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER188_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER188_RL TO USER SWTBER27_USER188;

-- ----------------------------------------------------------------------------
-- USER189
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER189
  COMMENT = 'Openflow HoL sandbox for user189. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER189.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER189_RL
  COMMENT = 'Openflow HoL login/execute-as role for user189. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER189 TO ROLE SWTBER27_USER189_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER189.PUBLIC TO ROLE SWTBER27_USER189_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER189_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER189.PUBLIC TO ROLE SWTBER27_USER189_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER189.PUBLIC TO ROLE SWTBER27_USER189_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER189_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER189
  PASSWORD = 'Y2hPJTjLO6Lo'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER189_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER189_RL TO USER SWTBER27_USER189;

-- ----------------------------------------------------------------------------
-- USER190
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER190
  COMMENT = 'Openflow HoL sandbox for user190. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER190.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER190_RL
  COMMENT = 'Openflow HoL login/execute-as role for user190. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER190 TO ROLE SWTBER27_USER190_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER190.PUBLIC TO ROLE SWTBER27_USER190_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER190_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER190.PUBLIC TO ROLE SWTBER27_USER190_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER190.PUBLIC TO ROLE SWTBER27_USER190_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER190_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER190
  PASSWORD = '5jvMIXnyMwbS'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER190_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER190_RL TO USER SWTBER27_USER190;

-- ----------------------------------------------------------------------------
-- USER191
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER191
  COMMENT = 'Openflow HoL sandbox for user191. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER191.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER191_RL
  COMMENT = 'Openflow HoL login/execute-as role for user191. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER191 TO ROLE SWTBER27_USER191_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER191.PUBLIC TO ROLE SWTBER27_USER191_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER191_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER191.PUBLIC TO ROLE SWTBER27_USER191_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER191.PUBLIC TO ROLE SWTBER27_USER191_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER191_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER191
  PASSWORD = 'MM1wat7kijEM'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER191_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER191_RL TO USER SWTBER27_USER191;

-- ----------------------------------------------------------------------------
-- USER192
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER192
  COMMENT = 'Openflow HoL sandbox for user192. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER192.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER192_RL
  COMMENT = 'Openflow HoL login/execute-as role for user192. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER192 TO ROLE SWTBER27_USER192_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER192.PUBLIC TO ROLE SWTBER27_USER192_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER192_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER192.PUBLIC TO ROLE SWTBER27_USER192_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER192.PUBLIC TO ROLE SWTBER27_USER192_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER192_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER192
  PASSWORD = 'BEK468qs0rqa'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER192_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER192_RL TO USER SWTBER27_USER192;

-- ----------------------------------------------------------------------------
-- USER193
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER193
  COMMENT = 'Openflow HoL sandbox for user193. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER193.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER193_RL
  COMMENT = 'Openflow HoL login/execute-as role for user193. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER193 TO ROLE SWTBER27_USER193_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER193.PUBLIC TO ROLE SWTBER27_USER193_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER193_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER193.PUBLIC TO ROLE SWTBER27_USER193_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER193.PUBLIC TO ROLE SWTBER27_USER193_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER193_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER193
  PASSWORD = 'bZhMVDS60CSK'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER193_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER193_RL TO USER SWTBER27_USER193;

-- ----------------------------------------------------------------------------
-- USER194
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER194
  COMMENT = 'Openflow HoL sandbox for user194. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER194.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER194_RL
  COMMENT = 'Openflow HoL login/execute-as role for user194. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER194 TO ROLE SWTBER27_USER194_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER194.PUBLIC TO ROLE SWTBER27_USER194_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER194_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER194.PUBLIC TO ROLE SWTBER27_USER194_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER194.PUBLIC TO ROLE SWTBER27_USER194_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER194_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER194
  PASSWORD = 'nS1QFXcckfOu'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER194_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER194_RL TO USER SWTBER27_USER194;

-- ----------------------------------------------------------------------------
-- USER195
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER195
  COMMENT = 'Openflow HoL sandbox for user195. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER195.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER195_RL
  COMMENT = 'Openflow HoL login/execute-as role for user195. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER195 TO ROLE SWTBER27_USER195_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER195.PUBLIC TO ROLE SWTBER27_USER195_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER195_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER195.PUBLIC TO ROLE SWTBER27_USER195_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER195.PUBLIC TO ROLE SWTBER27_USER195_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER195_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER195
  PASSWORD = 'Q8BZfNifCbo5'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER195_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER195_RL TO USER SWTBER27_USER195;

-- ----------------------------------------------------------------------------
-- USER196
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER196
  COMMENT = 'Openflow HoL sandbox for user196. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER196.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER196_RL
  COMMENT = 'Openflow HoL login/execute-as role for user196. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER196 TO ROLE SWTBER27_USER196_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER196.PUBLIC TO ROLE SWTBER27_USER196_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER196_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER196.PUBLIC TO ROLE SWTBER27_USER196_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER196.PUBLIC TO ROLE SWTBER27_USER196_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER196_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER196
  PASSWORD = 'fy0F3WlTogjk'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER196_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER196_RL TO USER SWTBER27_USER196;

-- ----------------------------------------------------------------------------
-- USER197
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER197
  COMMENT = 'Openflow HoL sandbox for user197. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER197.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER197_RL
  COMMENT = 'Openflow HoL login/execute-as role for user197. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER197 TO ROLE SWTBER27_USER197_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER197.PUBLIC TO ROLE SWTBER27_USER197_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER197_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER197.PUBLIC TO ROLE SWTBER27_USER197_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER197.PUBLIC TO ROLE SWTBER27_USER197_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER197_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER197
  PASSWORD = 'XzpqySQVci3n'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER197_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER197_RL TO USER SWTBER27_USER197;

-- ----------------------------------------------------------------------------
-- USER198
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER198
  COMMENT = 'Openflow HoL sandbox for user198. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER198.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER198_RL
  COMMENT = 'Openflow HoL login/execute-as role for user198. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER198 TO ROLE SWTBER27_USER198_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER198.PUBLIC TO ROLE SWTBER27_USER198_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER198_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER198.PUBLIC TO ROLE SWTBER27_USER198_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER198.PUBLIC TO ROLE SWTBER27_USER198_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER198_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER198
  PASSWORD = 'htgA1I4gFSNc'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER198_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER198_RL TO USER SWTBER27_USER198;

-- ----------------------------------------------------------------------------
-- USER199
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER199
  COMMENT = 'Openflow HoL sandbox for user199. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER199.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER199_RL
  COMMENT = 'Openflow HoL login/execute-as role for user199. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER199 TO ROLE SWTBER27_USER199_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER199.PUBLIC TO ROLE SWTBER27_USER199_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER199_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER199.PUBLIC TO ROLE SWTBER27_USER199_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER199.PUBLIC TO ROLE SWTBER27_USER199_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER199_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER199
  PASSWORD = 'fMTIHFe502w9'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER199_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER199_RL TO USER SWTBER27_USER199;

-- ----------------------------------------------------------------------------
-- USER200
-- ----------------------------------------------------------------------------

-- Isolated, empty database - attendees build/own their destination table(s)
-- as part of the flow; nothing is pre-created here.
CREATE DATABASE IF NOT EXISTS SWTBER27_USER200
  COMMENT = 'Openflow HoL sandbox for user200. [openflow]';

CREATE SCHEMA IF NOT EXISTS SWTBER27_USER200.PUBLIC;

-- Role: doubles as login role AND Openflow runtime execute-as role.
-- Holds ONLY database ownership directly - everything else comes from
-- inheriting the shared attendee role below.
CREATE ROLE IF NOT EXISTS SWTBER27_USER200_RL
  COMMENT = 'Openflow HoL login/execute-as role for user200. [openflow]';

GRANT OWNERSHIP ON DATABASE SWTBER27_USER200 TO ROLE SWTBER27_USER200_RL COPY CURRENT GRANTS;

-- Database ownership transfer does NOT cascade to already-created child
-- schemas - transfer PUBLIC schema ownership explicitly too, or the
-- attendee will find their own PUBLIC schema still owned by ACCOUNTADMIN.
GRANT OWNERSHIP ON SCHEMA SWTBER27_USER200.PUBLIC TO ROLE SWTBER27_USER200_RL COPY CURRENT GRANTS;

-- Inherit all shared privileges (Gen2 deployment USAGE, EAI, warehouse,
-- shared infra access, Postgres credentials) from the common role - nothing
-- granted directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER200_RL;

-- Gen2: runtimes and connectors are schema-level objects created inside the
-- attendee's own database. Schema OWNERSHIP already implies CREATE OPENFLOW
-- RUNTIME, but CREATE OPENFLOW CONNECTOR is NOT documented as implied by
-- ownership - so grant both explicitly rather than relying on it.
GRANT CREATE OPENFLOW RUNTIME   ON SCHEMA SWTBER27_USER200.PUBLIC TO ROLE SWTBER27_USER200_RL;
GRANT CREATE OPENFLOW CONNECTOR ON SCHEMA SWTBER27_USER200.PUBLIC TO ROLE SWTBER27_USER200_RL;

-- Let the lab admin assume any attendee role for support and smoke testing,
-- without needing the attendee's password.
GRANT ROLE SWTBER27_USER200_RL TO ROLE SYSADMIN;

-- User. MUST_CHANGE_PASSWORD = FALSE on purpose: attendees keep the password
-- printed in users.yml for the whole lab, so there is no first-login prompt.
CREATE USER IF NOT EXISTS SWTBER27_USER200
  PASSWORD = 'zOssUi9xxQLf'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_ROLE = SWTBER27_USER200_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL attendee. [openflow]';

GRANT ROLE SWTBER27_USER200_RL TO USER SWTBER27_USER200;

