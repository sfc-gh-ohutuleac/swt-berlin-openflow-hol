--!jinja
-- ============================================================================
-- Openflow HoL - Per-User Gen2 Runtime Provisioning
-- GENERATED FILE - edit templates/provision_runtimes.sql.j2 instead.
--
-- Execute SELECTIVELY. Each block is self-contained; run only the blocks for
-- the attendees you actually want runtimes for.
-- ============================================================================

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER01  ->  SWTBER27_USER01.PUBLIC.SWTBER27_USER01_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER01_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER01.PUBLIC.SWTBER27_USER01_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER01_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER01 Runtime'
  COMMENT = 'Openflow HoL runtime for user01, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER02  ->  SWTBER27_USER02.PUBLIC.SWTBER27_USER02_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER02_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER02.PUBLIC.SWTBER27_USER02_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER02_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER02 Runtime'
  COMMENT = 'Openflow HoL runtime for user02, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER03  ->  SWTBER27_USER03.PUBLIC.SWTBER27_USER03_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER03_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER03.PUBLIC.SWTBER27_USER03_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER03_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER03 Runtime'
  COMMENT = 'Openflow HoL runtime for user03, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER04  ->  SWTBER27_USER04.PUBLIC.SWTBER27_USER04_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER04_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER04.PUBLIC.SWTBER27_USER04_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER04_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER04 Runtime'
  COMMENT = 'Openflow HoL runtime for user04, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER05  ->  SWTBER27_USER05.PUBLIC.SWTBER27_USER05_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER05_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER05.PUBLIC.SWTBER27_USER05_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER05_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER05 Runtime'
  COMMENT = 'Openflow HoL runtime for user05, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER06  ->  SWTBER27_USER06.PUBLIC.SWTBER27_USER06_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER06_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER06.PUBLIC.SWTBER27_USER06_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER06_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER06 Runtime'
  COMMENT = 'Openflow HoL runtime for user06, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER07  ->  SWTBER27_USER07.PUBLIC.SWTBER27_USER07_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER07_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER07.PUBLIC.SWTBER27_USER07_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER07_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER07 Runtime'
  COMMENT = 'Openflow HoL runtime for user07, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER08  ->  SWTBER27_USER08.PUBLIC.SWTBER27_USER08_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER08_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER08.PUBLIC.SWTBER27_USER08_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER08_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER08 Runtime'
  COMMENT = 'Openflow HoL runtime for user08, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER09  ->  SWTBER27_USER09.PUBLIC.SWTBER27_USER09_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER09_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER09.PUBLIC.SWTBER27_USER09_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER09_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER09 Runtime'
  COMMENT = 'Openflow HoL runtime for user09, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER10  ->  SWTBER27_USER10.PUBLIC.SWTBER27_USER10_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER10_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER10.PUBLIC.SWTBER27_USER10_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER10_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER10 Runtime'
  COMMENT = 'Openflow HoL runtime for user10, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER11  ->  SWTBER27_USER11.PUBLIC.SWTBER27_USER11_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER11_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER11.PUBLIC.SWTBER27_USER11_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER11_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER11 Runtime'
  COMMENT = 'Openflow HoL runtime for user11, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER12  ->  SWTBER27_USER12.PUBLIC.SWTBER27_USER12_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER12_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER12.PUBLIC.SWTBER27_USER12_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER12_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER12 Runtime'
  COMMENT = 'Openflow HoL runtime for user12, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER13  ->  SWTBER27_USER13.PUBLIC.SWTBER27_USER13_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER13_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER13.PUBLIC.SWTBER27_USER13_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER13_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER13 Runtime'
  COMMENT = 'Openflow HoL runtime for user13, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER14  ->  SWTBER27_USER14.PUBLIC.SWTBER27_USER14_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER14_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER14.PUBLIC.SWTBER27_USER14_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER14_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER14 Runtime'
  COMMENT = 'Openflow HoL runtime for user14, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER15  ->  SWTBER27_USER15.PUBLIC.SWTBER27_USER15_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER15_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER15.PUBLIC.SWTBER27_USER15_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER15_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER15 Runtime'
  COMMENT = 'Openflow HoL runtime for user15, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER16  ->  SWTBER27_USER16.PUBLIC.SWTBER27_USER16_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER16_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER16.PUBLIC.SWTBER27_USER16_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER16_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER16 Runtime'
  COMMENT = 'Openflow HoL runtime for user16, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER17  ->  SWTBER27_USER17.PUBLIC.SWTBER27_USER17_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER17_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER17.PUBLIC.SWTBER27_USER17_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER17_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER17 Runtime'
  COMMENT = 'Openflow HoL runtime for user17, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER18  ->  SWTBER27_USER18.PUBLIC.SWTBER27_USER18_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER18_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER18.PUBLIC.SWTBER27_USER18_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER18_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER18 Runtime'
  COMMENT = 'Openflow HoL runtime for user18, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER19  ->  SWTBER27_USER19.PUBLIC.SWTBER27_USER19_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER19_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER19.PUBLIC.SWTBER27_USER19_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER19_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER19 Runtime'
  COMMENT = 'Openflow HoL runtime for user19, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER20  ->  SWTBER27_USER20.PUBLIC.SWTBER27_USER20_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER20_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER20.PUBLIC.SWTBER27_USER20_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER20_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER20 Runtime'
  COMMENT = 'Openflow HoL runtime for user20, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER21  ->  SWTBER27_USER21.PUBLIC.SWTBER27_USER21_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER21_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER21.PUBLIC.SWTBER27_USER21_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER21_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER21 Runtime'
  COMMENT = 'Openflow HoL runtime for user21, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER22  ->  SWTBER27_USER22.PUBLIC.SWTBER27_USER22_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER22_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER22.PUBLIC.SWTBER27_USER22_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER22_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER22 Runtime'
  COMMENT = 'Openflow HoL runtime for user22, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER23  ->  SWTBER27_USER23.PUBLIC.SWTBER27_USER23_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER23_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER23.PUBLIC.SWTBER27_USER23_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER23_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER23 Runtime'
  COMMENT = 'Openflow HoL runtime for user23, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER24  ->  SWTBER27_USER24.PUBLIC.SWTBER27_USER24_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER24_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER24.PUBLIC.SWTBER27_USER24_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER24_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER24 Runtime'
  COMMENT = 'Openflow HoL runtime for user24, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER25  ->  SWTBER27_USER25.PUBLIC.SWTBER27_USER25_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER25_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER25.PUBLIC.SWTBER27_USER25_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER25_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER25 Runtime'
  COMMENT = 'Openflow HoL runtime for user25, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER26  ->  SWTBER27_USER26.PUBLIC.SWTBER27_USER26_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER26_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER26.PUBLIC.SWTBER27_USER26_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER26_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER26 Runtime'
  COMMENT = 'Openflow HoL runtime for user26, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER27  ->  SWTBER27_USER27.PUBLIC.SWTBER27_USER27_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER27_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER27.PUBLIC.SWTBER27_USER27_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER27_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER27 Runtime'
  COMMENT = 'Openflow HoL runtime for user27, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER28  ->  SWTBER27_USER28.PUBLIC.SWTBER27_USER28_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER28_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER28.PUBLIC.SWTBER27_USER28_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER28_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER28 Runtime'
  COMMENT = 'Openflow HoL runtime for user28, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER29  ->  SWTBER27_USER29.PUBLIC.SWTBER27_USER29_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER29_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER29.PUBLIC.SWTBER27_USER29_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER29_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER29 Runtime'
  COMMENT = 'Openflow HoL runtime for user29, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER30  ->  SWTBER27_USER30.PUBLIC.SWTBER27_USER30_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER30_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER30.PUBLIC.SWTBER27_USER30_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER30_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER30 Runtime'
  COMMENT = 'Openflow HoL runtime for user30, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER31  ->  SWTBER27_USER31.PUBLIC.SWTBER27_USER31_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER31_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER31.PUBLIC.SWTBER27_USER31_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER31_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER31 Runtime'
  COMMENT = 'Openflow HoL runtime for user31, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER32  ->  SWTBER27_USER32.PUBLIC.SWTBER27_USER32_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER32_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER32.PUBLIC.SWTBER27_USER32_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER32_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER32 Runtime'
  COMMENT = 'Openflow HoL runtime for user32, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER33  ->  SWTBER27_USER33.PUBLIC.SWTBER27_USER33_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER33_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER33.PUBLIC.SWTBER27_USER33_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER33_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER33 Runtime'
  COMMENT = 'Openflow HoL runtime for user33, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER34  ->  SWTBER27_USER34.PUBLIC.SWTBER27_USER34_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER34_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER34.PUBLIC.SWTBER27_USER34_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER34_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER34 Runtime'
  COMMENT = 'Openflow HoL runtime for user34, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER35  ->  SWTBER27_USER35.PUBLIC.SWTBER27_USER35_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER35_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER35.PUBLIC.SWTBER27_USER35_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER35_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER35 Runtime'
  COMMENT = 'Openflow HoL runtime for user35, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER36  ->  SWTBER27_USER36.PUBLIC.SWTBER27_USER36_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER36_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER36.PUBLIC.SWTBER27_USER36_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER36_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER36 Runtime'
  COMMENT = 'Openflow HoL runtime for user36, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER37  ->  SWTBER27_USER37.PUBLIC.SWTBER27_USER37_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER37_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER37.PUBLIC.SWTBER27_USER37_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER37_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER37 Runtime'
  COMMENT = 'Openflow HoL runtime for user37, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER38  ->  SWTBER27_USER38.PUBLIC.SWTBER27_USER38_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER38_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER38.PUBLIC.SWTBER27_USER38_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER38_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER38 Runtime'
  COMMENT = 'Openflow HoL runtime for user38, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER39  ->  SWTBER27_USER39.PUBLIC.SWTBER27_USER39_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER39_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER39.PUBLIC.SWTBER27_USER39_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER39_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER39 Runtime'
  COMMENT = 'Openflow HoL runtime for user39, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER40  ->  SWTBER27_USER40.PUBLIC.SWTBER27_USER40_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER40_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER40.PUBLIC.SWTBER27_USER40_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER40_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER40 Runtime'
  COMMENT = 'Openflow HoL runtime for user40, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER41  ->  SWTBER27_USER41.PUBLIC.SWTBER27_USER41_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER41_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER41.PUBLIC.SWTBER27_USER41_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER41_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER41 Runtime'
  COMMENT = 'Openflow HoL runtime for user41, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER42  ->  SWTBER27_USER42.PUBLIC.SWTBER27_USER42_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER42_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER42.PUBLIC.SWTBER27_USER42_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER42_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER42 Runtime'
  COMMENT = 'Openflow HoL runtime for user42, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER43  ->  SWTBER27_USER43.PUBLIC.SWTBER27_USER43_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER43_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER43.PUBLIC.SWTBER27_USER43_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER43_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER43 Runtime'
  COMMENT = 'Openflow HoL runtime for user43, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER44  ->  SWTBER27_USER44.PUBLIC.SWTBER27_USER44_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER44_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER44.PUBLIC.SWTBER27_USER44_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER44_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER44 Runtime'
  COMMENT = 'Openflow HoL runtime for user44, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER45  ->  SWTBER27_USER45.PUBLIC.SWTBER27_USER45_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER45_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER45.PUBLIC.SWTBER27_USER45_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER45_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER45 Runtime'
  COMMENT = 'Openflow HoL runtime for user45, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER46  ->  SWTBER27_USER46.PUBLIC.SWTBER27_USER46_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER46_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER46.PUBLIC.SWTBER27_USER46_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER46_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER46 Runtime'
  COMMENT = 'Openflow HoL runtime for user46, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER47  ->  SWTBER27_USER47.PUBLIC.SWTBER27_USER47_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER47_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER47.PUBLIC.SWTBER27_USER47_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER47_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER47 Runtime'
  COMMENT = 'Openflow HoL runtime for user47, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER48  ->  SWTBER27_USER48.PUBLIC.SWTBER27_USER48_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER48_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER48.PUBLIC.SWTBER27_USER48_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER48_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER48 Runtime'
  COMMENT = 'Openflow HoL runtime for user48, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER49  ->  SWTBER27_USER49.PUBLIC.SWTBER27_USER49_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER49_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER49.PUBLIC.SWTBER27_USER49_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER49_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER49 Runtime'
  COMMENT = 'Openflow HoL runtime for user49, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER50  ->  SWTBER27_USER50.PUBLIC.SWTBER27_USER50_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER50_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER50.PUBLIC.SWTBER27_USER50_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER50_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER50 Runtime'
  COMMENT = 'Openflow HoL runtime for user50, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER51  ->  SWTBER27_USER51.PUBLIC.SWTBER27_USER51_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER51_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER51.PUBLIC.SWTBER27_USER51_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER51_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER51 Runtime'
  COMMENT = 'Openflow HoL runtime for user51, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER52  ->  SWTBER27_USER52.PUBLIC.SWTBER27_USER52_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER52_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER52.PUBLIC.SWTBER27_USER52_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER52_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER52 Runtime'
  COMMENT = 'Openflow HoL runtime for user52, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER53  ->  SWTBER27_USER53.PUBLIC.SWTBER27_USER53_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER53_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER53.PUBLIC.SWTBER27_USER53_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER53_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER53 Runtime'
  COMMENT = 'Openflow HoL runtime for user53, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER54  ->  SWTBER27_USER54.PUBLIC.SWTBER27_USER54_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER54_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER54.PUBLIC.SWTBER27_USER54_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER54_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER54 Runtime'
  COMMENT = 'Openflow HoL runtime for user54, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER55  ->  SWTBER27_USER55.PUBLIC.SWTBER27_USER55_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER55_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER55.PUBLIC.SWTBER27_USER55_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER55_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER55 Runtime'
  COMMENT = 'Openflow HoL runtime for user55, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER56  ->  SWTBER27_USER56.PUBLIC.SWTBER27_USER56_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER56_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER56.PUBLIC.SWTBER27_USER56_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER56_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER56 Runtime'
  COMMENT = 'Openflow HoL runtime for user56, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER57  ->  SWTBER27_USER57.PUBLIC.SWTBER27_USER57_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER57_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER57.PUBLIC.SWTBER27_USER57_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER57_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER57 Runtime'
  COMMENT = 'Openflow HoL runtime for user57, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER58  ->  SWTBER27_USER58.PUBLIC.SWTBER27_USER58_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER58_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER58.PUBLIC.SWTBER27_USER58_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER58_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER58 Runtime'
  COMMENT = 'Openflow HoL runtime for user58, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER59  ->  SWTBER27_USER59.PUBLIC.SWTBER27_USER59_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER59_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER59.PUBLIC.SWTBER27_USER59_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER59_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER59 Runtime'
  COMMENT = 'Openflow HoL runtime for user59, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER60  ->  SWTBER27_USER60.PUBLIC.SWTBER27_USER60_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER60_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER60.PUBLIC.SWTBER27_USER60_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER60_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER60 Runtime'
  COMMENT = 'Openflow HoL runtime for user60, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER61  ->  SWTBER27_USER61.PUBLIC.SWTBER27_USER61_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER61_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER61.PUBLIC.SWTBER27_USER61_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER61_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER61 Runtime'
  COMMENT = 'Openflow HoL runtime for user61, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER62  ->  SWTBER27_USER62.PUBLIC.SWTBER27_USER62_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER62_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER62.PUBLIC.SWTBER27_USER62_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER62_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER62 Runtime'
  COMMENT = 'Openflow HoL runtime for user62, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER63  ->  SWTBER27_USER63.PUBLIC.SWTBER27_USER63_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER63_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER63.PUBLIC.SWTBER27_USER63_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER63_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER63 Runtime'
  COMMENT = 'Openflow HoL runtime for user63, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER64  ->  SWTBER27_USER64.PUBLIC.SWTBER27_USER64_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER64_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER64.PUBLIC.SWTBER27_USER64_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER64_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER64 Runtime'
  COMMENT = 'Openflow HoL runtime for user64, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER65  ->  SWTBER27_USER65.PUBLIC.SWTBER27_USER65_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER65_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER65.PUBLIC.SWTBER27_USER65_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER65_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER65 Runtime'
  COMMENT = 'Openflow HoL runtime for user65, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER66  ->  SWTBER27_USER66.PUBLIC.SWTBER27_USER66_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER66_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER66.PUBLIC.SWTBER27_USER66_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER66_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER66 Runtime'
  COMMENT = 'Openflow HoL runtime for user66, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER67  ->  SWTBER27_USER67.PUBLIC.SWTBER27_USER67_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER67_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER67.PUBLIC.SWTBER27_USER67_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER67_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER67 Runtime'
  COMMENT = 'Openflow HoL runtime for user67, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER68  ->  SWTBER27_USER68.PUBLIC.SWTBER27_USER68_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER68_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER68.PUBLIC.SWTBER27_USER68_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER68_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER68 Runtime'
  COMMENT = 'Openflow HoL runtime for user68, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER69  ->  SWTBER27_USER69.PUBLIC.SWTBER27_USER69_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER69_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER69.PUBLIC.SWTBER27_USER69_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER69_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER69 Runtime'
  COMMENT = 'Openflow HoL runtime for user69, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER70  ->  SWTBER27_USER70.PUBLIC.SWTBER27_USER70_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER70_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER70.PUBLIC.SWTBER27_USER70_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER70_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER70 Runtime'
  COMMENT = 'Openflow HoL runtime for user70, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER71  ->  SWTBER27_USER71.PUBLIC.SWTBER27_USER71_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER71_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER71.PUBLIC.SWTBER27_USER71_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER71_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER71 Runtime'
  COMMENT = 'Openflow HoL runtime for user71, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER72  ->  SWTBER27_USER72.PUBLIC.SWTBER27_USER72_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER72_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER72.PUBLIC.SWTBER27_USER72_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER72_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER72 Runtime'
  COMMENT = 'Openflow HoL runtime for user72, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER73  ->  SWTBER27_USER73.PUBLIC.SWTBER27_USER73_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER73_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER73.PUBLIC.SWTBER27_USER73_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER73_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER73 Runtime'
  COMMENT = 'Openflow HoL runtime for user73, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER74  ->  SWTBER27_USER74.PUBLIC.SWTBER27_USER74_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER74_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER74.PUBLIC.SWTBER27_USER74_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER74_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER74 Runtime'
  COMMENT = 'Openflow HoL runtime for user74, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER75  ->  SWTBER27_USER75.PUBLIC.SWTBER27_USER75_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER75_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER75.PUBLIC.SWTBER27_USER75_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER75_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER75 Runtime'
  COMMENT = 'Openflow HoL runtime for user75, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER76  ->  SWTBER27_USER76.PUBLIC.SWTBER27_USER76_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER76_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER76.PUBLIC.SWTBER27_USER76_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER76_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER76 Runtime'
  COMMENT = 'Openflow HoL runtime for user76, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER77  ->  SWTBER27_USER77.PUBLIC.SWTBER27_USER77_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER77_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER77.PUBLIC.SWTBER27_USER77_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER77_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER77 Runtime'
  COMMENT = 'Openflow HoL runtime for user77, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER78  ->  SWTBER27_USER78.PUBLIC.SWTBER27_USER78_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER78_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER78.PUBLIC.SWTBER27_USER78_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER78_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER78 Runtime'
  COMMENT = 'Openflow HoL runtime for user78, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER79  ->  SWTBER27_USER79.PUBLIC.SWTBER27_USER79_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER79_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER79.PUBLIC.SWTBER27_USER79_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER79_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER79 Runtime'
  COMMENT = 'Openflow HoL runtime for user79, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER80  ->  SWTBER27_USER80.PUBLIC.SWTBER27_USER80_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER80_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER80.PUBLIC.SWTBER27_USER80_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER80_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER80 Runtime'
  COMMENT = 'Openflow HoL runtime for user80, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER81  ->  SWTBER27_USER81.PUBLIC.SWTBER27_USER81_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER81_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER81.PUBLIC.SWTBER27_USER81_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER81_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER81 Runtime'
  COMMENT = 'Openflow HoL runtime for user81, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER82  ->  SWTBER27_USER82.PUBLIC.SWTBER27_USER82_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER82_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER82.PUBLIC.SWTBER27_USER82_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER82_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER82 Runtime'
  COMMENT = 'Openflow HoL runtime for user82, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER83  ->  SWTBER27_USER83.PUBLIC.SWTBER27_USER83_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER83_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER83.PUBLIC.SWTBER27_USER83_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER83_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER83 Runtime'
  COMMENT = 'Openflow HoL runtime for user83, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER84  ->  SWTBER27_USER84.PUBLIC.SWTBER27_USER84_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER84_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER84.PUBLIC.SWTBER27_USER84_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER84_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER84 Runtime'
  COMMENT = 'Openflow HoL runtime for user84, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER85  ->  SWTBER27_USER85.PUBLIC.SWTBER27_USER85_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER85_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER85.PUBLIC.SWTBER27_USER85_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER85_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER85 Runtime'
  COMMENT = 'Openflow HoL runtime for user85, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER86  ->  SWTBER27_USER86.PUBLIC.SWTBER27_USER86_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER86_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER86.PUBLIC.SWTBER27_USER86_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER86_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER86 Runtime'
  COMMENT = 'Openflow HoL runtime for user86, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER87  ->  SWTBER27_USER87.PUBLIC.SWTBER27_USER87_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER87_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER87.PUBLIC.SWTBER27_USER87_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER87_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER87 Runtime'
  COMMENT = 'Openflow HoL runtime for user87, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER88  ->  SWTBER27_USER88.PUBLIC.SWTBER27_USER88_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER88_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER88.PUBLIC.SWTBER27_USER88_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER88_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER88 Runtime'
  COMMENT = 'Openflow HoL runtime for user88, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER89  ->  SWTBER27_USER89.PUBLIC.SWTBER27_USER89_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER89_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER89.PUBLIC.SWTBER27_USER89_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER89_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER89 Runtime'
  COMMENT = 'Openflow HoL runtime for user89, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER90  ->  SWTBER27_USER90.PUBLIC.SWTBER27_USER90_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER90_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER90.PUBLIC.SWTBER27_USER90_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER90_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER90 Runtime'
  COMMENT = 'Openflow HoL runtime for user90, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER91  ->  SWTBER27_USER91.PUBLIC.SWTBER27_USER91_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER91_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER91.PUBLIC.SWTBER27_USER91_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER91_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER91 Runtime'
  COMMENT = 'Openflow HoL runtime for user91, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER92  ->  SWTBER27_USER92.PUBLIC.SWTBER27_USER92_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER92_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER92.PUBLIC.SWTBER27_USER92_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER92_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER92 Runtime'
  COMMENT = 'Openflow HoL runtime for user92, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER93  ->  SWTBER27_USER93.PUBLIC.SWTBER27_USER93_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER93_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER93.PUBLIC.SWTBER27_USER93_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER93_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER93 Runtime'
  COMMENT = 'Openflow HoL runtime for user93, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER94  ->  SWTBER27_USER94.PUBLIC.SWTBER27_USER94_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER94_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER94.PUBLIC.SWTBER27_USER94_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER94_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER94 Runtime'
  COMMENT = 'Openflow HoL runtime for user94, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER95  ->  SWTBER27_USER95.PUBLIC.SWTBER27_USER95_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER95_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER95.PUBLIC.SWTBER27_USER95_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER95_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER95 Runtime'
  COMMENT = 'Openflow HoL runtime for user95, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER96  ->  SWTBER27_USER96.PUBLIC.SWTBER27_USER96_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER96_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER96.PUBLIC.SWTBER27_USER96_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER96_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER96 Runtime'
  COMMENT = 'Openflow HoL runtime for user96, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER97  ->  SWTBER27_USER97.PUBLIC.SWTBER27_USER97_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER97_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER97.PUBLIC.SWTBER27_USER97_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER97_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER97 Runtime'
  COMMENT = 'Openflow HoL runtime for user97, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER98  ->  SWTBER27_USER98.PUBLIC.SWTBER27_USER98_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER98_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER98.PUBLIC.SWTBER27_USER98_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER98_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER98 Runtime'
  COMMENT = 'Openflow HoL runtime for user98, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER99  ->  SWTBER27_USER99.PUBLIC.SWTBER27_USER99_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER99_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER99.PUBLIC.SWTBER27_USER99_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER99_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER99 Runtime'
  COMMENT = 'Openflow HoL runtime for user99, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER100  ->  SWTBER27_USER100.PUBLIC.SWTBER27_USER100_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER100_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER100.PUBLIC.SWTBER27_USER100_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER100_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER100 Runtime'
  COMMENT = 'Openflow HoL runtime for user100, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER101  ->  SWTBER27_USER101.PUBLIC.SWTBER27_USER101_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER101_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER101.PUBLIC.SWTBER27_USER101_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER101_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER101 Runtime'
  COMMENT = 'Openflow HoL runtime for user101, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER102  ->  SWTBER27_USER102.PUBLIC.SWTBER27_USER102_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER102_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER102.PUBLIC.SWTBER27_USER102_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER102_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER102 Runtime'
  COMMENT = 'Openflow HoL runtime for user102, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER103  ->  SWTBER27_USER103.PUBLIC.SWTBER27_USER103_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER103_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER103.PUBLIC.SWTBER27_USER103_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER103_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER103 Runtime'
  COMMENT = 'Openflow HoL runtime for user103, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER104  ->  SWTBER27_USER104.PUBLIC.SWTBER27_USER104_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER104_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER104.PUBLIC.SWTBER27_USER104_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER104_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER104 Runtime'
  COMMENT = 'Openflow HoL runtime for user104, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER105  ->  SWTBER27_USER105.PUBLIC.SWTBER27_USER105_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER105_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER105.PUBLIC.SWTBER27_USER105_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER105_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER105 Runtime'
  COMMENT = 'Openflow HoL runtime for user105, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER106  ->  SWTBER27_USER106.PUBLIC.SWTBER27_USER106_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER106_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER106.PUBLIC.SWTBER27_USER106_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER106_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER106 Runtime'
  COMMENT = 'Openflow HoL runtime for user106, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER107  ->  SWTBER27_USER107.PUBLIC.SWTBER27_USER107_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER107_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER107.PUBLIC.SWTBER27_USER107_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER107_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER107 Runtime'
  COMMENT = 'Openflow HoL runtime for user107, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER108  ->  SWTBER27_USER108.PUBLIC.SWTBER27_USER108_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER108_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER108.PUBLIC.SWTBER27_USER108_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER108_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER108 Runtime'
  COMMENT = 'Openflow HoL runtime for user108, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER109  ->  SWTBER27_USER109.PUBLIC.SWTBER27_USER109_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER109_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER109.PUBLIC.SWTBER27_USER109_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER109_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER109 Runtime'
  COMMENT = 'Openflow HoL runtime for user109, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER110  ->  SWTBER27_USER110.PUBLIC.SWTBER27_USER110_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER110_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER110.PUBLIC.SWTBER27_USER110_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER110_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER110 Runtime'
  COMMENT = 'Openflow HoL runtime for user110, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER111  ->  SWTBER27_USER111.PUBLIC.SWTBER27_USER111_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER111_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER111.PUBLIC.SWTBER27_USER111_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER111_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER111 Runtime'
  COMMENT = 'Openflow HoL runtime for user111, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER112  ->  SWTBER27_USER112.PUBLIC.SWTBER27_USER112_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER112_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER112.PUBLIC.SWTBER27_USER112_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER112_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER112 Runtime'
  COMMENT = 'Openflow HoL runtime for user112, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER113  ->  SWTBER27_USER113.PUBLIC.SWTBER27_USER113_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER113_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER113.PUBLIC.SWTBER27_USER113_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER113_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER113 Runtime'
  COMMENT = 'Openflow HoL runtime for user113, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER114  ->  SWTBER27_USER114.PUBLIC.SWTBER27_USER114_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER114_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER114.PUBLIC.SWTBER27_USER114_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER114_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER114 Runtime'
  COMMENT = 'Openflow HoL runtime for user114, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER115  ->  SWTBER27_USER115.PUBLIC.SWTBER27_USER115_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER115_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER115.PUBLIC.SWTBER27_USER115_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER115_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER115 Runtime'
  COMMENT = 'Openflow HoL runtime for user115, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER116  ->  SWTBER27_USER116.PUBLIC.SWTBER27_USER116_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER116_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER116.PUBLIC.SWTBER27_USER116_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER116_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER116 Runtime'
  COMMENT = 'Openflow HoL runtime for user116, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER117  ->  SWTBER27_USER117.PUBLIC.SWTBER27_USER117_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER117_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER117.PUBLIC.SWTBER27_USER117_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER117_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER117 Runtime'
  COMMENT = 'Openflow HoL runtime for user117, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER118  ->  SWTBER27_USER118.PUBLIC.SWTBER27_USER118_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER118_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER118.PUBLIC.SWTBER27_USER118_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER118_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER118 Runtime'
  COMMENT = 'Openflow HoL runtime for user118, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER119  ->  SWTBER27_USER119.PUBLIC.SWTBER27_USER119_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER119_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER119.PUBLIC.SWTBER27_USER119_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER119_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER119 Runtime'
  COMMENT = 'Openflow HoL runtime for user119, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER120  ->  SWTBER27_USER120.PUBLIC.SWTBER27_USER120_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER120_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER120.PUBLIC.SWTBER27_USER120_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER120_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER120 Runtime'
  COMMENT = 'Openflow HoL runtime for user120, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER121  ->  SWTBER27_USER121.PUBLIC.SWTBER27_USER121_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER121_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER121.PUBLIC.SWTBER27_USER121_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER121_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER121 Runtime'
  COMMENT = 'Openflow HoL runtime for user121, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER122  ->  SWTBER27_USER122.PUBLIC.SWTBER27_USER122_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER122_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER122.PUBLIC.SWTBER27_USER122_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER122_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER122 Runtime'
  COMMENT = 'Openflow HoL runtime for user122, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER123  ->  SWTBER27_USER123.PUBLIC.SWTBER27_USER123_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER123_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER123.PUBLIC.SWTBER27_USER123_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER123_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER123 Runtime'
  COMMENT = 'Openflow HoL runtime for user123, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER124  ->  SWTBER27_USER124.PUBLIC.SWTBER27_USER124_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER124_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER124.PUBLIC.SWTBER27_USER124_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER124_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER124 Runtime'
  COMMENT = 'Openflow HoL runtime for user124, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER125  ->  SWTBER27_USER125.PUBLIC.SWTBER27_USER125_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER125_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER125.PUBLIC.SWTBER27_USER125_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER125_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER125 Runtime'
  COMMENT = 'Openflow HoL runtime for user125, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER126  ->  SWTBER27_USER126.PUBLIC.SWTBER27_USER126_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER126_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER126.PUBLIC.SWTBER27_USER126_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER126_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER126 Runtime'
  COMMENT = 'Openflow HoL runtime for user126, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER127  ->  SWTBER27_USER127.PUBLIC.SWTBER27_USER127_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER127_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER127.PUBLIC.SWTBER27_USER127_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER127_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER127 Runtime'
  COMMENT = 'Openflow HoL runtime for user127, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER128  ->  SWTBER27_USER128.PUBLIC.SWTBER27_USER128_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER128_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER128.PUBLIC.SWTBER27_USER128_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER128_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER128 Runtime'
  COMMENT = 'Openflow HoL runtime for user128, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER129  ->  SWTBER27_USER129.PUBLIC.SWTBER27_USER129_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER129_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER129.PUBLIC.SWTBER27_USER129_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER129_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER129 Runtime'
  COMMENT = 'Openflow HoL runtime for user129, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER130  ->  SWTBER27_USER130.PUBLIC.SWTBER27_USER130_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER130_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER130.PUBLIC.SWTBER27_USER130_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER130_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER130 Runtime'
  COMMENT = 'Openflow HoL runtime for user130, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER131  ->  SWTBER27_USER131.PUBLIC.SWTBER27_USER131_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER131_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER131.PUBLIC.SWTBER27_USER131_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER131_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER131 Runtime'
  COMMENT = 'Openflow HoL runtime for user131, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER132  ->  SWTBER27_USER132.PUBLIC.SWTBER27_USER132_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER132_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER132.PUBLIC.SWTBER27_USER132_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER132_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER132 Runtime'
  COMMENT = 'Openflow HoL runtime for user132, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER133  ->  SWTBER27_USER133.PUBLIC.SWTBER27_USER133_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER133_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER133.PUBLIC.SWTBER27_USER133_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER133_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER133 Runtime'
  COMMENT = 'Openflow HoL runtime for user133, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER134  ->  SWTBER27_USER134.PUBLIC.SWTBER27_USER134_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER134_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER134.PUBLIC.SWTBER27_USER134_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER134_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER134 Runtime'
  COMMENT = 'Openflow HoL runtime for user134, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER135  ->  SWTBER27_USER135.PUBLIC.SWTBER27_USER135_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER135_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER135.PUBLIC.SWTBER27_USER135_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER135_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER135 Runtime'
  COMMENT = 'Openflow HoL runtime for user135, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER136  ->  SWTBER27_USER136.PUBLIC.SWTBER27_USER136_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER136_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER136.PUBLIC.SWTBER27_USER136_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER136_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER136 Runtime'
  COMMENT = 'Openflow HoL runtime for user136, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER137  ->  SWTBER27_USER137.PUBLIC.SWTBER27_USER137_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER137_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER137.PUBLIC.SWTBER27_USER137_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER137_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER137 Runtime'
  COMMENT = 'Openflow HoL runtime for user137, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER138  ->  SWTBER27_USER138.PUBLIC.SWTBER27_USER138_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER138_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER138.PUBLIC.SWTBER27_USER138_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER138_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER138 Runtime'
  COMMENT = 'Openflow HoL runtime for user138, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER139  ->  SWTBER27_USER139.PUBLIC.SWTBER27_USER139_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER139_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER139.PUBLIC.SWTBER27_USER139_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER139_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER139 Runtime'
  COMMENT = 'Openflow HoL runtime for user139, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER140  ->  SWTBER27_USER140.PUBLIC.SWTBER27_USER140_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER140_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER140.PUBLIC.SWTBER27_USER140_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER140_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER140 Runtime'
  COMMENT = 'Openflow HoL runtime for user140, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER141  ->  SWTBER27_USER141.PUBLIC.SWTBER27_USER141_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER141_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER141.PUBLIC.SWTBER27_USER141_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER141_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER141 Runtime'
  COMMENT = 'Openflow HoL runtime for user141, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER142  ->  SWTBER27_USER142.PUBLIC.SWTBER27_USER142_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER142_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER142.PUBLIC.SWTBER27_USER142_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER142_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER142 Runtime'
  COMMENT = 'Openflow HoL runtime for user142, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER143  ->  SWTBER27_USER143.PUBLIC.SWTBER27_USER143_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER143_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER143.PUBLIC.SWTBER27_USER143_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER143_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER143 Runtime'
  COMMENT = 'Openflow HoL runtime for user143, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER144  ->  SWTBER27_USER144.PUBLIC.SWTBER27_USER144_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER144_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER144.PUBLIC.SWTBER27_USER144_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER144_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER144 Runtime'
  COMMENT = 'Openflow HoL runtime for user144, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER145  ->  SWTBER27_USER145.PUBLIC.SWTBER27_USER145_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER145_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER145.PUBLIC.SWTBER27_USER145_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER145_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER145 Runtime'
  COMMENT = 'Openflow HoL runtime for user145, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER146  ->  SWTBER27_USER146.PUBLIC.SWTBER27_USER146_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER146_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER146.PUBLIC.SWTBER27_USER146_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER146_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER146 Runtime'
  COMMENT = 'Openflow HoL runtime for user146, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER147  ->  SWTBER27_USER147.PUBLIC.SWTBER27_USER147_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER147_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER147.PUBLIC.SWTBER27_USER147_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER147_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER147 Runtime'
  COMMENT = 'Openflow HoL runtime for user147, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER148  ->  SWTBER27_USER148.PUBLIC.SWTBER27_USER148_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER148_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER148.PUBLIC.SWTBER27_USER148_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER148_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER148 Runtime'
  COMMENT = 'Openflow HoL runtime for user148, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER149  ->  SWTBER27_USER149.PUBLIC.SWTBER27_USER149_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER149_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER149.PUBLIC.SWTBER27_USER149_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER149_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER149 Runtime'
  COMMENT = 'Openflow HoL runtime for user149, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER150  ->  SWTBER27_USER150.PUBLIC.SWTBER27_USER150_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER150_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER150.PUBLIC.SWTBER27_USER150_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER150_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER150 Runtime'
  COMMENT = 'Openflow HoL runtime for user150, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER151  ->  SWTBER27_USER151.PUBLIC.SWTBER27_USER151_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER151_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER151.PUBLIC.SWTBER27_USER151_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER151_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER151 Runtime'
  COMMENT = 'Openflow HoL runtime for user151, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER152  ->  SWTBER27_USER152.PUBLIC.SWTBER27_USER152_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER152_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER152.PUBLIC.SWTBER27_USER152_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER152_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER152 Runtime'
  COMMENT = 'Openflow HoL runtime for user152, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER153  ->  SWTBER27_USER153.PUBLIC.SWTBER27_USER153_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER153_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER153.PUBLIC.SWTBER27_USER153_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER153_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER153 Runtime'
  COMMENT = 'Openflow HoL runtime for user153, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER154  ->  SWTBER27_USER154.PUBLIC.SWTBER27_USER154_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER154_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER154.PUBLIC.SWTBER27_USER154_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER154_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER154 Runtime'
  COMMENT = 'Openflow HoL runtime for user154, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER155  ->  SWTBER27_USER155.PUBLIC.SWTBER27_USER155_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER155_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER155.PUBLIC.SWTBER27_USER155_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER155_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER155 Runtime'
  COMMENT = 'Openflow HoL runtime for user155, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER156  ->  SWTBER27_USER156.PUBLIC.SWTBER27_USER156_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER156_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER156.PUBLIC.SWTBER27_USER156_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER156_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER156 Runtime'
  COMMENT = 'Openflow HoL runtime for user156, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER157  ->  SWTBER27_USER157.PUBLIC.SWTBER27_USER157_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER157_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER157.PUBLIC.SWTBER27_USER157_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER157_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER157 Runtime'
  COMMENT = 'Openflow HoL runtime for user157, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER158  ->  SWTBER27_USER158.PUBLIC.SWTBER27_USER158_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER158_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER158.PUBLIC.SWTBER27_USER158_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER158_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER158 Runtime'
  COMMENT = 'Openflow HoL runtime for user158, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER159  ->  SWTBER27_USER159.PUBLIC.SWTBER27_USER159_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER159_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER159.PUBLIC.SWTBER27_USER159_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER159_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER159 Runtime'
  COMMENT = 'Openflow HoL runtime for user159, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER160  ->  SWTBER27_USER160.PUBLIC.SWTBER27_USER160_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER160_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER160.PUBLIC.SWTBER27_USER160_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER160_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER160 Runtime'
  COMMENT = 'Openflow HoL runtime for user160, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER161  ->  SWTBER27_USER161.PUBLIC.SWTBER27_USER161_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER161_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER161.PUBLIC.SWTBER27_USER161_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER161_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER161 Runtime'
  COMMENT = 'Openflow HoL runtime for user161, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER162  ->  SWTBER27_USER162.PUBLIC.SWTBER27_USER162_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER162_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER162.PUBLIC.SWTBER27_USER162_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER162_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER162 Runtime'
  COMMENT = 'Openflow HoL runtime for user162, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER163  ->  SWTBER27_USER163.PUBLIC.SWTBER27_USER163_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER163_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER163.PUBLIC.SWTBER27_USER163_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER163_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER163 Runtime'
  COMMENT = 'Openflow HoL runtime for user163, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER164  ->  SWTBER27_USER164.PUBLIC.SWTBER27_USER164_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER164_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER164.PUBLIC.SWTBER27_USER164_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER164_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER164 Runtime'
  COMMENT = 'Openflow HoL runtime for user164, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER165  ->  SWTBER27_USER165.PUBLIC.SWTBER27_USER165_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER165_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER165.PUBLIC.SWTBER27_USER165_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER165_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER165 Runtime'
  COMMENT = 'Openflow HoL runtime for user165, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER166  ->  SWTBER27_USER166.PUBLIC.SWTBER27_USER166_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER166_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER166.PUBLIC.SWTBER27_USER166_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER166_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER166 Runtime'
  COMMENT = 'Openflow HoL runtime for user166, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER167  ->  SWTBER27_USER167.PUBLIC.SWTBER27_USER167_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER167_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER167.PUBLIC.SWTBER27_USER167_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER167_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER167 Runtime'
  COMMENT = 'Openflow HoL runtime for user167, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER168  ->  SWTBER27_USER168.PUBLIC.SWTBER27_USER168_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER168_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER168.PUBLIC.SWTBER27_USER168_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER168_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER168 Runtime'
  COMMENT = 'Openflow HoL runtime for user168, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER169  ->  SWTBER27_USER169.PUBLIC.SWTBER27_USER169_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER169_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER169.PUBLIC.SWTBER27_USER169_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER169_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER169 Runtime'
  COMMENT = 'Openflow HoL runtime for user169, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER170  ->  SWTBER27_USER170.PUBLIC.SWTBER27_USER170_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER170_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER170.PUBLIC.SWTBER27_USER170_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER170_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER170 Runtime'
  COMMENT = 'Openflow HoL runtime for user170, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER171  ->  SWTBER27_USER171.PUBLIC.SWTBER27_USER171_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER171_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER171.PUBLIC.SWTBER27_USER171_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER171_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER171 Runtime'
  COMMENT = 'Openflow HoL runtime for user171, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER172  ->  SWTBER27_USER172.PUBLIC.SWTBER27_USER172_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER172_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER172.PUBLIC.SWTBER27_USER172_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER172_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER172 Runtime'
  COMMENT = 'Openflow HoL runtime for user172, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER173  ->  SWTBER27_USER173.PUBLIC.SWTBER27_USER173_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER173_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER173.PUBLIC.SWTBER27_USER173_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER173_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER173 Runtime'
  COMMENT = 'Openflow HoL runtime for user173, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER174  ->  SWTBER27_USER174.PUBLIC.SWTBER27_USER174_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER174_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER174.PUBLIC.SWTBER27_USER174_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER174_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER174 Runtime'
  COMMENT = 'Openflow HoL runtime for user174, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER175  ->  SWTBER27_USER175.PUBLIC.SWTBER27_USER175_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER175_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER175.PUBLIC.SWTBER27_USER175_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER175_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER175 Runtime'
  COMMENT = 'Openflow HoL runtime for user175, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER176  ->  SWTBER27_USER176.PUBLIC.SWTBER27_USER176_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER176_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER176.PUBLIC.SWTBER27_USER176_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER176_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER176 Runtime'
  COMMENT = 'Openflow HoL runtime for user176, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER177  ->  SWTBER27_USER177.PUBLIC.SWTBER27_USER177_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER177_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER177.PUBLIC.SWTBER27_USER177_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER177_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER177 Runtime'
  COMMENT = 'Openflow HoL runtime for user177, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER178  ->  SWTBER27_USER178.PUBLIC.SWTBER27_USER178_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER178_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER178.PUBLIC.SWTBER27_USER178_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER178_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER178 Runtime'
  COMMENT = 'Openflow HoL runtime for user178, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER179  ->  SWTBER27_USER179.PUBLIC.SWTBER27_USER179_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER179_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER179.PUBLIC.SWTBER27_USER179_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER179_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER179 Runtime'
  COMMENT = 'Openflow HoL runtime for user179, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER180  ->  SWTBER27_USER180.PUBLIC.SWTBER27_USER180_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER180_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER180.PUBLIC.SWTBER27_USER180_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER180_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER180 Runtime'
  COMMENT = 'Openflow HoL runtime for user180, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER181  ->  SWTBER27_USER181.PUBLIC.SWTBER27_USER181_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER181_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER181.PUBLIC.SWTBER27_USER181_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER181_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER181 Runtime'
  COMMENT = 'Openflow HoL runtime for user181, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER182  ->  SWTBER27_USER182.PUBLIC.SWTBER27_USER182_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER182_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER182.PUBLIC.SWTBER27_USER182_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER182_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER182 Runtime'
  COMMENT = 'Openflow HoL runtime for user182, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER183  ->  SWTBER27_USER183.PUBLIC.SWTBER27_USER183_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER183_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER183.PUBLIC.SWTBER27_USER183_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER183_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER183 Runtime'
  COMMENT = 'Openflow HoL runtime for user183, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER184  ->  SWTBER27_USER184.PUBLIC.SWTBER27_USER184_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER184_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER184.PUBLIC.SWTBER27_USER184_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER184_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER184 Runtime'
  COMMENT = 'Openflow HoL runtime for user184, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER185  ->  SWTBER27_USER185.PUBLIC.SWTBER27_USER185_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER185_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER185.PUBLIC.SWTBER27_USER185_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER185_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER185 Runtime'
  COMMENT = 'Openflow HoL runtime for user185, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER186  ->  SWTBER27_USER186.PUBLIC.SWTBER27_USER186_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER186_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER186.PUBLIC.SWTBER27_USER186_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER186_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER186 Runtime'
  COMMENT = 'Openflow HoL runtime for user186, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER187  ->  SWTBER27_USER187.PUBLIC.SWTBER27_USER187_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER187_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER187.PUBLIC.SWTBER27_USER187_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER187_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER187 Runtime'
  COMMENT = 'Openflow HoL runtime for user187, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER188  ->  SWTBER27_USER188.PUBLIC.SWTBER27_USER188_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER188_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER188.PUBLIC.SWTBER27_USER188_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER188_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER188 Runtime'
  COMMENT = 'Openflow HoL runtime for user188, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER189  ->  SWTBER27_USER189.PUBLIC.SWTBER27_USER189_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER189_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER189.PUBLIC.SWTBER27_USER189_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER189_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER189 Runtime'
  COMMENT = 'Openflow HoL runtime for user189, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER190  ->  SWTBER27_USER190.PUBLIC.SWTBER27_USER190_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER190_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER190.PUBLIC.SWTBER27_USER190_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER190_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER190 Runtime'
  COMMENT = 'Openflow HoL runtime for user190, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER191  ->  SWTBER27_USER191.PUBLIC.SWTBER27_USER191_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER191_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER191.PUBLIC.SWTBER27_USER191_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER191_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER191 Runtime'
  COMMENT = 'Openflow HoL runtime for user191, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER192  ->  SWTBER27_USER192.PUBLIC.SWTBER27_USER192_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER192_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER192.PUBLIC.SWTBER27_USER192_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER192_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER192 Runtime'
  COMMENT = 'Openflow HoL runtime for user192, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER193  ->  SWTBER27_USER193.PUBLIC.SWTBER27_USER193_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER193_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER193.PUBLIC.SWTBER27_USER193_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER193_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER193 Runtime'
  COMMENT = 'Openflow HoL runtime for user193, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER194  ->  SWTBER27_USER194.PUBLIC.SWTBER27_USER194_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER194_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER194.PUBLIC.SWTBER27_USER194_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER194_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER194 Runtime'
  COMMENT = 'Openflow HoL runtime for user194, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER195  ->  SWTBER27_USER195.PUBLIC.SWTBER27_USER195_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER195_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER195.PUBLIC.SWTBER27_USER195_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER195_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER195 Runtime'
  COMMENT = 'Openflow HoL runtime for user195, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER196  ->  SWTBER27_USER196.PUBLIC.SWTBER27_USER196_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER196_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER196.PUBLIC.SWTBER27_USER196_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER196_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER196 Runtime'
  COMMENT = 'Openflow HoL runtime for user196, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER197  ->  SWTBER27_USER197.PUBLIC.SWTBER27_USER197_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER197_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER197.PUBLIC.SWTBER27_USER197_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER197_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER197 Runtime'
  COMMENT = 'Openflow HoL runtime for user197, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER198  ->  SWTBER27_USER198.PUBLIC.SWTBER27_USER198_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER198_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER198.PUBLIC.SWTBER27_USER198_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER198_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER198 Runtime'
  COMMENT = 'Openflow HoL runtime for user198, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER199  ->  SWTBER27_USER199.PUBLIC.SWTBER27_USER199_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER199_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER199.PUBLIC.SWTBER27_USER199_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER199_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER199 Runtime'
  COMMENT = 'Openflow HoL runtime for user199, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- USER200  ->  SWTBER27_USER200.PUBLIC.SWTBER27_USER200_RUNTIME
