# Openflow HoL - Attendee Runbook (UC1: REST API)

Welcome! Everything you need has already been set up for you: your own
database, your own role, and access to the shared Openflow deployment. You
don't need to create any integration, network rule, or EAI - just follow the
steps below.

You should have received:
- **Username**: `SWTBER27_USER<N>` (e.g. `SWTBER27_USER07`)
- **Password** (keep it - you won't be asked to change it)

Everywhere below, replace `<N>` with your own attendee number.

---

## Step 1 - Log in and confirm your role

1. Go to Snowsight and log in with your assigned username/password.
2. Check the role selector (top left) - it should already default to
   `SWTBER27_USER<N>_RL`. This is your role for everything in this lab: it
   owns your database and doubles as your Openflow runtime's "execute-as"
   role.

## Step 2 - Create your own Openflow runtime *(reference only - do not perform)*

> **Note: this step has already been done for you.** To save time during the lab (runtime creation can take several minutes, and spinning up many runtimes simultaneously on a shared deployment adds up), your runtime has been pre-provisioned. You can skip straight to opening it in Step 2.5 below.
>
> The instructions below are here for reference — so you know how to do it yourself after the lab.

### Option A: Snowsight UI

1. In the left navigation, go to **Ingestion » Openflow**.
2. You'll see the lab **deployment** - you have `USAGE` on it, so it's visible to you.
3. Click **Create a runtime**. Fill in:
   - **Runtime Name**: e.g. `SWTBER27_USER<N>_RUNTIME`
   - **Deployment**: select the lab deployment
   - **Node Type**: `SMALL`
   - **Min/Max Nodes**: `1` / `1`
   - **Execute-as role**: `SWTBER27_USER<N>_RL` (your own role)
   - **External Access Integrations**: `SWTBER27_LAB_EAI` (select it here -
     this is what lets your flow call the internet)
4. Click **Create**. This takes a couple of minutes.
5. Once it shows **Active**, click on it to open the NiFi canvas.

### Option B: SQL (Gen2)

Runtimes are first-class Snowflake objects in Gen2 and can be created, altered, and dropped with SQL — useful for automation, CI/CD, or scripted lab provisioning.

```sql
USE ROLE SWTBER27_USER<N>_RL;

CREATE OPENFLOW RUNTIME SWTBER27_USER<N>.PUBLIC.SWTBER27_USER<N>_RUNTIME
  IN DEPLOYMENT <shared_deployment_name>
  NODE_TYPE = SMALL
  MIN_NODES = 1
  MAX_NODES = 1
  EXECUTE_AS_ROLE = SWTBER27_USER<N>_RL
  EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI)
  DISPLAY_NAME = 'User <N> Runtime';

-- Wait for the runtime to become ACTIVE (provisioning takes ~3-5 minutes)
SELECT SYSTEM$WAIT_FOR_OPENFLOW_RUNTIME_STATUS(
  'SWTBER27_USER<N>.PUBLIC.SWTBER27_USER<N>_RUNTIME', 'ACTIVE', 600
);
```

Both options create the same runtime object. The SQL path is the recommended approach for repeatable or automated deployments.

Reference: [Quickstart: Gen2 Openflow — Create a runtime](https://docs.snowflake.com/en/user-guide/data-integration/openflow/gen2/quickstart#label-openflow-gen2-quickstart-runtime)

### Step 2.5 - Open your runtime

Your runtime (`SWTBER27_USER<N>_RUNTIME`) has been pre-created and is already **Active**.

1. In the left navigation, go to **Ingestion » Openflow**.
2. Click on your runtime to open the NiFi canvas.

You own this runtime - nobody else can see or modify it.

### Why your flow can reach the internet

Openflow runtimes run inside Snowflake and have **no outbound network access
by default**. Two objects change that, and both are already set up for you:

- A **network rule** allowing egress to `dummyjson.com:443`
- An **External Access Integration** (`SWTBER27_LAB_EAI`) that wraps that rule
  and is **attached to your runtime**

Without the EAI attached, the `InvokeHTTP` processors would fail with
`UnknownHostException`. This is one of the first things to check whenever an
Openflow flow can't reach an external system.

## Step 3 - Build the flow

Goal: fetch 30 users from a public API, enrich each with their shopping
cart from a second API call, and write the joined result into your own
Snowflake database.

---

### Step 3.1 - Create the destination table

Your database (`SWTBER27_USER<N>`) is empty - no table has been pre-created
for you. Before building the flow, create a destination table in Snowsight
(schema `PUBLIC`) with columns matching the fields you want to extract from
the two APIs. This is intentionally part of the exercise.

Explore the API responses to decide the shape:
- Users: `https://dummyjson.com/users`
- Carts: `https://dummyjson.com/carts/user/1`

If you want a ready-made DDL, `swt26_ber_table_setup.sql` on the shared lab stage
contains a reference schema (including an optional Iceberg-table variant):

```sql
LS @OPENFLOW_SHARED.INFRA.UC1_FILES;
GET @OPENFLOW_SHARED.INFRA.UC1_FILES/swt26_ber_table_setup.sql file:///tmp/;
```

---

### Step 3.2 - Build the Openflow flow

Choose one of the two paths below.

**Fast path** — import the pre-built flow:

1. Download `swt26_ber_flow.json` from the shared lab stage - everything for this
   lab lives in `OPENFLOW_SHARED` and your role can already read it:

   ```sql
   LS @OPENFLOW_SHARED.INFRA.UC1_FILES;
   GET @OPENFLOW_SHARED.INFRA.UC1_FILES/swt26_ber_flow.json file:///tmp/;
   ```

   In Snowsight you can also download it from **Data » Databases »
   OPENFLOW_SHARED » INFRA » Stages » UC1_FILES**.
2. On your NiFi canvas, drag a **Process Group** from the top toolbar onto the canvas.
3. In the "Create process group" dialog, click the small **upload icon** on the right side of the Name field (tooltip: "Browse") and select `swt26_ber_flow.json`.
4. Click **Add**. The flow appears as a Process Group — double-click to open it.
5. **Enable the two controller services.** Right-click the canvas inside the group ->
   **Controller Services**, then enable `JsonTreeReader` and
   `StandardWebClientServiceProvider`. They ship with the flow but arrive disabled.

   Controller services are shared, long-lived services that processors reference
   instead of configuring themselves. Both are used by `PublishSnowpipeStreaming`:

   | Service | What it does |
   |---|---|
   | `JsonTreeReader` | Parses the JSON in the FlowFile content into a record (its **Record Reader**) |
   | `StandardWebClientServiceProvider` | The HTTP client it uses to call the Snowpipe Streaming API |

   A processor cannot start while a service it references is disabled.
6. **Fill in the blanks on the write processors.** The imported flow contains two
   `PublishSnowpipeStreaming` processors (one for a standard table, one for the
   Iceberg bonus). Both intentionally ship with **`Database` and `Pipe` left
   empty** so you set your own - that is why they show as invalid on import.
   Open each one (right-click -> **Configure** -> **Properties**) and set:

   | Processor | Database | Pipe |
   |---|---|---|
   | `Write to USER_SPENDING` | `SWTBER27_USER<N>` | `<YOUR_TABLE_NAME>-STREAMING` |
   | `Write to USER_SPENDING_ICEBERG` | `SWTBER27_USER<N>` | `<YOUR_ICEBERG_TABLE>-STREAMING` |

   The pipe name must follow the `<YOUR_TABLE_NAME>-STREAMING` convention - that
   suffix is how Snowflake resolves which table to write to (see below).

   If you are skipping the Iceberg bonus, just delete the second processor.

**Manual path** *(recommended at least once)* — follow `swt26_ber_hints.txt` to build these processors yourself:

```
GenerateFlowFile (Trigger)
  -> InvokeHTTP (GET https://dummyjson.com/users?limit=30&select=id,firstName,lastName,email,address)
  -> SplitJson ($.users[*])
  -> EvaluateJsonPath (user_id, first_name, last_name, email, city, country)
  -> InvokeHTTP (GET https://dummyjson.com/carts/user/${user_id})
  -> EvaluateJsonPath (cart_total, cart_discounted, total_products, total_quantity)
  -> UpdateAttribute (ingested_at = current timestamp)
  -> AttributesToJSON (attributes -> JSON content)
      -> PublishSnowpipeStreaming (Pipe: <YOUR_TABLE_NAME>-STREAMING) -> your table
```

(The pre-built flow adds a second `PublishSnowpipeStreaming` fanned out from
`AttributesToJSON` for the Iceberg bonus - see the end of this step.)

Before configuring the `PublishSnowpipeStreaming` processor, create two
controller services inside the process group (default settings, then
**Enable** both): `JsonTreeReader` and `StandardWebClientServiceProvider`.

Configure `PublishSnowpipeStreaming`:

| Property | Value |
|---|---|
| Authentication Strategy | `SNOWFLAKE_MANAGED` |
| Destination Type | `Pipe` |
| Database | `SWTBER27_USER<N>` |
| Schema | `PUBLIC` |
| Pipe | `<YOUR_TABLE_NAME>-STREAMING` |
| Web Client Service Provider | the `StandardWebClientServiceProvider` you created |
| Transfer Strategy | `ROWS` |
| Offset Tracking Resolution | `FlowFile` |
| Offset Token End Expression | `${user_id}` |
| Channel Group | `SHARED` |

Auto-terminate all four relationships: `success`, `failure`, `invalid`, `empty`.

#### How the processor finds your table: the default pipe

You never create the pipe yourself. Snowflake provides a **default pipe** for
every table, created on demand the first time something streams to it. Its name
is derived from the table:

| Table | Default pipe |
|---|---|
| `USER_SPENDING` | `USER_SPENDING-STREAMING` |
| `USER_SPENDING_ICEBERG` | `USER_SPENDING_ICEBERG-STREAMING` |

So `Database` + `Schema` + `Pipe` is what resolves the target table - the
`-STREAMING` suffix is the convention that links pipe to table. The **table must
already exist**; only the pipe is auto-created.

The pipe is the server-side processing layer: it validates the incoming schema
and maps fields to columns using `MATCH_BY_COLUMN_NAME`. That is why the JSON
field names produced by `AttributesToJSON` have to match your column names -
`user_id` lands in `USER_ID`, `cart_total` in `CART_TOTAL`, and so on.

The default pipe is fully Snowflake-managed (no `CREATE`, `ALTER`, or `DROP`),
but you can inspect it:

```sql
SHOW PIPES IN SCHEMA SWTBER27_USER<N>.PUBLIC;
SHOW CHANNELS IN PIPE SWTBER27_USER<N>.PUBLIC."USER_SPENDING-STREAMING";
```

If you needed in-flight transformations (reordering columns, casting, applying
expressions) you would create a named pipe with `CREATE PIPE` instead - the
default pipe deliberately does not support them.

Reference: [The PIPE object](https://docs.snowflake.com/en/user-guide/snowpipe-streaming/snowpipe-streaming-pipe-object)

**Bonus**: once the regular write works, duplicate the processor and change
only the Pipe property to point at a second, Iceberg-backed table
(`CATALOG = 'SNOWFLAKE', EXTERNAL_VOLUME = 'SNOWFLAKE_MANAGED'`) to see the
same data land in an open table format with no extra config.

## Step 4 - Run it

There are two ways to start the flow:

**Option A: Start all processors individually, then trigger once** *(recommended)*

1. Start every processor **except** the `Trigger` (GenerateFlowFile) — right-click each and select **Start**, or select all non-trigger processors and start them together.
2. Keep the `Trigger` processor in **stopped** state — "Run Once" is only available on a stopped processor.
3. Right-click the `Trigger` processor -> **Run Once**.
4. Wait ~20-30 seconds for data to flow through (a little longer for the Iceberg table to commit).

**Option B: Start the whole process group - this runs the flow immediately** *(simplest)*

Starting the process group starts every processor in it, including the
`Trigger`. The `Trigger` fires straight away, so the flow runs as soon as you
hit Start - there is no separate "Run Once" step.

1. Navigate up to the canvas level where your process group sits — click **Openflow** in the bottom-left corner of the canvas to go back to the root level.
2. Right-click the process group -> **Start**. The flow runs immediately.
3. Wait ~20-30 seconds for data to flow through (a little longer for the Iceberg table to commit).

Afterwards the `Trigger` stays running and will fire again on its 1-hour
schedule. Stop it (or the whole group) once you've verified the data.

## Step 4.5 - Run it again (and see exactly-once delivery in action)

Trigger the flow a second time and check the row count. It stays at **30** -
nothing new was inserted.

That is not a bug. `PublishSnowpipeStreaming` tracks **offset tokens** for
exactly-once delivery. We configured `Offset Token End Expression = ${user_id}`,
so tokens 1-30 are already committed on the channel and Snowflake skips them.
This is what protects you from duplicates when a flow retries or a runtime
restarts.

To actually re-run with fresh data, pick one:

| Option | How | When to use |
|---|---|---|
| **New channel group** | Change `Channel Group` from `SHARED` to `SHARED-2` | Quickest one-off reset |
| **Disable offset tracking** | Set `Offset Tracking Resolution` to `Disabled` | Best for repeated demos - inserts every time |

In all cases, truncate the table first so you do not end up with duplicates:

```sql
TRUNCATE TABLE SWTBER27_USER<N>.PUBLIC.<YOUR_TABLE_NAME>;
```

Also empty any queued FlowFiles left on the canvas before re-triggering -
otherwise leftovers from the previous run get processed too and you see
duplicates: right-click each connection -> **Empty queue**.

## Step 5 - Verify

Back in a Snowsight SQL worksheet, run (as your own role/user):

```sql
SELECT COUNT(*) FROM SWTBER27_USER<N>.PUBLIC.<YOUR_TABLE_NAME>;  -- expect 30

SELECT * FROM SWTBER27_USER<N>.PUBLIC.<YOUR_TABLE_NAME>
ORDER BY CART_TOTAL DESC
LIMIT 5;
```

If you want to look at your own runtime's telemetry (logs/metrics), you can
query the shared event table - you have read access automatically:

```sql
SELECT *
FROM OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS
ORDER BY TIMESTAMP DESC
LIMIT 50;
```

All reference files for this lab live on a shared stage in `OPENFLOW_SHARED`
that your role can read - no GitHub access needed:

```sql
LS @OPENFLOW_SHARED.INFRA.UC1_FILES;
```

| File | What it is |
|---|---|
| `0_swt26_ber_uc1_restapi_runbook.md` | This runbook |
| `swt26_ber_table_setup.sql` | Reference DDL for the destination tables |
| `swt26_ber_flow.json` | Pre-built flow for the fast path |
| `swt26_ber_hints.txt` | Step-by-step cheat sheet with every processor config |
| `swt26_ber_summary.txt` | Lab overview and learning objectives |

## Troubleshooting

- **`UnknownHostException` bulletins on the canvas** - the EAI wasn't
  selected when creating the runtime. Go to your runtime's "..." menu ->
  "External access integrations" -> select `SWTBER27_LAB_EAI` -> Save (no
  restart needed).
- **`ERR_TABLE_DOES_NOT_EXIST_NOT_AUTHORIZED` on the write processor** - the
  error conflates two causes. Either the destination table does not exist yet
  (create it - Step 3.1; the *pipe* is auto-created but the *table* is not), or
  the `Database` property is still empty / pointing at the wrong database.
  Check with `SHOW TABLES IN SCHEMA SWTBER27_USER<N>.PUBLIC;`.
- **`STALE_CONTINUATION_TOKEN_SEQUENCER` on the write processor** - the
  streaming channel is out of sync with Snowflake, usually after a processor
  or runtime restart. Fix: change the `Channel Group` property to a new name
  (e.g. `SHARED-2`) to open a fresh channel.
- **Processor won't start / shows invalid** - most often a controller service
  is created but not **enabled**, or `Database` / `Pipe` are still empty on the
  imported flow. Hover the warning triangle to see the exact reason.
- **"Run Once" is greyed out** - it is only available on a **stopped**
  processor. Stop the Trigger, then use Run Once.
- **Second run inserts nothing** - expected. See Step 4.5 (offset tracking).
- **Can't see the shared deployment** - contact the lab admin; you should
  have `USAGE` on it granted automatically.
