# Openflow HoL - Attendee Runbook (UC2: Postgres CDC)

In this use case you'll replicate live data out of a PostgreSQL database into
your own Snowflake database using the **Openflow Connector for PostgreSQL** and
Change Data Capture (CDC).

Unlike UC1, you don't build a flow processor-by-processor. A connector is a
pre-packaged flow: you supply configuration, start it, and it handles the
initial snapshot plus a continuous stream of inserts, updates and deletes.

Everything shared has already been set up for you: your own database, your own
role, your own Openflow runtime, the Postgres source, and the credentials.

You should have received:
- **Username**: `SWTBER27_USER<N>` (e.g. `SWTBER27_USER07`)
- **Password** (keep it - you won't be asked to change it)

Everywhere below, replace `<N>` with your own attendee number.

---

## What you're building

```
PostgreSQL (shared, Snowflake Postgres)          Snowflake
+-------------------------------------+          +----------------------------+
|  public.sensors          (10 rows)  |          | SWTBER27_USER<N>           |
|  public.sensor_readings  (~20k +    |  CDC     |   PUBLIC.SENSORS           |
|    5 new rows every 5 seconds)      | ------>  |   PUBLIC.SENSOR_READINGS   |
+-------------------------------------+          +----------------------------+
         ^                                                    ^
         | one shared publication                             | your own
         | swtber27_cdc_pub                                   | Openflow runtime
```

A background job on the Postgres side inserts **5 new rows every 5 seconds**,
so once your connector is running you'll see a continuously growing table.

Every attendee replicates the **same** source tables into their **own**
Snowflake database. Each connector gets its own PostgreSQL replication slot, so
you're fully independent of everybody else in the room.

---

## Step 1 - Log in and confirm your role

1. Go to Snowsight and log in with your assigned username/password.
2. Check the role selector (top left) - it should already default to
   `SWTBER27_USER<N>_RL`. This is your role for everything in this lab: it owns
   your database and is your Openflow runtime's "execute-as" role.

## Step 2 - Find your runtime

Your runtime (`SWTBER27_USER<N>_RUNTIME`) has been pre-created and is already
**Active** - runtime provisioning takes 3-5 minutes, so it was done ahead of
time.

1. In the left navigation, go to **Ingestion » Openflow**.
2. You should see `SWTBER27_USER<N>_RUNTIME`. You own it - nobody else can see
   or modify it.

Or via SQL:

```sql
SHOW OPENFLOW RUNTIMES IN DATABASE SWTBER27_USER<N>;
```

> For reference, this is how it was created - you can make more yourself after
> the lab:
>
> ```sql
> CREATE OPENFLOW RUNTIME SWTBER27_USER<N>.PUBLIC.SWTBER27_USER<N>_RUNTIME
>   IN DEPLOYMENT MY_SNOWFLAKE_DEPLOYMENT
>   NODE_TYPE = SMALL
>   MIN_NODES = 1          -- the Postgres CDC connector requires exactly 1 node
>   MAX_NODES = 1
>   EXECUTE_AS_ROLE = SWTBER27_USER<N>_RL
>   EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI);
> ```

## Step 3 - Get the connection details

The Postgres host, user, publication and the name of the password secret are
available to you as a view. The password itself is held in a Snowflake secret -
you never see its value, you just point the connector at it.

```sql
USE ROLE SWTBER27_USER<N>_RL;
SELECT * FROM OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO;
```

You'll get:

| Field | Value |
|---|---|
| `PG_HOST` | the Snowflake Postgres hostname |
| `PG_PORT` | `5432` |
| `PG_DATABASE` | `postgres` |
| `PG_USER` | `swtber27_cdc` |
| `PG_PUBLICATION` | `swtber27_cdc_pub` |
| `PG_TABLES` | `public.sensors,public.sensor_readings` |
| `PG_PASSWORD_SECRET` | `OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET` |
| `JDBC_URL` | the full `jdbc:postgresql://...` URL |

Everything you need for this lab lives in the shared `OPENFLOW_SHARED` database,
and your role can already read all of it - you don't need to create or request
anything:

| What | Where |
|---|---|
| Connection details (no password) | `OPENFLOW_SHARED.PG.UC2_CONNECTION_INFO` (view) |
| Postgres password | `OPENFLOW_SHARED.PG.SWTBER27_PG_CDC_SECRET` (secret - referenced, never read by you) |
| JDBC driver + config template | `OPENFLOW_SHARED.PG.UC2_FILES` (stage) |
| Ready-made connector config | `OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('<your_db>')` (function) |
| Runtime and connector logs | `OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS` (event table) |

Access comes from the shared technical role `SWTBER27_ATTENDEE_RL`, which your
own role inherits. Every attendee has exactly the same access.

---

## Step 4 - Create and configure the connector

Choose **one** of the two paths below. Option A (guided setup) is the
recommended route for the lab. Option B (SQL) is the same thing done
declaratively, and is how you'd automate this in the real world.

### Option A - Guided setup in Snowsight

1. In **Ingestion » Openflow**, open the **Connectors** tab and click
   **Create connector** (or from your runtime, **Add connector**).
2. Pick **PostgreSQL** from the connector catalog.
3. Choose your runtime, `SWTBER27_USER<N>_RUNTIME`, and give the connector a
   name, e.g. `UC2_PG_CDC`.
4. Work through the wizard steps, using the values from Step 3:

   **Source**
   | Field | Value |
   |---|---|
   | Source Database Connection URL | the `JDBC_URL` from Step 3 |
   | Source Database Driver | upload `postgresql-42.7.4.jar` (see note below) |
   | Source Database User | `swtber27_cdc` |
   | Source Database Password | select the secret `SWTBER27_PG_CDC_SECRET` |
   | Source Database Publication Name | `swtber27_cdc_pub` |

   **Replication table schema**
   | Field | Value |
   |---|---|
   | Included Comma Separated Source Table Names | `public.sensors,public.sensor_readings` |

   **Destination details**
   | Field | Value |
   |---|---|
   | Snowflake Destination Database | `SWTBER27_USER<N>` |
   | Snowflake Warehouse | `COMPUTE_WH` |
   | Destination Schema Strategy | `SOURCE_SCHEMA` |

   Leave everything else at its default.

5. Click through to finish, then **Start** the connector.

> **The JDBC driver**: the connector does not ship with the PostgreSQL driver -
> you supply it. A copy is staged for you in `OPENFLOW_SHARED`:
>
> ```sql
> LS @OPENFLOW_SHARED.PG.UC2_FILES;   -- postgresql-42.7.4.jar
> GET @OPENFLOW_SHARED.PG.UC2_FILES/postgresql-42.7.4.jar file:///tmp/;
> ```
>
> If you'd rather not use a local client, get it from
> [Maven Central](https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.4/postgresql-42.7.4.jar)
> in your browser, then upload it in the wizard's Source step.

<!-- SCREENSHOTS: add guided-setup screenshots here -->

### Option B - SQL (no local tools needed)

Gen2 connectors are Snowflake objects, so the whole setup can be scripted. The
configuration lives in a `config.json` on the connector's own internal versioned
stage - you don't pass parameters in the DDL.

You can do all of this **from a Snowsight worksheet**. You never edit JSON by
hand and you never need Snowflake CLI: a helper function generates your
`config.json`, and `COPY FILES` moves it onto the connector's stage.

**1. Create the connector**

```sql
USE ROLE SWTBER27_USER<N>_RL;
USE WAREHOUSE COMPUTE_WH;

CREATE OPENFLOW CONNECTOR SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC
  IN RUNTIME SWTBER27_USER<N>.PUBLIC.SWTBER27_USER<N>_RUNTIME
  FROM DEFINITION OPENFLOW_POSTGRES_CDC
  DISPLAY_NAME = 'UC2 Postgres CDC';

-- Creation is asynchronous. Wait before touching its stage.
SELECT SYSTEM$WAIT_FOR_STABLE_OPENFLOW_CONNECTORS(600, 'SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC');
```

**2. Generate your `config.json`**

`OPENFLOW_SHARED.PG.UC2_CONFIG_FOR(<your_database>)` returns a complete,
ready-to-use configuration - source URL, user, secret reference, publication,
table list, and your own destination database already filled in.

Have a look at it first if you're curious:

```sql
SELECT OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('SWTBER27_USER<N>');
```

Then write it to a stage in your own database:

```sql
CREATE STAGE IF NOT EXISTS SWTBER27_USER<N>.PUBLIC.MY_UC2_FILES;

COPY INTO @SWTBER27_USER<N>.PUBLIC.MY_UC2_FILES/config.json
  FROM (SELECT OPENFLOW_SHARED.PG.UC2_CONFIG_FOR('SWTBER27_USER<N>'))
  FILE_FORMAT = (TYPE = CSV COMPRESSION = NONE FIELD_DELIMITER = NONE
                 FIELD_OPTIONALLY_ENCLOSED_BY = NONE ESCAPE_UNENCLOSED_FIELD = NONE)
  OVERWRITE = TRUE SINGLE = TRUE HEADER = FALSE;
```

> The `FILE_FORMAT` options matter: they stop Snowflake adding quotes or escapes
> that would corrupt the JSON.

**3. Copy the config and the JDBC driver onto the connector's stage**

The connector does not ship with the PostgreSQL JDBC driver - you supply it as a
connector *asset*. A copy is staged for you in `OPENFLOW_SHARED`:

```sql
LS @OPENFLOW_SHARED.PG.UC2_FILES;   -- postgresql-42.7.4.jar, config.template.json, ...
```

```sql
-- your generated config
COPY FILES INTO 'snow://openflow_connector/SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC/versions/live/'
  FROM @SWTBER27_USER<N>.PUBLIC.MY_UC2_FILES/ FILES = ('config.json');

-- the shared JDBC driver
COPY FILES INTO 'snow://openflow_connector/SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC/versions/live/'
  FROM @OPENFLOW_SHARED.PG.UC2_FILES/ FILES = ('postgresql-42.7.4.jar');

-- expect exactly two files: config.json and postgresql-42.7.4.jar
LS 'snow://openflow_connector/SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC/versions/live/';
```

**4. Commit and start**

```sql
ALTER OPENFLOW CONNECTOR SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC COMMIT;
SELECT SYSTEM$WAIT_FOR_STABLE_OPENFLOW_CONNECTORS(700, 'SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC');

ALTER OPENFLOW CONNECTOR SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC START;
SELECT SYSTEM$WAIT_FOR_OPENFLOW_CONNECTOR_STATUS(700, 'RUNNING', 'SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC');
```

That's it - skip to Step 5 to verify.

> **Changing the config later.** `COMMIT` consumes the live version, so a further
> `COPY FILES` fails with *"Live version is not found."* Reopen a writable copy
> first, then repeat steps 2-4:
>
> ```sql
> ALTER OPENFLOW CONNECTOR SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC ADD LIVE VERSION FROM LAST;
> ```

<details>
<summary>Doing it with Snowflake CLI instead (optional)</summary>

If you prefer to edit the JSON yourself, download the template, edit it, and
upload it with `PUT`. This needs a local client - **Snowsight cannot `GET`/`PUT`
on a connector's versioned stage**.

```sql
GET @OPENFLOW_SHARED.PG.UC2_FILES/config.template.json file:///tmp/uc2/;
-- replace __PG_HOST__, __DRIVER_JAR__ and __DEST_DB__, save as config.json

PUT 'file:///tmp/uc2/config.json'
    'snow://openflow_connector/SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC/versions/live/'
    AUTO_COMPRESS = FALSE OVERWRITE = TRUE;
```

Two `PUT` traps: the destination must be the **directory**, ending in
`/versions/live/` - `PUT` appends the source filename itself, so writing
`.../versions/live/config.json` creates a nested `config.json/config.json` that
silently shadows the real file. And your local file must literally be named
`config.json`.

</details>

---

## Step 5 - Verify

The connector does an initial **snapshot** of both tables, then switches to
**incremental** CDC. The snapshot takes a minute or two.

```sql
USE ROLE SWTBER27_USER<N>_RL;
USE WAREHOUSE COMPUTE_WH;

SHOW OPENFLOW CONNECTORS IN DATABASE SWTBER27_USER<N>;   -- expect status RUNNING

-- The connector creates the schema and tables for you.
SELECT COUNT(*) FROM SWTBER27_USER<N>.PUBLIC.SENSORS;           -- expect 10
SELECT COUNT(*) FROM SWTBER27_USER<N>.PUBLIC.SENSOR_READINGS;   -- ~20,000 and climbing
```

Now prove the stream is live - run this twice, about a minute apart. The count
should grow by roughly 60 (5 rows every 5 seconds):

```sql
SELECT COUNT(*) AS readings, MAX(READING_TS) AS newest
FROM SWTBER27_USER<N>.PUBLIC.SENSOR_READINGS;
```

And a query that actually uses the join, to show both tables replicated:

```sql
SELECT s.LOCATION,
       s.SENSOR_TYPE,
       COUNT(*)                        AS readings,
       ROUND(AVG(r.VALUE), 2)          AS avg_value,
       MAX(r.READING_TS)               AS newest
FROM SWTBER27_USER<N>.PUBLIC.SENSOR_READINGS r
JOIN SWTBER27_USER<N>.PUBLIC.SENSORS s
  ON s.SENSOR_ID = r.SENSOR_ID
GROUP BY s.LOCATION, s.SENSOR_TYPE
ORDER BY s.LOCATION, s.SENSOR_TYPE;
```

Runtime and connector telemetry lands in the shared event table, which you can
read automatically:

```sql
SELECT TIMESTAMP,
       TRY_PARSE_JSON(VALUE::string):formattedMessage::string AS msg
FROM OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS
WHERE TIMESTAMP > DATEADD('minute', -15, CURRENT_TIMESTAMP())
ORDER BY TIMESTAMP DESC
LIMIT 50;
```

## Step 6 - Bonus: watch an UPDATE and a DELETE replicate

CDC isn't just inserts. `sensor_readings` has a primary key, so updates and
deletes replicate too. Ask your instructor to run something like this on the
Postgres side:

```sql
UPDATE public.sensors SET location = 'Building-Z' WHERE sensor_id = 1;
```

Then, within a minute:

```sql
SELECT SENSOR_ID, SENSOR_NAME, LOCATION
FROM SWTBER27_USER<N>.PUBLIC.SENSORS
ORDER BY SENSOR_ID;
```

> **Why the primary key matters**: without a primary key, a unique index, or
> `REPLICA IDENTITY FULL`, a Postgres table is replicated **insert-only** -
> updates and deletes are silently skipped.

---

## Troubleshooting

**`SHOW OPENFLOW CONNECTORS` says `START_FAILED` or `UPDATE_FAILED`.**
That status alone tells you nothing. The real error is in the event table:

```sql
SELECT TIMESTAMP,
       TRY_PARSE_JSON(VALUE::string):formattedMessage::string AS msg
FROM OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS
WHERE TIMESTAMP > DATEADD('minute', -15, CURRENT_TIMESTAMP())
  AND TRY_PARSE_JSON(VALUE::string):level::string = 'ERROR'
ORDER BY TIMESTAMP DESC
LIMIT 20;
```

Use `TRY_PARSE_JSON`, not `PARSE_JSON` - some rows aren't valid JSON and will
error the whole query out.

**`'Snowflake Warehouse' validated against 'COMPUTE_WH' is invalid because
Value is not one of the allowable values`.**
Misleading message: the value is fine, the *grant* is missing. The warehouse is
validated as your runtime's execute-as role. Make sure your role has
`USAGE, OPERATE` on `COMPUTE_WH` - it should via `SWTBER27_ATTENDEE_RL`.

**`'Database Driver Locations' ... No resources were specified`** or
**`'Source Database Driver' is required`.**
The JDBC driver jar isn't attached. See the driver note in Step 4.

**`'Legacy Format Support' is invalid because Legacy Format Support is
required`.**
Your `config.json` predates a connector update. Set
`"Legacy Format Support": {"valueType": "STRING_LITERAL", "value": "STANDARD"}`
in the **Destination details** group, or regenerate the config from a freshly
created connector.

**`PSQLException: The connection attempt failed.`**
Network path problem, not credentials. Two things must both be true: your
runtime needs the `SWTBER27_LAB_EAI` external access integration attached
(egress), and the Postgres instance's network policy must allow the runtime's
egress IP range (ingress). Check the EAI first:

```sql
SHOW OPENFLOW RUNTIMES IN DATABASE SWTBER27_USER<N>;   -- external_access_integrations column
```

If it's missing, attach it:

```sql
ALTER OPENFLOW RUNTIME SWTBER27_USER<N>.PUBLIC.SWTBER27_USER<N>_RUNTIME
  ADD EXTERNAL_ACCESS_INTEGRATIONS = (SWTBER27_LAB_EAI);
```

No restart needed. If the EAI is present and it still fails, tell the lab admin -
the ingress allowlist on the Postgres instance probably needs updating.

**A table I selected isn't replicating, with no error.**
Only tables in the publication are replicated, and a table missing from it is
skipped **silently**. Stick to `public.sensors` and `public.sensor_readings`.

**Row counts stopped growing.**
Check the connector is still `RUNNING`, then check the generator is still
running on the Postgres side (ask the lab admin). The snapshot phase also
finishes before incremental starts, so a brief plateau right after startup is
normal.

**`ALTER ... START` says the connector is in `UPDATING` status.**
Configuration changes are asynchronous. Wait first:

```sql
SELECT SYSTEM$WAIT_FOR_STABLE_OPENFLOW_CONNECTORS(600, 'SWTBER27_USER<N>.PUBLIC.UC2_PG_CDC');
```

**Login into the Openflow canvas fails / blank screen.**
Make sure your *active* role is `SWTBER27_USER<N>_RL`, not `ACCOUNTADMIN` or any
admin role - Openflow runtimes reject `ACCOUNTADMIN` as the active role.
