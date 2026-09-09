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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER01_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER01
  PASSWORD = 'CkXVu7n05wOL'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER01_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER02_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER02
  PASSWORD = 'jP6bl6c2YnR6'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER02_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER03_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER03
  PASSWORD = '83xQbbnHWW5B'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER03_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER04_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER04
  PASSWORD = '1CdVYzxIZspp'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER04_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER05_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER05
  PASSWORD = 'NiCDBdStXrG2'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER05_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER06_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER06
  PASSWORD = 'Sa8Mmp7hbC6D'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER06_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER07_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER07
  PASSWORD = 'L2G6d9PI3g9j'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER07_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER08_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER08
  PASSWORD = 'sWEd117r6mvi'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER08_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER09_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER09
  PASSWORD = 'bPso4cX95IIm'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER09_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER10_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER10
  PASSWORD = 'CxZQM3M5zmrB'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER10_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER11_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER11
  PASSWORD = 'ixtfHF53fYTc'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER11_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER12_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER12
  PASSWORD = 'lN8OkpPrOY2h'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER12_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER13_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER13
  PASSWORD = '9t6QvYcPxvus'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER13_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER14_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER14
  PASSWORD = 'Qm4mmOGwfYhn'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER14_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

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

-- Inherit all shared privileges (deployment USAGE, runtime creation, EAI,
-- warehouse, shared infra access) from the common role - nothing granted
-- directly to this per-user role beyond its own database.
GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_USER15_RL;

-- User
CREATE USER IF NOT EXISTS SWTBER27_USER15
  PASSWORD = 'Gdbe8GLDYbu6'
  MUST_CHANGE_PASSWORD = TRUE
  DEFAULT_ROLE = SWTBER27_USER15_RL
  DEFAULT_WAREHOUSE = COMPUTE_WH
  DEFAULT_SECONDARY_ROLES = ('ALL')
  COMMENT = 'Openflow HoL pilot attendee. [openflow]';

GRANT ROLE SWTBER27_USER15_RL TO USER SWTBER27_USER15;

