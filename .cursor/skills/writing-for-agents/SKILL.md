---
name: writing-for-agents
description: >-
  Discipline for writing documents agents will follow — skills, AGENTS.md, rules, pointed docs.
  Use when authoring or editing harness files in this kit or a project.
---

# Writing for agents

## Principles

1. **Trigger-rich description** — frontmatter `description` says *when* to use the skill.
2. **One job per skill** — orchestrators vs primitives; don’t mix.
3. **Imperative steps** — numbered, checkable, with artifact paths.
4. **Pointers over essays** — link templates; keep SKILL.md short.
5. **Iron laws upfront** — non-negotiables before nuance.
6. **No chat-only outputs** — require on-disk artifacts when state matters.
7. **User- vs model-invoked** — set `disable-model-invocation: true` for orchestrators.

## Checklist before merge

- [ ] Would a cold agent know the next file to write?
- [ ] Conflicts with `AGENTS.md` router resolved?
- [ ] Examples of when *not* to use it?
