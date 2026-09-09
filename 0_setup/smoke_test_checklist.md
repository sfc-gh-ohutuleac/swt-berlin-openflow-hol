# Smoke Test Checklist

## Part A — SQL layer (verified programmatically, 2026-08-31, re-verified 2026-09-01 after RBAC refactor)
- [x] All 15 `SWTBER27_USER<N>` databases exist (empty - no pre-created tables; attendees build
      their own destination table(s) as part of the exercise).
- [x] All 15 `SWTBER27_USER<N>_RL` roles hold ONLY `OWNERSHIP` on their own DB directly, plus
      `GRANT ROLE SWTBER27_ATTENDEE_RL` - no Openflow/warehouse privilege is granted per-user.
- [x] `SWTBER27_ATTENDEE_RL` (the single shared role) holds: USAGE on the deployment integration,
      `CREATE OPENFLOW RUNTIME INTEGRATION ON ACCOUNT`, USAGE on `SWTBER27_LAB_EAI`, USAGE+OPERATE
      on `COMPUTE_WH`, USAGE on `OPENFLOW_SHARED` DB + `INFRA`/`GIT` schemas, READ on the git repo.
- [x] All 15 users created with `DEFAULT_ROLE` set correctly, `DEFAULT_SECONDARY_ROLES=('ALL')`,
      `MUST_CHANGE_PASSWORD=TRUE`.
- [x] Account-level event table active (`SHOW PARAMETERS LIKE 'EVENT_TABLE' IN ACCOUNT`).
- [x] Shared EAI/network rule exist and reference `dummyjson.com:443`.
- [x] Shared git repository (`OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO`) authenticates via the
      `SWT_BERLIN_HOL_REPO_CREDS` secret and lists files correctly.
- [x] Existing deployment + your manual test runtime untouched.

## Part B — UI self-service flow (requires a real human login — do this before the event)
This part cannot be automated or verified from an agent session; it needs an actual Snowsight
login as a pilot user. Recommended: do this yourself as `SWTBER27_USER01` (or hand it to a
colleague) as a full dry run of `attendee_runbook.md`.

- [ ] Log in as `SWTBER27_USER01`, change password, confirm active role is `SWTBER27_USER01_RL`.
- [ ] Ingestion » Openflow shows the shared deployment (visible via inherited USAGE from
      `SWTBER27_ATTENDEE_RL`).
- [ ] Create a runtime: SMALL, min/max 1/1, execute-as role `SWTBER27_USER01_RL`, EAI
      `SWTBER27_LAB_EAI`. Confirm it reaches `Active`. (This confirms the role hierarchy — USAGE
      on the deployment and `CREATE OPENFLOW RUNTIME INTEGRATION` are inherited, not granted
      directly — actually works end to end, not just in `SHOW GRANTS` output.)
- [ ] Create your own destination table in `SWTBER27_USER01.PUBLIC` before wiring the write step.
- [ ] Open the canvas, build or import the UC1 flow per `attendee_runbook.md`.
- [ ] Run once; confirm no bulletins (especially no `UnknownHostException`).
- [ ] `SELECT COUNT(*) FROM SWTBER27_USER01.PUBLIC.<your_table>;` → 30.
- [ ] As a different user (e.g. `SWTBER27_USER02`), confirm you can **not** see `SWTBER27_USER01`'s
      database, role, or runtime — isolation check.
- [ ] Query `OPENFLOW_SHARED.INFRA.OPENFLOW_EVENTS` as `SWTBER27_USER01_RL` and confirm rows for
      your own runtime appear (validates event table access via the inherited role).
- [ ] `LS @OPENFLOW_SHARED.GIT.SWT_BERLIN_HOL_REPO/branches/main/1_rest_api;` as
      `SWTBER27_USER01_RL` and confirm the file listing works (validates git repo READ access via
      the inherited role, without exposing the credentials secret).

If any step in Part B fails, check `attendee_runbook.md`'s Troubleshooting section first.
