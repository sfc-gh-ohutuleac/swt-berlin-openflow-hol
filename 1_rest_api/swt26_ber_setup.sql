--------------------------------------------------------------------------------
-- TECHUP27: Openflow "Zero to Hero" - Easy Lab Setup Script
-- 
-- Lab: Ingest Users + Shopping Carts from DummyJSON API into Snowflake
--       using PutSnowpipeStreaming (Snowpipe Streaming)
--
-- Source APIs (both free, no authentication):
--   - https://dummyjson.com/users         (30 fake users with addresses)
--   - https://dummyjson.com/carts/user/{id} (shopping cart per user)
--
-- Prerequisites:
--   - Openflow quickstart completed (deployment + runtime running)
--   - ACCOUNTADMIN access
--   - Runtime role: QUICKSTART_OPENFLOW_ROLE (adjust if different)
--
-- What this script creates:
--   1. Database TECHUP27 with schema PUBLIC
--   2. Target table for ingestion (USER_SPENDING)
--   3. Network Rule for dummyjson.com
--   4. External Access Integration
--   5. All required grants to the Openflow runtime role
--   6. Attaches EAI to the runtime (SOM) or instructions for UI (pre-SOM)
--
-- Run this script as ACCOUNTADMIN before the lab session.
--------------------------------------------------------------------------------

-- ============================================================================
-- VARIABLES (adjust these to match your environment)
-- ============================================================================
SET openflow_role = 'QUICKSTART_OPENFLOW_ROLE';
SET openflow_db = 'OPENFLOW';           -- Database where your runtime lives
SET openflow_schema = 'OPENFLOW';       -- Schema where your runtime lives
SET openflow_runtime = 'QUICKSTARTRUNTIME';  -- Your runtime name

-- ============================================================================
-- 1. DATABASE & SCHEMA
-- ============================================================================
USE ROLE ACCOUNTADMIN;

CREATE DATABASE IF NOT EXISTS TECHUP27
  COMMENT = 'Openflow Zero-to-Hero Hands-on Lab - TechUp #27';

USE DATABASE TECHUP27;
USE SCHEMA PUBLIC;

-- ============================================================================
-- 2. TARGET TABLES
-- ============================================================================
-- Enriched table joining user info with their cart spending data
-- NOTE: No DEFAULT clauses — Snowpipe Streaming does not support them.
-- INGESTED_AT is VARCHAR because Snowpipe Streaming's TIMESTAMP parser is strict
-- about formats. The flow sets this as a formatted string via UpdateAttribute.
CREATE OR REPLACE TABLE TECHUP27.PUBLIC.USER_SPENDING (
    USER_ID             NUMBER,
    FIRST_NAME          VARCHAR,
    LAST_NAME           VARCHAR,
    EMAIL               VARCHAR,
    CITY                VARCHAR,
    COUNTRY             VARCHAR,
    CART_TOTAL          FLOAT,
    CART_DISCOUNTED     FLOAT,
    TOTAL_PRODUCTS      NUMBER,
    TOTAL_QUANTITY      NUMBER,
    INGESTED_AT         VARCHAR
);

-- Same schema but as a Snowflake-managed Iceberg table
-- Demonstrates: same data, open table format (Parquet + Iceberg metadata)
-- No external volume needed — SNOWFLAKE_MANAGED handles storage internally.
CREATE OR REPLACE ICEBERG TABLE TECHUP27.PUBLIC.USER_SPENDING_ICEBERG (
    USER_ID             INT,
    FIRST_NAME          VARCHAR,
    LAST_NAME           VARCHAR,
    EMAIL               VARCHAR,
    CITY                VARCHAR,
    COUNTRY             VARCHAR,
    CART_TOTAL          FLOAT,
    CART_DISCOUNTED     FLOAT,
    TOTAL_PRODUCTS      INT,
    TOTAL_QUANTITY      INT,
    INGESTED_AT         VARCHAR
)
CATALOG = 'SNOWFLAKE'
EXTERNAL_VOLUME = 'SNOWFLAKE_MANAGED';

-- ============================================================================
-- 3. NETWORK RULE
-- ============================================================================
-- Single host - both APIs (users and carts) are on dummyjson.com
CREATE OR REPLACE NETWORK RULE TECHUP27.PUBLIC.TECHUP27_LAB_NETWORK_RULE
  TYPE = HOST_PORT
  MODE = EGRESS
  VALUE_LIST = ('dummyjson.com:443')
  COMMENT = 'Openflow TechUp27 lab - DummyJSON API (users + carts)';

-- Verify
DESCRIBE NETWORK RULE TECHUP27.PUBLIC.TECHUP27_LAB_NETWORK_RULE;

-- ============================================================================
-- 4. EXTERNAL ACCESS INTEGRATION
-- ============================================================================
CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION TECHUP27_LAB_EAI
  ALLOWED_NETWORK_RULES = (TECHUP27.PUBLIC.TECHUP27_LAB_NETWORK_RULE)
  ENABLED = TRUE
  COMMENT = 'EAI for Openflow TechUp27 lab (DummyJSON API)';

