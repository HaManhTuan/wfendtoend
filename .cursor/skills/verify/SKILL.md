---
name: verify
description: >-
  Run project checks and map each acceptance criterion to evidence before claiming done.
  Use before ship or release, after implement, or whenever success is claimed.
---

# Verify

## Steps

1. Append **`run-log`** entry for verify.
2. Detect project scripts (`package.json`, `composer.json`, `Makefile`, `pyproject.toml`, CI workflows, etc.).
3. Run the smallest honest suite that proves the claim:
   - unit/integration tests (if present)
   - typecheck / lint (if present)
   - build (if relevant)
4. **UI / FE pages (optional but recommended):** if `agent-browser` is installed, run a short smoke (open URL, snapshot, confirm brand/CTA visible). If not installed, note “browser smoke skipped” in the verify artifact — do not pretend you looked.
5. Write `artifacts/reviews/<slug>-verify.md` from `templates/VERIFY.md`:
   - command, exit code, key excerpt
   - commit SHA (`git rev-parse HEAD`)
   - **Acceptance evidence:** one row per acceptance criterion or ticket **Done when**. If the spec has none, one row saying so.
   - **Sensitive surface:** `none`, or a threat-note path, a security-audit report path, or a named waiver. Auth, PII, payment, upload, multi-tenant, and public API are sensitive.
   - **CI:** if a workflow file exists, cite a green run or write “local pre-check only.” If no workflow exists, write `absent`. Never claim CI passed from a local exit code.

## Pass criteria

- Exit code 0 for required checks, **or** a documented waiver (reason, who approved, timestamp).
- The acceptance table is filled. A green suite with no row tied to the spec is not a pass.

## Fail

Return to `implement` / `diagnose`. Do not redefine success.

## Integration verify

When the change was merged from worktrees, run this skill on the **integration** tree. A green worktree does not count.
