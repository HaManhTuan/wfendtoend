---
name: parallel-worktrees
description: >-
  Orca-lite: run multiple agent roles in isolated git worktrees; compare and merge the winner.
  Use for independent tickets or racing approaches on the same task.
disable-model-invocation: true
---

# Parallel worktrees

One agent → one worktree → one branch. Never share a dirty working tree.

## When

- Ready tickets with **no mutual file conflicts**, or
- Race 2–3 approaches on the **same** prompt (pick winner)

## Setup

Use `scripts/new-worktree.sh` or:

```bash
git fetch origin
git worktree add -b feat/<slug>-a ../<repo>-wt-a HEAD
git worktree add -b feat/<slug>-b ../<repo>-wt-b HEAD
```

## Role prompts (example)

| Worktree | Role | Prompt focus |
|----------|------|----------------|
| A | Implementer | Ticket T1 production code + TDD |
| B | Tests | Ticket T1 tests / edge cases only |
| C | Reviewer | Read-only review of A’s branch (or alternate impl) |

Paste the **same SPEC excerpt + ticket** into each. Point each agent at this kit’s `AGENTS.md`.

## Compare

1. Diff each branch vs base.
2. Run verify in each worktree.
3. Human (or lead agent) picks winner / cherry-picks.
4. Delete losing worktrees: `git worktree remove …`

## Rules

- Integration branch owns the merge.
- Document choice in `artifacts/reviews/<slug>-race.md`.
- If file overlap is high, **serialize** instead of parallelizing.
