---
name: ask-workflow
description: >-
  Router — ask which cursor-workflow skill or flow fits the situation.
  Use when the user is unsure how to start, or says "what should I run".
disable-model-invocation: true
---

# Ask workflow

Help the user pick **one** next skill **and Cursor slash**. Do not start implementing.

## Steps

1. Ask what they want (feature, bug, research, refactor, epic, teach, ship, harness).
2. Map to `AGENTS.md` router table.
3. Recommend the **slash** first (e.g. `/feature`), then the skill chain and artifact paths.
4. Remind them the agent must **grill** (or they must type `skip grill: …`) and append **`run-log`**.
5. Stop and wait for them to invoke the slash (or confirm you should run it).

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
