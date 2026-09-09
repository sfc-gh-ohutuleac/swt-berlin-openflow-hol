# Reset / Re-run / Scale-Up Procedure

## Re-running provisioning safely
`provision_users.sql.j2` is idempotent (`CREATE ... IF NOT EXISTS` throughout). You can:
1. Edit `users.yml` (add/remove entries under `users:` — keep `id` lowercase, `password` set).
2. Re-run: `python3 render_provisioning.py`
3. Review `rendered/provision_users.sql`, then execute it.

Existing users/roles/DBs are left untouched (their passwords do NOT change on re-run, since
`CREATE USER IF NOT EXISTS` skips entirely if the user already exists). New entries in
`users.yml` get created; nothing is deleted.

## Tearing down the pilot list (between test runs, not the shared layer)
1. `python3 render_provisioning.py --only deprovision`
2. Review `rendered/deprovision_users.sql` carefully — it drops users, roles, and databases (and
   any data/runtimes an attendee created under their own role, since dropping the role does not
   automatically drop *Openflow* runtimes they own — see note below).
3. Execute it.

**Runtime cleanup note**: dropping a user/role does not automatically terminate any Openflow
runtime that user's role owns. Before deprovisioning, either have the runtime integration
terminated (`ALTER OPENFLOW RUNTIME INTEGRATION ... TERMINATE` if using SQL, or via the UI:
Suspend then Terminate), or accept that a dangling runtime integration object may be left behind
tied to a dropped role — check `SHOW OPENFLOW RUNTIME INTEGRATIONS` / `SHOW INTEGRATIONS` after
deprovisioning and clean up manually if needed.

The shared layer (`OPENFLOW_ADMIN`, `OPENFLOW_SHARED` DB, the deployment, `SWTBER27_LAB_EAI`,
the account event table) is never touched by either template — it's only created/managed via
`admin_setup.sql`, run separately.

## Scaling from the 15-person pilot to the full event (~100-120 attendees)
1. Add more entries to `users.yml` (or generate a larger file — see the password-generation
   snippet used originally, in the render script's docstring/history, or write a small loop
   using Python's `secrets` module).
2. Re-render and execute `provision_users.sql` as above — same process, just more `{% for %}`
   iterations.
3. **Check the SPCS node quota before scaling past ~40-50 concurrent attendees.** Each attendee's
   runtime is 1 SMALL node (min=max=1). Snowflake's default quota is 50 nodes per node-size and
   500 total per account. At ~100-120 attendees each holding one runtime, you will hit the
   per-size default limit. Request a `SNOWSERVICES_NATIVE_COMPUTE_CLUSTER_BLOCK_STORAGE_QUOTA`
   increase from your account team well before the event — this is not something this template
   can provision for you.
4. Re-print/distribute the updated `users.yml` id/password pairs (physical slips of paper, per
   the original planning notes, or a generated CSV/handout).

## Known open items carried over from the build
- UC2 (Postgres CDC) and UC3 (Kafka/Redpanda) network rules are documented as commented
  templates in `admin_setup.sql` — fill in real hostnames once the Snowflake Postgres connection
  details and the Redpanda cluster are available, then `ALTER EXTERNAL ACCESS INTEGRATION
  SWTBER27_LAB_EAI SET ALLOWED_NETWORK_RULES = (...)` to add them without disrupting UC1.
- Manual UI smoke test (`smoke_test_checklist.md`, Part B) should be run by a human before the
  live event — it wasn't (and can't be) executed by this agent session.
- Attendee databases are empty by design (no pre-created tables) — attendees create their own
  destination table(s) as part of the lab exercise (see `attendee_runbook.md` Step 3).

## Shared privileges live in ONE place
All privileges common to every attendee (deployment `USAGE`, `CREATE OPENFLOW RUNTIME
INTEGRATION`, EAI `USAGE`, warehouse access, `OPENFLOW_SHARED` DB/schema `USAGE`, git repo
`READ`) are granted once to `SWTBER27_ATTENDEE_RL` in `admin_setup.sql`. Per-user roles only ever
get `GRANT ROLE SWTBER27_ATTENDEE_RL TO ROLE SWTBER27_<user>_RL` — never a direct grant. If you
need to add or remove a shared privilege later (e.g. a new EAI, a different warehouse), edit the
`SWTBER27_ATTENDEE_RL` block in `admin_setup.sql` once; it propagates to every attendee
immediately without touching `users.yml` or re-running the per-user template.

## Git repo credentials
The shared git repository authenticates via `OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS`, a
Snowflake `SECRET` (type `PASSWORD`, username + PAT) owned by `OPENFLOW_ADMIN`. Attendees never
see the secret — they only get `READ` on the git repository object itself via
`SWTBER27_ATTENDEE_RL`. If the PAT expires or the credentialed user changes, rotate it with:
```sql
USE ROLE OPENFLOW_ADMIN;
ALTER SECRET OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO_CREDS SET
  USERNAME = '<new_username>'
  PASSWORD = '<new_pat>';
ALTER GIT REPOSITORY OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO FETCH;
```