-- ----------------------------------------------------------------------------
USE ROLE SWTBER27_USER200_RL;

CREATE OPENFLOW RUNTIME IF NOT EXISTS SWTBER27_USER200.PUBLIC.SWTBER27_USER200_RUNTIME
  IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER200_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'USER200 Runtime'
  COMMENT = 'Openflow HoL runtime for user200, owned by the attendee. [openflow]';

USE ROLE ACCOUNTADMIN;

-- ----------------------------------------------------------------------------
-- Wait for all runtimes to become ACTIVE (3-5 minutes each, in parallel).
-- Split this across batches if you provisioned many at once.
-- ----------------------------------------------------------------------------
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER01.PUBLIC.SWTBER27_USER01_RUNTIME') AS user01_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER02.PUBLIC.SWTBER27_USER02_RUNTIME') AS user02_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER03.PUBLIC.SWTBER27_USER03_RUNTIME') AS user03_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER04.PUBLIC.SWTBER27_USER04_RUNTIME') AS user04_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER05.PUBLIC.SWTBER27_USER05_RUNTIME') AS user05_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER06.PUBLIC.SWTBER27_USER06_RUNTIME') AS user06_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER07.PUBLIC.SWTBER27_USER07_RUNTIME') AS user07_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER08.PUBLIC.SWTBER27_USER08_RUNTIME') AS user08_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER09.PUBLIC.SWTBER27_USER09_RUNTIME') AS user09_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER10.PUBLIC.SWTBER27_USER10_RUNTIME') AS user10_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER11.PUBLIC.SWTBER27_USER11_RUNTIME') AS user11_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER12.PUBLIC.SWTBER27_USER12_RUNTIME') AS user12_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER13.PUBLIC.SWTBER27_USER13_RUNTIME') AS user13_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER14.PUBLIC.SWTBER27_USER14_RUNTIME') AS user14_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER15.PUBLIC.SWTBER27_USER15_RUNTIME') AS user15_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER16.PUBLIC.SWTBER27_USER16_RUNTIME') AS user16_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER17.PUBLIC.SWTBER27_USER17_RUNTIME') AS user17_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER18.PUBLIC.SWTBER27_USER18_RUNTIME') AS user18_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER19.PUBLIC.SWTBER27_USER19_RUNTIME') AS user19_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER20.PUBLIC.SWTBER27_USER20_RUNTIME') AS user20_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER21.PUBLIC.SWTBER27_USER21_RUNTIME') AS user21_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER22.PUBLIC.SWTBER27_USER22_RUNTIME') AS user22_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER23.PUBLIC.SWTBER27_USER23_RUNTIME') AS user23_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER24.PUBLIC.SWTBER27_USER24_RUNTIME') AS user24_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER25.PUBLIC.SWTBER27_USER25_RUNTIME') AS user25_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER26.PUBLIC.SWTBER27_USER26_RUNTIME') AS user26_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER27.PUBLIC.SWTBER27_USER27_RUNTIME') AS user27_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER28.PUBLIC.SWTBER27_USER28_RUNTIME') AS user28_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER29.PUBLIC.SWTBER27_USER29_RUNTIME') AS user29_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER30.PUBLIC.SWTBER27_USER30_RUNTIME') AS user30_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER31.PUBLIC.SWTBER27_USER31_RUNTIME') AS user31_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER32.PUBLIC.SWTBER27_USER32_RUNTIME') AS user32_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER33.PUBLIC.SWTBER27_USER33_RUNTIME') AS user33_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER34.PUBLIC.SWTBER27_USER34_RUNTIME') AS user34_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER35.PUBLIC.SWTBER27_USER35_RUNTIME') AS user35_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER36.PUBLIC.SWTBER27_USER36_RUNTIME') AS user36_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER37.PUBLIC.SWTBER27_USER37_RUNTIME') AS user37_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER38.PUBLIC.SWTBER27_USER38_RUNTIME') AS user38_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER39.PUBLIC.SWTBER27_USER39_RUNTIME') AS user39_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER40.PUBLIC.SWTBER27_USER40_RUNTIME') AS user40_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER41.PUBLIC.SWTBER27_USER41_RUNTIME') AS user41_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER42.PUBLIC.SWTBER27_USER42_RUNTIME') AS user42_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER43.PUBLIC.SWTBER27_USER43_RUNTIME') AS user43_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER44.PUBLIC.SWTBER27_USER44_RUNTIME') AS user44_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER45.PUBLIC.SWTBER27_USER45_RUNTIME') AS user45_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER46.PUBLIC.SWTBER27_USER46_RUNTIME') AS user46_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER47.PUBLIC.SWTBER27_USER47_RUNTIME') AS user47_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER48.PUBLIC.SWTBER27_USER48_RUNTIME') AS user48_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER49.PUBLIC.SWTBER27_USER49_RUNTIME') AS user49_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER50.PUBLIC.SWTBER27_USER50_RUNTIME') AS user50_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER51.PUBLIC.SWTBER27_USER51_RUNTIME') AS user51_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER52.PUBLIC.SWTBER27_USER52_RUNTIME') AS user52_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER53.PUBLIC.SWTBER27_USER53_RUNTIME') AS user53_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER54.PUBLIC.SWTBER27_USER54_RUNTIME') AS user54_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER55.PUBLIC.SWTBER27_USER55_RUNTIME') AS user55_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER56.PUBLIC.SWTBER27_USER56_RUNTIME') AS user56_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER57.PUBLIC.SWTBER27_USER57_RUNTIME') AS user57_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER58.PUBLIC.SWTBER27_USER58_RUNTIME') AS user58_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER59.PUBLIC.SWTBER27_USER59_RUNTIME') AS user59_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER60.PUBLIC.SWTBER27_USER60_RUNTIME') AS user60_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER61.PUBLIC.SWTBER27_USER61_RUNTIME') AS user61_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER62.PUBLIC.SWTBER27_USER62_RUNTIME') AS user62_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER63.PUBLIC.SWTBER27_USER63_RUNTIME') AS user63_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER64.PUBLIC.SWTBER27_USER64_RUNTIME') AS user64_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER65.PUBLIC.SWTBER27_USER65_RUNTIME') AS user65_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER66.PUBLIC.SWTBER27_USER66_RUNTIME') AS user66_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER67.PUBLIC.SWTBER27_USER67_RUNTIME') AS user67_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER68.PUBLIC.SWTBER27_USER68_RUNTIME') AS user68_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER69.PUBLIC.SWTBER27_USER69_RUNTIME') AS user69_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER70.PUBLIC.SWTBER27_USER70_RUNTIME') AS user70_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER71.PUBLIC.SWTBER27_USER71_RUNTIME') AS user71_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER72.PUBLIC.SWTBER27_USER72_RUNTIME') AS user72_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER73.PUBLIC.SWTBER27_USER73_RUNTIME') AS user73_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER74.PUBLIC.SWTBER27_USER74_RUNTIME') AS user74_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER75.PUBLIC.SWTBER27_USER75_RUNTIME') AS user75_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER76.PUBLIC.SWTBER27_USER76_RUNTIME') AS user76_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER77.PUBLIC.SWTBER27_USER77_RUNTIME') AS user77_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER78.PUBLIC.SWTBER27_USER78_RUNTIME') AS user78_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER79.PUBLIC.SWTBER27_USER79_RUNTIME') AS user79_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER80.PUBLIC.SWTBER27_USER80_RUNTIME') AS user80_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER81.PUBLIC.SWTBER27_USER81_RUNTIME') AS user81_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER82.PUBLIC.SWTBER27_USER82_RUNTIME') AS user82_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER83.PUBLIC.SWTBER27_USER83_RUNTIME') AS user83_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER84.PUBLIC.SWTBER27_USER84_RUNTIME') AS user84_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER85.PUBLIC.SWTBER27_USER85_RUNTIME') AS user85_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER86.PUBLIC.SWTBER27_USER86_RUNTIME') AS user86_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER87.PUBLIC.SWTBER27_USER87_RUNTIME') AS user87_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER88.PUBLIC.SWTBER27_USER88_RUNTIME') AS user88_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER89.PUBLIC.SWTBER27_USER89_RUNTIME') AS user89_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER90.PUBLIC.SWTBER27_USER90_RUNTIME') AS user90_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER91.PUBLIC.SWTBER27_USER91_RUNTIME') AS user91_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER92.PUBLIC.SWTBER27_USER92_RUNTIME') AS user92_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER93.PUBLIC.SWTBER27_USER93_RUNTIME') AS user93_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER94.PUBLIC.SWTBER27_USER94_RUNTIME') AS user94_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER95.PUBLIC.SWTBER27_USER95_RUNTIME') AS user95_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER96.PUBLIC.SWTBER27_USER96_RUNTIME') AS user96_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER97.PUBLIC.SWTBER27_USER97_RUNTIME') AS user97_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER98.PUBLIC.SWTBER27_USER98_RUNTIME') AS user98_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER99.PUBLIC.SWTBER27_USER99_RUNTIME') AS user99_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER100.PUBLIC.SWTBER27_USER100_RUNTIME') AS user100_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER101.PUBLIC.SWTBER27_USER101_RUNTIME') AS user101_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER102.PUBLIC.SWTBER27_USER102_RUNTIME') AS user102_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER103.PUBLIC.SWTBER27_USER103_RUNTIME') AS user103_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER104.PUBLIC.SWTBER27_USER104_RUNTIME') AS user104_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER105.PUBLIC.SWTBER27_USER105_RUNTIME') AS user105_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER106.PUBLIC.SWTBER27_USER106_RUNTIME') AS user106_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER107.PUBLIC.SWTBER27_USER107_RUNTIME') AS user107_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER108.PUBLIC.SWTBER27_USER108_RUNTIME') AS user108_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER109.PUBLIC.SWTBER27_USER109_RUNTIME') AS user109_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER110.PUBLIC.SWTBER27_USER110_RUNTIME') AS user110_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER111.PUBLIC.SWTBER27_USER111_RUNTIME') AS user111_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER112.PUBLIC.SWTBER27_USER112_RUNTIME') AS user112_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER113.PUBLIC.SWTBER27_USER113_RUNTIME') AS user113_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER114.PUBLIC.SWTBER27_USER114_RUNTIME') AS user114_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER115.PUBLIC.SWTBER27_USER115_RUNTIME') AS user115_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER116.PUBLIC.SWTBER27_USER116_RUNTIME') AS user116_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER117.PUBLIC.SWTBER27_USER117_RUNTIME') AS user117_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER118.PUBLIC.SWTBER27_USER118_RUNTIME') AS user118_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER119.PUBLIC.SWTBER27_USER119_RUNTIME') AS user119_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER120.PUBLIC.SWTBER27_USER120_RUNTIME') AS user120_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER121.PUBLIC.SWTBER27_USER121_RUNTIME') AS user121_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER122.PUBLIC.SWTBER27_USER122_RUNTIME') AS user122_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER123.PUBLIC.SWTBER27_USER123_RUNTIME') AS user123_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER124.PUBLIC.SWTBER27_USER124_RUNTIME') AS user124_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER125.PUBLIC.SWTBER27_USER125_RUNTIME') AS user125_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER126.PUBLIC.SWTBER27_USER126_RUNTIME') AS user126_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER127.PUBLIC.SWTBER27_USER127_RUNTIME') AS user127_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER128.PUBLIC.SWTBER27_USER128_RUNTIME') AS user128_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER129.PUBLIC.SWTBER27_USER129_RUNTIME') AS user129_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER130.PUBLIC.SWTBER27_USER130_RUNTIME') AS user130_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER131.PUBLIC.SWTBER27_USER131_RUNTIME') AS user131_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER132.PUBLIC.SWTBER27_USER132_RUNTIME') AS user132_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER133.PUBLIC.SWTBER27_USER133_RUNTIME') AS user133_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER134.PUBLIC.SWTBER27_USER134_RUNTIME') AS user134_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER135.PUBLIC.SWTBER27_USER135_RUNTIME') AS user135_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER136.PUBLIC.SWTBER27_USER136_RUNTIME') AS user136_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER137.PUBLIC.SWTBER27_USER137_RUNTIME') AS user137_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER138.PUBLIC.SWTBER27_USER138_RUNTIME') AS user138_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER139.PUBLIC.SWTBER27_USER139_RUNTIME') AS user139_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER140.PUBLIC.SWTBER27_USER140_RUNTIME') AS user140_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER141.PUBLIC.SWTBER27_USER141_RUNTIME') AS user141_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER142.PUBLIC.SWTBER27_USER142_RUNTIME') AS user142_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER143.PUBLIC.SWTBER27_USER143_RUNTIME') AS user143_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER144.PUBLIC.SWTBER27_USER144_RUNTIME') AS user144_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER145.PUBLIC.SWTBER27_USER145_RUNTIME') AS user145_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER146.PUBLIC.SWTBER27_USER146_RUNTIME') AS user146_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER147.PUBLIC.SWTBER27_USER147_RUNTIME') AS user147_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER148.PUBLIC.SWTBER27_USER148_RUNTIME') AS user148_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER149.PUBLIC.SWTBER27_USER149_RUNTIME') AS user149_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER150.PUBLIC.SWTBER27_USER150_RUNTIME') AS user150_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER151.PUBLIC.SWTBER27_USER151_RUNTIME') AS user151_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER152.PUBLIC.SWTBER27_USER152_RUNTIME') AS user152_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER153.PUBLIC.SWTBER27_USER153_RUNTIME') AS user153_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER154.PUBLIC.SWTBER27_USER154_RUNTIME') AS user154_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER155.PUBLIC.SWTBER27_USER155_RUNTIME') AS user155_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER156.PUBLIC.SWTBER27_USER156_RUNTIME') AS user156_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER157.PUBLIC.SWTBER27_USER157_RUNTIME') AS user157_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER158.PUBLIC.SWTBER27_USER158_RUNTIME') AS user158_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER159.PUBLIC.SWTBER27_USER159_RUNTIME') AS user159_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER160.PUBLIC.SWTBER27_USER160_RUNTIME') AS user160_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER161.PUBLIC.SWTBER27_USER161_RUNTIME') AS user161_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER162.PUBLIC.SWTBER27_USER162_RUNTIME') AS user162_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER163.PUBLIC.SWTBER27_USER163_RUNTIME') AS user163_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER164.PUBLIC.SWTBER27_USER164_RUNTIME') AS user164_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER165.PUBLIC.SWTBER27_USER165_RUNTIME') AS user165_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER166.PUBLIC.SWTBER27_USER166_RUNTIME') AS user166_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER167.PUBLIC.SWTBER27_USER167_RUNTIME') AS user167_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER168.PUBLIC.SWTBER27_USER168_RUNTIME') AS user168_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER169.PUBLIC.SWTBER27_USER169_RUNTIME') AS user169_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER170.PUBLIC.SWTBER27_USER170_RUNTIME') AS user170_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER171.PUBLIC.SWTBER27_USER171_RUNTIME') AS user171_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER172.PUBLIC.SWTBER27_USER172_RUNTIME') AS user172_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER173.PUBLIC.SWTBER27_USER173_RUNTIME') AS user173_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER174.PUBLIC.SWTBER27_USER174_RUNTIME') AS user174_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER175.PUBLIC.SWTBER27_USER175_RUNTIME') AS user175_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER176.PUBLIC.SWTBER27_USER176_RUNTIME') AS user176_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER177.PUBLIC.SWTBER27_USER177_RUNTIME') AS user177_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER178.PUBLIC.SWTBER27_USER178_RUNTIME') AS user178_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER179.PUBLIC.SWTBER27_USER179_RUNTIME') AS user179_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER180.PUBLIC.SWTBER27_USER180_RUNTIME') AS user180_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER181.PUBLIC.SWTBER27_USER181_RUNTIME') AS user181_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER182.PUBLIC.SWTBER27_USER182_RUNTIME') AS user182_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER183.PUBLIC.SWTBER27_USER183_RUNTIME') AS user183_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER184.PUBLIC.SWTBER27_USER184_RUNTIME') AS user184_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER185.PUBLIC.SWTBER27_USER185_RUNTIME') AS user185_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER186.PUBLIC.SWTBER27_USER186_RUNTIME') AS user186_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER187.PUBLIC.SWTBER27_USER187_RUNTIME') AS user187_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER188.PUBLIC.SWTBER27_USER188_RUNTIME') AS user188_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER189.PUBLIC.SWTBER27_USER189_RUNTIME') AS user189_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER190.PUBLIC.SWTBER27_USER190_RUNTIME') AS user190_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER191.PUBLIC.SWTBER27_USER191_RUNTIME') AS user191_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER192.PUBLIC.SWTBER27_USER192_RUNTIME') AS user192_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER193.PUBLIC.SWTBER27_USER193_RUNTIME') AS user193_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER194.PUBLIC.SWTBER27_USER194_RUNTIME') AS user194_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER195.PUBLIC.SWTBER27_USER195_RUNTIME') AS user195_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER196.PUBLIC.SWTBER27_USER196_RUNTIME') AS user196_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER197.PUBLIC.SWTBER27_USER197_RUNTIME') AS user197_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER198.PUBLIC.SWTBER27_USER198_RUNTIME') AS user198_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER199.PUBLIC.SWTBER27_USER199_RUNTIME') AS user199_status;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(900, 'ACTIVE', 'SWTBER27_USER200.PUBLIC.SWTBER27_USER200_RUNTIME') AS user200_status;

-- ----------------------------------------------------------------------------
-- Verification
-- ----------------------------------------------------------------------------
SHOW OPENFLOW RUNTIMES IN ACCOUNT;