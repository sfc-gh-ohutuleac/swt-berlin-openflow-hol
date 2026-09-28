# Lab Admin Setup

This folder contains everything needed to stand the lab up from scratch and tear it down afterwards. All scripts are idempotent (`CREATE ... IF NOT EXISTS`) and safe to re-run.

## Prerequisites

- A Snowflake account with **ACCOUNTADMIN** access
- Python 3 with `jinja2` and `pyyaml` installed (for rendering templates)
- Knowledge about Snowflake Openflow, complete the [Openflow quickstart](https://www.snowflake.com/en/developers/guides/getting-started-with-openflow-spcs) completed (deployment + runtime take 25-30 min)

## Files

| File | Purpose |
|---|---|
| `admin_setup.sql` | One-time shared layer: admin role, database, event table, Gen2 deployment, network rules, EAI, Postgres instance, attendee role |
| `users.yml.example` | Template attendee list — copy to `users.yml` and fill in real passwords |
| `render_provisioning.py` | Renders Jinja templates into runnable SQL |
| `templates/` | Jinja templates for provisioning and deprovisioning users and runtimes |
| `rendered/` | Generated SQL output (gitignored — contains plaintext passwords) |
| `smoke_test_checklist.md` | Pre-event verification checklist |
| `reset_and_scale_procedure.md` | Between-session reset and scaling guide |

## Setup order

### 1. Run the shared admin layer

Execute Step-by-Step `admin_setup.sql` as **ACCOUNTADMIN** in a Snowsight worksheet. Replace placeholders Step-by-Step. This creates:

1. `OPENFLOW_ADMIN` role
2. `OPENFLOW_SHARED` database (INFRA, GIT, PG schemas)
3. Account-wide event table
4. Gen2 Openflow deployment
5. Network rules + external access integration (UC1 REST API, UC2 Postgres CDC)
6. Git repository object for the HoL repo
7. Snowflake Postgres instance + ingress network policy
8. `SWTBER26_ATTENDEE_RL` shared attendee role

### 2. Set up the Postgres source (For Use Case 2 Postgres only)

Remember to add you current IP ADDRESS to the network policy of postgres db. You can find your IP by running `SELECT CURRENT_IP_ADDRESS()`

Run `postgres_setup.sql` via `psql` or `DBeaver` as `snowflake_admin`. This creates the source tables, CDC user, publication, and the row generator.

### 3. Render and provision users

```bash
cp users.yml.example users.yml
# Edit users.yml — add attendees with unique passwords

python3 render_provisioning.py
```

This generates four files in `rendered/`:
- `provision_users.sql` — creates databases, roles, users
- `provision_runtimes.sql` — creates one Openflow runtime per user
- `deprovision_users.sql` — drops users, roles, databases
- `deprovision_runtimes.sql` — suspends, terminates, drops runtimes

You can render only one side:

```bash
python3 render_provisioning.py --only provision
python3 render_provisioning.py --only deprovision
```

### 4. Run the provisioning SQL

You can execute the rendered SQL files using **Snowflake CLI** (`snow`), a **Snowsight worksheet**, or any SQL client.

The Runtimes are always provisioned/deprovisoned in batches of 10, waiting for the batch to finish completely before moving to the next one.

#### Using Snowflake CLI (recommended)

```bash
# Provision users (databases, roles, users)
snow sql -f rendered/provision_users.sql -c <connection_name>

# Provision runtimes (one per attendee, 3-5 min each)
snow sql -f rendered/provision_runtimes.sql -c <connection_name>
```

Replace `<connection_name>` with your Snowflake CLI connection name (from `~/.snowflake/connections.toml`). The connection must use a role with ACCOUNTADMIN privileges.

Other rendered scripts work the same way:

```bash
# Suspend all runtimes (between sessions, to stop compute costs)
snow sql -f rendered/suspend_runtimes.sql -c <connection_name>

# Resume all runtimes
snow sql -f rendered/resume_runtimes.sql -c <connection_name>

# Deprovision
snow sql -f rendered/deprovision_runtimes.sql -c <connection_name>
snow sql -f rendered/deprovision_users.sql -c <connection_name>
```

#### Using Snowsight

Open a worksheet as ACCOUNTADMIN, paste the contents of the rendered SQL file, and execute.

Runtime creation is asynchronous — run in batches and wait for each batch to reach `ACTIVE` before starting the next.

## Scaling up

To add more attendees:

1. Add entries to `users.yml`
2. Re-run `python3 render_provisioning.py`
3. Execute `rendered/provision_users.sql` (existing users are skipped)
4. Execute the new runtime blocks from `rendered/provision_runtimes.sql`

See `reset_and_scale_procedure.md` for cost/quota considerations and batch guidance.


## READY

Now you are ready to give the participants the user/passwd and let them start the Use Cases.

## Deprovisioning

Order matters — runtimes and connectors must go before the roles that own them.

```
1. python3 render_provisioning.py --only deprovision
2. Review and run rendered/deprovision_runtimes.sql    # suspend -> terminate cascade -> drop
3. Clean up Postgres replication slots (see below)
4. Review and run rendered/deprovision_users.sql       # drops users, roles, databases
```

### Replication slot cleanup (required after UC2)

Dropping an Openflow connector does **not** drop its PostgreSQL replication slot. Orphaned slots pin WAL forever. After deprovisioning runtimes, connect to Postgres and run:

```sql
-- Inspect first — only drop INACTIVE slots
SELECT slot_name, active FROM pg_replication_slots
WHERE slot_name LIKE 'snowflake_connector_%';

SELECT pg_drop_replication_slot(slot_name)
FROM pg_replication_slots
WHERE slot_name LIKE 'snowflake_connector_%' AND NOT active;
```

## Resetting between sessions

For a quick reset without full deprovisioning, see `reset_and_scale_procedure.md`. The typical flow is:

1. Deprovision runtimes (stops compute costs)
2. Clean up replication slots
3. Optionally truncate the Postgres source and re-seed
4. Re-provision runtimes when ready for the next session

The shared layer (`OPENFLOW_ADMIN`, `OPENFLOW_SHARED`, deployment, EAI, Postgres instance, event table) is never touched by any template — it is managed only via `admin_setup.sql`.
