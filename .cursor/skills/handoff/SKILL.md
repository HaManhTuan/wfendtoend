---
name: handoff
description: >-
  Compact the current conversation into a handoff document so another agent or session can continue.
  Use at context limits, end of day, or when switching assignees.
disable-model-invocation: true
---

# Handoff

## Steps

1. Read open artifacts for the active slug (spec/plan/tickets/review).
2. Write `artifacts/handoffs/<slug>.md` from `templates/HANDOFF.md`.
3. Include: goal, done, not done, exact next action, branch/SHA, pitfalls.
4. Confirm the next agent should start by reading that file + `AGENTS.md`.

## Do not

- Dump the entire chat verbatim.
- Leave “continue somehow” as the next step — make it executable.
