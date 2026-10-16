---
name: verify
description: >-
  Run project checks and record evidence before claiming done — tests, lint, types, build,
  optional browser smoke for UI. Use before ship, after implement, or whenever success is claimed.
---

# Verify

## Steps

1. Append **`run-log`** entry for verify.
2. Detect project scripts (`package.json`, `composer.json`, `Makefile`, `pyproject.toml`, etc.).
3. Run the smallest honest suite that proves the claim:
   - unit/integration tests (if present)
   - typecheck / lint (if present)
   - build (if relevant)
4. **UI / FE pages (optional but recommended):** if `agent-browser` is installed, run a short smoke (open URL, snapshot, confirm brand/CTA visible). If not installed, note “browser smoke skipped” in the verify artifact — do not pretend you looked.
5. Record in chat **and** `artifacts/reviews/<slug>-verify.md`:
   - command
   - exit code
   - key excerpt
   - commit SHA (`git rev-parse HEAD`)

## Pass criteria

- Exit code 0 for required checks, **or**
- Documented waiver (reason, who approved, timestamp)

## Fail

Return to `implement` / `diagnose`. Do not redefine success.
