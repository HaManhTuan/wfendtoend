---
name: implement-spec
description: >-
  Implement a whole SPEC on one integration branch using the ticket graph; run implementers on the
  ready frontier (parallel when safe), then dual-review. Use for multi-ticket specs.
disable-model-invocation: true
---

# Implement spec

For a full SPEC with a ticket graph — not a single tiny ticket.

## Preconditions

- Approved SPEC + `artifacts/tickets/<slug>.md` with blocking edges

## Loop

1. Create/use integration branch `feat/<slug>`.
2. Compute **ready frontier** (tickets with all blockers done).
3. For each ready ticket:
   - Serial: run `implement` + `tdd` (+ `tidy-refactor`)
   - Parallel-safe: `parallel-worktrees` then merge winners into integration
4. Recompute frontier until all tickets done or blocked.
5. Close with `dual-review` → `verify` → optional `ship`.

## Rules

- Never start a ticket still blocked.
- File conflicts → serialize those tickets.
- Keep the tickets file status in sync (`todo|doing|done`).
