# Scope: delivery-gates

## In scope

- Split ship and release in skills, commands, rules, glossary, README.
- Acceptance evidence inside verify.
- Conditional sensitive-surface gate.
- Ticket kinds, integration verify, greenfield → wayfinder, retro metric note.
- `scripts/check-kit.sh` as the kit’s own check.

## Out of scope

- Implementing deploys, feature-flag products, or CI providers.
- Copying external skills into `.cursor/skills/`.

## Assumptions (accepted)

- Chat confirmation on 2026-10-28 is the approval to implement.
- Existing install script copies new skill and template files without a code change.

## Open risks

- Projects that already installed the kit need a reinstall or `--force` to pick up new files. Document that.

## Non-goals this iteration

- Estimating, SLO dashboards, incident process.
