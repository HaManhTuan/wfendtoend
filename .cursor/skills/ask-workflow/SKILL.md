---
name: ask-workflow
description: >-
  Router — ask which cursor-workflow skill or flow fits the situation.
  Use when the user is unsure how to start, or says "what should I run".
disable-model-invocation: true
---

# Ask workflow

Help the user pick **one** next skill. Do not start implementing.

## Steps

1. Ask what they want (feature, bug, research, refactor, epic, teach, ship, harness).
2. Map to `AGENTS.md` router table.
3. Recommend the **single** next skill and the expected artifact path.
4. Stop and wait for them to invoke it (or confirm you should run it).

## Examples

| User intent | Suggest |
|-------------|---------|
| Vague product idea | `discover` |
| Already grilled in chat | `to-spec` |
| Ticket clear, build | `implement` (need plan/tickets) |
| Whole SPEC multi-ticket | `implement-spec` |
| Flaky login | `diagnose` |
| Three approaches race | `parallel-worktrees` |
| Epic / many unknowns | `wayfinder` |
| UI direction unclear | `prototype` |
| Inbox grooming | `triage` |
| Jargon mess | `domain-modeling` |
| Copy how an app works (authorized) | `evidence-research` |
| Confused | `wait-what` |
| End of day | `handoff` |
| Writing a new skill | `writing-for-agents` |
