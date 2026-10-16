---
name: triage
description: >-
  Move issues through a triage state machine using project labels from docs/agents/issue-tracker.md.
  Use when processing an inbox of bugs/ideas before discover or implement.
disable-model-invocation: true
---

# Triage

## Setup

Read `docs/agents/issue-tracker.md` for tracker type and labels. If missing → run `setup-project` section for tracker notes first.

## States (default)

`needs-triage` → `ready` | `blocked` | `needs-discover` | `wontfix`

## Per issue

1. Restate the problem in one line.
2. Classify: bug / feature / chore / question.
3. Apply label + short rationale.
4. If `ready` and small → may go to `implement` with a micro-plan.
5. If ambiguous → `needs-discover` / `grill-me`.
6. If waiting on external → `blocked` + blocker note.

## Output

Update the tracker (gh/glab/local file). Summarize batch results for the user.
