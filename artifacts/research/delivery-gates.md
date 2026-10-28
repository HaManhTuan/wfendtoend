# Research: delivery-gates

## Confirmed from chat

User ordered a plan and immediate implementation of the workflow upgrade, then a release developers can install. Decisions taken from the PM review in this chat:

- **Ship** stays commit and/or pull request.
- **Release** is a separate gate for putting a build in front of an audience.
- **Verify** maps each acceptance criterion to evidence or a named waiver.
- **Sensitive surface** (auth, PII, payment, upload, multi-tenant, public API) needs a threat note, a security-audit report path, or a waiver before release.
- Tickets gain a **kind**: behavior, migration, contract, observability, chore.
- Local verify does not claim CI is green. Cite a run, or record that CI is absent.
- After a worktree merge, verify again on the integration tree.
- `/greenfield` with more than one milestone or unresolved product decisions goes to `wayfinder` before one giant plan.
- `retro` records whether the SPEC success metric moved.

## Waiver

No extra grill. The user said to plan and execute this upgrade now.

## Out of this change

- Ponytail and security-audit stay outside the core kit.
- This change does not add a deploy script for arbitrary stacks.