-- Verify
DESCRIBE INTEGRATION TECHUP27_LAB_EAI;

-- ============================================================================
-- 5. GRANTS TO OPENFLOW RUNTIME ROLE
-- ============================================================================
-- Grant access to the lab database and tables
GRANT USAGE ON DATABASE TECHUP27 TO ROLE IDENTIFIER($openflow_role);
GRANT USAGE ON SCHEMA TECHUP27.PUBLIC TO ROLE IDENTIFIER($openflow_role);
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA TECHUP27.PUBLIC TO ROLE IDENTIFIER($openflow_role);
GRANT ALL PRIVILEGES ON ALL ICEBERG TABLES IN SCHEMA TECHUP27.PUBLIC TO ROLE IDENTIFIER($openflow_role);
GRANT CREATE TABLE ON SCHEMA TECHUP27.PUBLIC TO ROLE IDENTIFIER($openflow_role);

-- Grant future tables too (in case attendees create additional tables)
GRANT ALL PRIVILEGES ON FUTURE TABLES IN SCHEMA TECHUP27.PUBLIC TO ROLE IDENTIFIER($openflow_role);

-- Grant EAI usage to the runtime role
GRANT USAGE ON INTEGRATION TECHUP27_LAB_EAI TO ROLE IDENTIFIER($openflow_role);

-- ============================================================================
-- 6. ATTACH EAI TO RUNTIME
-- ============================================================================
-- There are TWO ways to attach an EAI to a runtime. Which one you use depends
-- on whether your account supports the Snowflake Object Model (SOM) for Openflow.
--
-- HOW TO TELL:
--   Run: SHOW OPENFLOW DEPLOYMENTS;
--   - If it works       -> SOM account -> use OPTION A (SQL)
--   - If syntax error   -> Pre-SOM account -> use OPTION B (UI)
--
-- OPTION A: SQL (SOM accounts only)
--   Pros: scriptable, repeatable, works in CI/CD
--   Note: This REPLACES all EAIs on the runtime. If your runtime already has
--   other EAIs attached, include them all in the list.
--
--   To check existing EAIs before running:
--     DESCRIBE OPENFLOW RUNTIME <db>.<schema>.<runtime>;
--
--   If you have existing EAIs, include them:
--     SET EXTERNAL_ACCESS_INTEGRATIONS = (EXISTING_EAI_1, TECHUP27_LAB_EAI);

-- >>> Uncomment the line below ONLY if your account supports SOM <<<
-- ALTER OPENFLOW RUNTIME IDENTIFIER($openflow_db || '.' || $openflow_schema || '.' || $openflow_runtime)
--   SET EXTERNAL_ACCESS_INTEGRATIONS = (TECHUP27_LAB_EAI);

--
-- OPTION B: Openflow UI in Snowsight (works on ALL accounts, including pre-SOM)
--   1. Navigate to Data Engineering > Openflow in Snowsight
--   2. Click on your runtime
--   3. Click the "..." menu > "External access integrations"
--   4. Select TECHUP27_LAB_EAI from the dropdown
--   5. Click Save
--   Pros: visual, additive (won't overwrite existing EAIs), no restart needed
--   This is the ONLY option for pre-SOM accounts.
--

-- ============================================================================
-- 7. VERIFICATION
-- ============================================================================
-- Confirm grants
SHOW GRANTS TO ROLE IDENTIFIER($openflow_role);

-- Confirm tables exist
SHOW TABLES IN SCHEMA TECHUP27.PUBLIC;

-- Confirm EAI is active
SHOW EXTERNAL ACCESS INTEGRATIONS LIKE 'TECHUP27%';

-- ============================================================================
-- DONE! Your environment is ready for the lab.
-- 
-- Next steps:
--   1. Open the NiFi canvas for your runtime
--   2. Create a new Process Group called "User Spending Enrichment"
--   3. Follow the lab guide to build the ingestion flow
--
-- Flow summary (10 processors, dual-write to regular + Iceberg):
--   GenerateFlowFile (trigger, 1 hour schedule — run manually for lab)
--     -> InvokeHTTP (GET https://dummyjson.com/users?limit=30)
--     -> SplitJson ($.users[*])
--     -> EvaluateJsonPath (extract user_id, firstName, lastName, email, city, country)
--     -> InvokeHTTP (GET https://dummyjson.com/carts/user/${user_id})
--     -> EvaluateJsonPath (extract cart_total, cart_discounted, total_products, total_quantity)
--     -> UpdateAttribute (set ingested_at = current timestamp)
--     -> AttributesToJSON (convert all attributes to flat JSON content)
--         |
--         +-> PutSnowpipeStreaming2 (Pipe: USER_SPENDING-STREAMING)         -> regular table
--         +-> PutSnowpipeStreaming2 (Pipe: USER_SPENDING_ICEBERG-STREAMING) -> Iceberg table
--
--   Note: Both destinations use the SAME processor type (PutSnowpipeStreaming2).
--   The ONLY difference is the Pipe name. Switching from regular to Iceberg is
--   a one-property change.
-- ============================================================================
