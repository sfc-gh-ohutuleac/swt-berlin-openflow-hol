# SWT27 Berlin Openflow HoL - UC2 Draft: Kafka Stream Ingestion

**Status: DRAFT / illustrative only.** This walks through the *path* an
attendee would follow to wire up a Kafka source in Openflow via the UI,
using Snowflake's official Openflow Connector for Kafka. It is **not**
validated end-to-end yet - the Redpanda cluster + broker connection details
referenced in the World Tour planning notes have not been provisioned. Fill
in the placeholders marked `<...>` once Ovi's Redpanda cluster is ready, then
this becomes the real runbook (mirrors the repo's `3_kafka/` folder, which is
currently just a stub README).

Unlike UC1 (REST API, no auth, single public host), Kafka needs:
- A reachable broker endpoint + credentials (not yet available)
- A network rule/EAI covering that broker (not yet created - see
  `admin_setup.sql` UC3 placeholder section)
- A pre-existing destination table (the Kafka connector, unlike UC1's manual
  flow, explicitly requires this before install)

## Prerequisites (admin-side, not yet done)
1. Get from Ovi: Redpanda broker bootstrap address (`host:port`), security
   protocol (likely `SASL_SSL`), SASL mechanism, and credentials.
2. Create the network rule + add it to the shared EAI (see `admin_setup.sql`,
   UC3 stub):
   ```sql
   USE ROLE OPENFLOW_ADMIN;
   CREATE NETWORK RULE OPENFLOW_SHARED.INFRA.SWTBER27_UC3_NETWORK_RULE
     MODE = EGRESS TYPE = HOST_PORT VALUE_LIST = ('<redpanda-broker-host>:<port>')
     COMMENT = 'Egress for UC3 Kafka/Redpanda demo. [openflow]';
   ALTER EXTERNAL ACCESS INTEGRATION SWTBER27_LAB_EAI SET ALLOWED_NETWORK_RULES = (
     OPENFLOW_SHARED.INFRA.SWTBER27_LAB_NETWORK_RULE,   -- existing UC1 rule
     OPENFLOW_SHARED.INFRA.SWTBER27_UC3_NETWORK_RULE);  -- new UC3 rule
   ```
   This is additive to the shared EAI every attendee already has `USAGE` on
   via `SWTBER27_ATTENDEE_RL` - no per-attendee grant change needed.
3. Decide whether attendees get one shared Kafka topic each (isolated by
   consumer group ID) or a dedicated topic per attendee. Simplest for a lab:
   one shared topic, each attendee uses their own `TECHUP27_USER<N>`-style
   consumer group ID so nobody's offset collides. *(Naming will follow the
   new SWTBER27 convention once finalized.)*

## Attendee path (UI, self-service - once the above is done)

### Step 1 - Create the destination table
The Kafka connector requires the destination table to already exist (unlike
the schema-evolution-friendly default, you still need the table itself
present first). In your own database:
```sql
CREATE TABLE SWTBER27_USER<N>.PUBLIC.KAFKA_EVENTS (
  kafkaMetadata VARIANT
)
ENABLE_SCHEMA_EVOLUTION = TRUE
ERROR_LOGGING = TRUE;
```
With schema evolution + error logging on, the connector auto-detects new
columns from your topic's JSON payload and routes malformed rows to the
table's built-in error table instead of failing the connector.

### Step 2 - Install the connector
1. In Snowsight, go to **Ingestion » Openflow**, open your runtime (the same
   one from UC1, or a new one).
2. On the Openflow overview, go to the **Featured connectors** section ->
   **View more connectors**.
3. Find **Kafka** (or the mTLS variant if the Redpanda cluster uses
   self-signed certs over SASL_SSL - check with the admin which one Ovi's
   cluster needs) -> **Install**.
4. In **Select runtime**, pick your own runtime from the dropdown -> **Add**.
5. Authenticate to the deployment, **Allow** access, then authenticate to the
   runtime. The connector's process group appears on your canvas.

### Step 3 - Configure the connector
Right-click the imported process group -> **Parameters**, and fill in:

| Parameter | Value |
|---|---|
| Kafka Bootstrap Servers | `<redpanda-broker-host>:<port>` |
| Kafka Topic Format | `names` |
| Kafka Topics | `<shared-topic-name>` |
| Kafka Consumer Group ID | `swtber27_user<n>_cg` (must be unique per attendee) |
| Kafka Auto Offset Reset | `latest` (or `earliest` if you want to replay from the start) |
| Kafka SASL Username / Password | `<provided by admin>` (only if the cluster requires SASL) |
| Snowflake Destination Database | `SWTBER27_USER<N>` |
| Snowflake Destination Schema | `PUBLIC` |
| Snowflake Destination Table | `KAFKA_EVENTS` |

No separate Snowflake role/user needs to be created for the connector - your
own `SWTBER27_USER<N>_RL` role already owns your database and inherits
everything else (deployment usage, EAI, warehouse) from
`SWTBER27_ATTENDEE_RL`, so it satisfies the connector's requirement of
`OWNERSHIP` on the destination table automatically.

### Step 4 - Start it
1. Right-click the canvas -> **Enable all Controller Services**.
2. Right-click the process group -> **Start**.

### Step 5 - Verify
```sql
SELECT * FROM SWTBER27_USER<N>.PUBLIC.KAFKA_EVENTS
ORDER BY kafkaMetadata:timestamp::NUMBER DESC
LIMIT 10;
```
Each row's `kafkaMetadata` column carries `topic`, `partition`, `offset`,
`timestamp`, `key`, and `headers` - inspect it to see exactly where each
record came from.

## Open questions before this can go from draft to final
- Real Redpanda broker address, port, and auth details (SASL vs none, cert
  requirements) - blocks Step 2 of the prerequisites above.
- Whether attendees share one topic or get one each - affects consumer group
  naming guidance and whether producer-side setup is needed too.
- Whether the Kafka connector needs a larger runtime (MEDIUM/LARGE) than the
  SMALL node used for UC1 - the general Openflow connector catalog notes some
  connectors are size-restricted; not confirmed for this specific connector.
  If install is blocked on a SMALL runtime, the attendee may need a second,
  larger runtime rather than reusing their UC1 one.
- Whether to also cover the "Snowflake to Kafka" (sink) direction mentioned
  in the World Tour planning notes ("Openflow + Kafka + DCM use case") - out
  of scope for this draft, which only covers Kafka-as-a-source.
