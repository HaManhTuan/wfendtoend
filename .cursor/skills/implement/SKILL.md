---
name: implement
description: >-
  Build from PLAN/tickets using TDD at agreed seams; close with dual-review before commit.
  Use when artifacts exist and the user wants execution.
disable-model-invocation: true
---

# Implement

## Preconditions

- Approved SPEC (or explicit user override)
- `artifacts/plans/<slug>.md` and/or `artifacts/tickets/<slug>.md`

If missing → stop and run `discover` / `write-plan` / `to-tickets`.

## Loop

For each ready ticket (or plan step):

1. State the slice and **Done when**.
2. Invoke **`tdd`** for behavior changes.
3. Keep the diff scoped to that slice; use `codebase-design` at seams.
4. When green, optional **`tidy-refactor`** before the next ticket.
5. Mark the ticket checkbox done in the tickets file.
6. If blockers appear, update the graph; do not silently expand scope.
7. Multi-ticket SPEC → prefer **`implement-spec`**.

## Concurrency

Independent ready tickets → optional `parallel-worktrees` (one role/ticket per worktree).

## Close-out

1. Run **`dual-review`** (Standards ‖ Spec).
2. Run **`verify`**.
3. Only then **`ship`** (commit/PR) if the user asked.

## Do not

- Start unrelated refactors mid-ticket (park in “Later”).
- Claim done without verify evidence.
