---
name: to-tickets
description: >-
  Break a plan/SPEC into tracer-bullet tickets with blocking edges (task graph).
  Use after write-plan, before implement or parallel-worktrees.
disable-model-invocation: true
---

# To tickets

Read `artifacts/plans/<slug>.md`. Write `artifacts/tickets/<slug>.md` from `templates/TICKETS.md`.

## Ticket shape

Each ticket:

- **ID** — `T1`, `T2`, …
- **Kind** — `behavior` | `migration` | `contract` | `observability` | `chore`
- **Title** — verb + outcome
- **Goal** — one paragraph
- **Done when** — testable acceptance
- **Files** — likely touch list
- **Blocks** / **Blocked by** — edges for the graph
- **Parallel?** — yes/no (safe for worktree race)

## Rules

- Prefer **tracer bullets**: end-to-end thin slices over horizontal layers alone.
- Keep tickets small enough for one focused session.
- When schema or a public API changes, add `migration` and/or `contract` tickets and block behavior on them.
- A critical path that can fail in production gets an `observability` ticket (health, or one log/metric) unless the user waives it.
- Mark the **ready frontier** (no blockers) for `implement` / `parallel-worktrees`.

## Optional publish

If `docs/agents/issue-tracker.md` exists, follow it to create GitHub/GitLab/local issues. Otherwise keep the markdown file as source of truth.
