--------------------------------------------------------------------------------
-- SWT Berlin 26 - Openflow HoL (UC1: REST API)
-- Reference DDL for the destination tables
--
-- Lab: Ingest Users + Shopping Carts from the DummyJSON API into Snowflake
--      using PublishSnowpipeStreaming (Snowpipe Streaming)
--
-- Source APIs (both free, no authentication):
--   - https://dummyjson.com/users            (30 fake users with addresses)
--   - https://dummyjson.com/carts/user/{id}  (shopping cart per user)
--
-- Everything else (database, role, runtime, network rule, EAI, grants) has
-- already been provisioned for you. This script only creates the destination
-- tables your flow writes into.
--
-- Replace <N> with your own attendee number everywhere below.
--------------------------------------------------------------------------------

USE ROLE SWTBER26_USER<N>_RL;
USE DATABASE SWTBER26_USER<N>;
USE SCHEMA PUBLIC;

-- ============================================================================
-- 1. STANDARD TABLE
-- ============================================================================
-- Enriched table joining user info with their cart spending data.
--
-- NOTE: No DEFAULT clauses - Snowpipe Streaming does not support them.
-- INGESTED_AT is VARCHAR because Snowpipe Streaming's TIMESTAMP parser is
-- strict about formats. The flow sets this as a formatted string via
-- UpdateAttribute.
CREATE OR REPLACE TABLE USER_SPENDING (
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

-- ============================================================================
-- 2. ICEBERG TABLE (optional - for the bonus step)
-- ============================================================================
-- Same schema, but as a Snowflake-managed Iceberg table.
-- Demonstrates: same data, open table format (Parquet + Iceberg metadata).
-- No external volume setup needed - SNOWFLAKE_MANAGED handles storage
-- internally.
--
-- NOTE: Iceberg requires INT (not NUMBER without explicit precision).
-- FLOAT columns show IEEE 754 precision artifacts in Iceberg
-- (e.g. 13037.879882812 instead of 13037.88). Use DECIMAL(10,2) if you need
-- exact monetary values.
CREATE OR REPLACE ICEBERG TABLE USER_SPENDING_ICEBERG (
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
-- 3. VERIFICATION
-- ============================================================================
SHOW TABLES IN SCHEMA SWTBER26_USER<N>.PUBLIC;
SHOW ICEBERG TABLES IN SCHEMA SWTBER26_USER<N>.PUBLIC;

--------------------------------------------------------------------------------
-- Done. Your tables are ready.
--
-- The Snowpipe Streaming pipes (USER_SPENDING-STREAMING and
-- USER_SPENDING_ICEBERG-STREAMING) are auto-created by Snowflake on first use
-- by the PublishSnowpipeStreaming processor - you do NOT create them yourself.
-- The tables just have to exist first.
--
-- Next: head back to the runbook and build the flow (Step 3.2).
--------------------------------------------------------------------------------
