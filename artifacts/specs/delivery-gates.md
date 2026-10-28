# SPEC: Delivery gates

- **Slug:** `delivery-gates`
- **Status:** approved
- **Date:** 2026-10-28

## Problem

Agents treat `ship` as “users have it.” Verify can pass on an empty check suite. Security, migrations, and post-merge integration are mentions, not gates.

## Users / stakeholders

Developers who install this kit with `scripts/install-to-project.sh` and follow `/feature` or `/greenfield`.

## Success looks like

A cold agent can tell git delivery from audience delivery, and cannot mark verify passed without an acceptance map.

## Functional requirements

1. Glossary defines Ship, Release, Acceptance evidence, Sensitive surface, Integration verify.
2. `verify` writes `artifacts/reviews/<slug>-verify.md` with commands, acceptance evidence, sensitive-surface gate, and CI status.
3. New `release` skill and `/release` command write `artifacts/reviews/<slug>-release.md` with audience, changelog, migration, flag, rollback, and owner.
4. `ship` states that it does not release.
5. Ticket template has **Kind** and an order hint when migration or contract tickets exist.
6. `parallel-worktrees` requires integration verify after the winner is merged.
7. `/greenfield` sends multi-milestone work to `wayfinder` before one plan.
8. `retro` asks whether the SPEC success metric moved.
9. Router, always-on rules, and README use the same pipeline: verify → ship → release.

## Non-functional requirements

- Skills stay short and imperative (`writing-for-agents`).
- No new runtime dependency.
- Installer already copies `.cursor` and `templates/`; new files must live there.

## Constraints

- Do not vendor Ponytail or security-audit into the kit.
- Do not deploy from `release` unless the user asks and the project already has a command.

## In scope

Harness markdown, one kit check script, glossary, README, router.

## Out of scope

- A universal deploy implementation.
- Re-grilling product requirements for apps that use the kit.

## Assumptions

- “Release for devs” means this kit change is committed and documented so `install-to-project.sh` carries it.

## Open questions

None for this slice.

## Verification approach (high level)

`scripts/check-kit.sh` exits 0 when the required phrases and files exist.

## Sensitive surface

none
