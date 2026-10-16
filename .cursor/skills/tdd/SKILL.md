---
name: tdd
description: >-
  Red-green-refactor loop for features and bugfixes — write a failing check first.
  Use during implement for any behavior change; skip only for pure docs/config.
---

# TDD

Write the check first. Watch it fail. Write minimal code to pass. Refactor with tests green.

## Cycle

### RED

1. Pick one vertical slice from the plan/ticket.
2. Write the smallest failing test (or agreed failing check in the plan).
3. Run it — confirm **failure for the right reason**.

### GREEN

4. Write the **minimal** production code to pass.
5. Run tests — green.
6. No extra features.

### REFACTOR

7. Clean names/structure; keep tests green.
8. Commit slice if the user wants incremental commits.

## Good tests

- Behavior at a **seam** (public API, use-case, UI contract)
- Deterministic, fast, clear failure message
- One reason to fail

## Bad tests

- Coupled to private internals without need
- Flaky time/network without fakes
- Asserting implementation details instead of outcomes

## Bugfixes

Prefer: failing regression test (RED) → fix (GREEN) → refactor.
For hard bugs, run `diagnose` before GREEN.
