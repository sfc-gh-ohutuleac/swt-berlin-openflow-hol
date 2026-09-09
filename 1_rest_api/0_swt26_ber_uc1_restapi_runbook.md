# Openflow HoL - Attendee Runbook (UC1: REST API)

Welcome! Everything you need has already been set up for you: your own
database, your own role, and access to the shared Openflow deployment. You
don't need to create any integration, network rule, or EAI - just follow the
steps below.

You should have received:
- **Username**: `SWTBER27_USER<N>` (e.g. `SWTBER27_USER07`)
- **Temporary password** (you'll be asked to change it on first login)

Everywhere below, replace `<N>` with your own attendee number.

---

## Step 1 - Log in and confirm your role

1. Go to Snowsight and log in with your assigned username/password.
2. You'll be prompted to set a new password on first login.
3. Check the role selector (top left) - it should already default to
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

If you want a ready-made DDL, `swt26_ber_setup.sql` in the repo's
`1_rest_api/` folder contains a reference schema (including an optional
Iceberg-table variant).

---

### Step 3.2 - Build the Openflow flow

Choose one of the two paths below.

**Fast path** — import the pre-built flow:

1. Download `swt26_ber_flow.json` from the `swt-berlin-openflow-hol` repo, `1_rest_api/` folder.
2. On your NiFi canvas, drag a **Process Group** from the top toolbar onto the canvas.
3. In the "Create process group" dialog, click the small **upload icon** on the right side of the Name field (tooltip: "Browse") and select `swt26_ber_flow.json`.
4. Click **Add**. The flow appears as a Process Group — double-click to open it.

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

Before configuring the `PublishSnowpipeStreaming` processor, create two
controller services inside the process group (default settings, then
**Enable** both): `JsonTreeReader` and `StandardWebClientServiceProvider`.

Configure `PublishSnowpipeStreaming`:

| Property | Value |
|---|---|
| Authentication Strategy | `SNOWFLAKE_MANAGED` |
| Destination Type | `Pipe` |
| Role | `SWTBER27_USER<N>_RL` |
| Database | `SWTBER27_USER<N>` |
| Schema | `PUBLIC` |
| Pipe | `<YOUR_TABLE_NAME>-STREAMING` |
| Web Client Service Provider | the `StandardWebClientServiceProvider` you created |
| Transfer Strategy | `ROWS` |
| Offset Tracking Resolution | `FlowFile` |
| Offset Token End Expression | `${user_id}` |
| Channel Group | `SHARED` |

You don't need to create the pipe yourself - Snowflake auto-creates
`<YOUR_TABLE_NAME>-STREAMING` on first use, as long as the table itself
already exists.

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

**Option B: Start the entire process group at once**

1. Navigate up to the canvas level where your process group sits — click **Openflow** in the bottom-left corner of the canvas to go back to the root level.
2. Right-click the process group -> **Start**.
3. This starts all processors including the `Trigger`, which will fire on its 1-hour schedule. To trigger immediately, go back inside the group, right-click the `Trigger` processor (now running) and select **Run Once** — note that **Run Once is only available when the processor is stopped**, so you may need to stop it first, then use Run Once.
4. Wait ~20-30 seconds for data to flow through (a little longer for the Iceberg table to commit).

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

If you'd rather browse the reference files (setup script, hints, flow.json)
from inside Snowsight instead of GitHub, they're mirrored on a shared stage
you have read access to:

```sql
LS @OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO/branches/main/1_rest_api;
```

## Troubleshooting

- **`UnknownHostException` bulletins on the canvas** - the EAI wasn't
  selected when creating the runtime. Go to your runtime's "..." menu ->
  "External access integrations" -> select `SWTBER27_LAB_EAI` -> Save (no
  restart needed).
- **Login into the Openflow canvas fails / blank screen** - make sure your
  *active* role is `SWTBER27_USER<N>_RL`, not `ACCOUNTADMIN` or any admin
  role (Openflow runtimes reject `ACCOUNTADMIN` as the active role).
- **Can't see the shared deployment** - contact the lab admin; you should
  have `USAGE` on it granted automatically.
