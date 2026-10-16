---
name: verify
description: >-
  Run project checks and record evidence before claiming done — tests, lint, types, build.
  Use before ship, after implement, or whenever success is about to be claimed.
---

# Verify

## Steps

1. Detect project scripts (`package.json`, `composer.json`, `Makefile`, `pyproject.toml`, etc.).
2. Run the smallest honest suite that proves the claim:
   - unit/integration tests
   - typecheck / lint (if present)
   - build (if relevant)
3. Record in chat **and** optionally `artifacts/reviews/<slug>-verify.md`:
   - command
   - exit code
   - key excerpt
   - commit SHA (`git rev-parse HEAD`)

## Pass criteria

- Exit code 0 for required checks, **or**
- Documented waiver (reason, who approved, timestamp)

## Fail

Return to `implement` / `diagnose`. Do not redefine success.
