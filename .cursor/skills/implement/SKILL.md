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
- `artifacts/research/<slug>.md` contains a **Q&A log** or **Waiver** section
- `artifacts/reviews/<slug>-run-log.md` has a discover / grill-me / to-spec entry (or waiver entry)

If research/run-log gate fails → **stop**. Tell the user to run `/feature` (discover) or type an explicit `skip grill: …` waiver. Do not invent Q&A after the fact.

If plan/tickets missing → stop and run `write-plan` / `to-tickets`.

## Entry

Append **`run-log`**: skill `implement`, Cursor command if any.

## Loop

For each ready ticket (or plan step):

1. State the slice and **Done when**.
2. Invoke **`tdd`** for behavior changes (see `tdd` for static-FE alternative checks).
3. Keep the diff scoped to that slice; use `codebase-design` at seams.
4. When green, optional **`tidy-refactor`** before the next ticket.
5. Mark the ticket checkbox done in the tickets file.
6. If the slice needs work outside the approved SPEC, stop. Append a row to the SPEC **Amendments** table and wait for approval. Do not silently expand scope.
7. Multi-ticket SPEC → prefer **`implement-spec`**.

## Concurrency

Independent ready tickets → optional `parallel-worktrees` (one role/ticket per worktree).

## Close-out

1. Run **`dual-review`** (Standards ‖ Spec).
2. Run **`verify`** (on the integration tree if worktrees were merged).
3. Only then **`ship`** (commit/PR) if the user asked. Ship does not release.
4. **`release`** only when the user wants an audience beyond the branch.
5. Append run-log outcomes for review / verify / ship / release.

## Do not

- Start unrelated refactors mid-ticket (park in “Later”).
- Claim done without verify evidence.
- Claim “A→Z complete” without a discover/waiver row in the run log.
