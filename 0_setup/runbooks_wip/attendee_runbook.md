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

## Step 2 - Create your own Openflow runtime

1. In the left navigation, go to **Ingestion » Openflow**.
2. You'll see one existing **deployment** (shared by everyone in this lab) -
   you have `USAGE` on it, so it's visible to you.
3. Click **Create a runtime**. Fill in:
   - **Runtime Name**: e.g. `SWTBER27_USER<N>_RUNTIME`
   - **Deployment**: the shared deployment (only one available)
   - **Node Type**: `SMALL`
   - **Min/Max Nodes**: `1` / `1`
   - **Execute-as role**: `SWTBER27_USER<N>_RL` (your own role)
   - **External Access Integrations**: `SWTBER27_LAB_EAI` (select it here -
     this is what lets your flow call the internet)
4. Click **Create**. This takes a couple of minutes.
5. Once it shows **Active**, click on it to open the NiFi canvas.

You just created and now own this runtime - nobody else can see or modify it.

## Step 3 - Build the flow

Goal: fetch 30 users from a public API, enrich each with their shopping
cart from a second API call, and write the joined result into your own
Snowflake database.

**Your database (`SWTBER27_USER<N>`) is empty** - no table has been
pre-created for you. Before wiring up the write step, create a destination
table yourself (in schema `PUBLIC`) with columns matching whatever fields you
extract from the two APIs. This is intentionally part of the exercise - refer
to the API responses (`https://dummyjson.com/users`,
`https://dummyjson.com/carts/user/{id}`) to decide the shape. If you want a
reference schema, `techup27_setup.sql` in the shared repo (Step 3 below)
shows one example (including an optional Iceberg-table variant).

**Fast path**: import the pre-built flow (`techup27_flow.json` from the
`swt-berlin-openflow-hol` repo, `1_rest_api/` folder) as a Process Group on
your canvas.

**Manual path** (recommended at least once): follow the step-by-step cheat
sheet (`techup27_hints.txt`) to build these processors yourself:

```
GenerateFlowFile (Trigger)
  -> InvokeHTTP (GET https://dummyjson.com/users?limit=30&select=id,firstName,lastName,email,address)
  -> SplitJson ($.users[*])
  -> EvaluateJsonPath (user_id, first_name, last_name, email, city, country)
  -> InvokeHTTP (GET https://dummyjson.com/carts/user/${user_id})
  -> EvaluateJsonPath (cart_total, cart_discounted, total_products, total_quantity)
  -> UpdateAttribute (ingested_at = current timestamp)
  -> AttributesToJSON (attributes -> JSON content)
      -> PutSnowpipeStreaming2 (Pipe: <YOUR_TABLE_NAME>-STREAMING) -> your table
```

Before configuring the `PutSnowpipeStreaming2` processor, create two
controller services inside the process group (default settings, then
**Enable** both): `JsonTreeReader` and `StandardWebClientServiceProvider`.

Configure `PutSnowpipeStreaming2`:

| Property | Value |
|---|---|
| Authentication Strategy | `SNOWFLAKE_MANAGED` |
| Connection Strategy | `STANDARD` |
| Role | `SWTBER27_USER<N>_RL` |
| Database | `SWTBER27_USER<N>` |
| Schema | `PUBLIC` |
| Pipe | `<YOUR_TABLE_NAME>-STREAMING` |
| Web Client Service Provider | the `StandardWebClientServiceProvider` you created |
| Transfer Strategy | `ROWS` |
| Offset Tracking Resolution | `FLOW_FILE` |
| Offset Token Start/End Expression | `${user_id}` |
| Channel Group | `SHARED` |

You don't need to create the pipe yourself - Snowflake auto-creates
`<YOUR_TABLE_NAME>-STREAMING` on first use, as long as the table itself
already exists.

**Bonus**: once the regular write works, duplicate the processor and change
only the Pipe property to point at a second, Iceberg-backed table
(`CATALOG = 'SNOWFLAKE', EXTERNAL_VOLUME = 'SNOWFLAKE_MANAGED'`) to see the
same data land in an open table format with no extra config.

## Step 4 - Run it

1. Right-click the `Trigger` processor -> **Run Once**.
2. Wait ~20-30 seconds (a little longer for the Iceberg table to commit).

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
