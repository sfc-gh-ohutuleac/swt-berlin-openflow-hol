# swt-berlin-openflow-hol

Snowflake World Tour Berlin 2026 - Openflow Hands On Lab

## Overview

Three use cases, each building an ingestion pipeline into your own Snowflake
database with Openflow. Everything shared is pre-provisioned: your database,
your role, your Openflow runtime, and the source systems.

| Folder | Use case | Approach |
|---|---|---|
| [`1_rest_api/`](1_rest_api/) | **UC1 - REST API** | Build a flow by hand on the NiFi canvas: fetch and enrich JSON from a public API, write with Snowpipe Streaming |
| [`2_postgres/`](2_postgres/) | **UC2 - Postgres CDC** | Configure the PostgreSQL connector to continuously replicate a live database, via the guided wizard or pure SQL |
| [`3_kafka/`](3_kafka/) | **UC3 - Kafka** | Stream from a Kafka/Redpanda topic *(pending broker provisioning)* |

Each folder has its own README and a step-by-step runbook - start there.

## Use cases

### 1. REST API
[`1_rest_api/README.md`](1_rest_api/README.md)

Build the flow yourself, processor by processor: `InvokeHTTP` against a public
API, split and enrich the JSON with a second call, then land it via
`PublishSnowpipeStreaming`. Teaches the NiFi canvas and Openflow fundamentals.
A pre-built `flow.json` is available if you'd rather import than build.

### 2. Postgres CDC
[`2_postgres/README.md`](2_postgres/README.md)

Use a packaged **connector** instead of building a flow. Replicate two tables
from a shared PostgreSQL database - an initial snapshot followed by continuous
CDC. The source generates 5 new rows every 5 seconds, so the stream is live.
Shows both the guided setup wizard and the fully declarative SQL path.

### 3. Kafka
[`3_kafka/README.md`](3_kafka/README.md) - Run this lab on your own kafka broker, after the summit session.

## For lab admins

[`0_setup/`](0_setup/) holds everything needed to stand the lab up:

| File | Purpose |
|---|---|
| `admin_setup.sql` | One-time shared layer: Gen2 deployment, EAI, event table, Postgres instance, shared attendee role |
| `users.yml.example` | Template attendee list - copy to `users.yml` and fill in real passwords before rendering |
| `render_provisioning.py` | Renders the Jinja templates into runnable SQL |
| `templates/` | `provision_users`, `provision_runtimes`, and their deprovision counterparts |
| `rendered/` | Generated SQL - review before running |
| `smoke_test_checklist.md` | Pre-event verification |
| `reset_and_scale_procedure.md` | Between-session reset and scaling up |

Run order: `admin_setup.sql` -> UC2 Postgres source setup -> `provision_users.sql`
-> `provision_runtimes.sql`.

## Links

- [Openflow documentation](https://docs.snowflake.com/en/user-guide/data-integration/openflow/about)
- [Openflow Gen2 quickstart](https://docs.snowflake.com/en/user-guide/data-integration/openflow/gen2/quickstart)
- [Connector for PostgreSQL](https://docs.snowflake.com/en/user-guide/data-integration/openflow/connectors/postgres/about)
- [Snowflake Postgres](https://docs.snowflake.com/en/user-guide/snowflake-postgres/about)
