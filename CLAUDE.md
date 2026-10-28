# Claude Code

<!-- Claude Code strips this comment. Cursor keeps using AGENTS.md. Do not copy the router into this file. -->

This repo uses cursor-workflow. Follow the imported router. Do not invent a second process.

@AGENTS.md

@.cursor/rules/00-workflow.mdc

@.cursor/rules/10-artifacts.mdc

@.cursor/rules/20-verification.mdc

@.cursor/rules/30-domain-language.mdc

@.cursor/rules/40-slices-tdd.mdc

@.cursor/rules/50-architecture.mdc

@.cursor/rules/60-context-handoff.mdc

@.cursor/rules/70-authorization-research.mdc

@.cursor/rules/80-parallel-isolation.mdc

## Terminal

Skills in `.claude/skills/` are the same files as `.cursor/skills/`. A slash that names a skill (`/release`, `/teach`, `/handoff`, `/wayfinder`, `/prototype`, `/triage`) loads that skill. Entry commands that are not skills live in `.claude/commands/`: `/feature`, `/greenfield`, `/bug`, `/ask`, `/architecture`.

`/feature` and `/greenfield` still grill before code. Ship is git. Release is the audience.
