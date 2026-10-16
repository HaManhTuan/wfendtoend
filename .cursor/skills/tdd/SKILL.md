---
name: tdd
description: >-
  Red-green-refactor loop for features and bugfixes — write a failing check first.
  Use during implement for any behavior change; static sites may use build/browser checks.
---

# TDD

Write the check first. Watch it fail. Write minimal code to pass. Refactor with tests green.

## Choose a feedback loop

| Project kind | RED check |
|--------------|-----------|
| App with test runner | Failing unit/integration test |
| API / domain logic | Failing test at a seam |
| **Static FE / content site** (HTML/CSS, little logic) | Failing **build** or a tiny **smoke assertion** (e.g. page must contain brand selector / landmark). Optional: browser smoke via `agent-browser` if installed |
| Pure docs/config | Skip TDD; still verify somehow |

Do **not** invent a fake Jest suite for a one-page static site. Do **not** skip all checks either — always have something that goes red then green.

## Cycle (default)

### RED

1. Pick one vertical slice from the plan/ticket.
2. Write the smallest failing check.
3. Run it — confirm **failure for the right reason**.

### GREEN

4. Write the **minimal** production code to pass.
5. Run checks — green.
6. No extra features.

### REFACTOR

7. Clean names/structure; keep checks green.

## Good checks

- Behavior at a **seam** (public API, use-case, UI contract)
- Deterministic, fast, clear failure message

## Bad checks

- Coupled to private internals without need
- Flaky time/network without fakes
- Asserting implementation details instead of outcomes

## Bugfixes

Prefer: failing regression check (RED) → fix (GREEN) → refactor.  
For hard bugs, run `diagnose` before GREEN.
