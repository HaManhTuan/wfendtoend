# Verify: Delivery gates

- **Slug:** `delivery-gates`
- **SHA:** recorded after commit
- **Status:** pass

## Commands

| Command | Exit | Excerpt |
|---------|------|---------|
| `bash scripts/check-kit.sh` | 0 | `check-kit: ok` |

## Acceptance evidence

| AC / Done when | Evidence | Result |
|----------------|----------|--------|
| Glossary defines Ship, Release, Acceptance evidence, Sensitive surface, Integration verify | `check-kit.sh` greps `GLOSSARY.md` | pass |
| Verify writes acceptance, sensitive surface, CI | skill + `templates/VERIFY.md` | pass |
| Release skill, command, template with rollback | `.cursor/skills/release`, `.cursor/commands/release.md`, `templates/RELEASE.md` | pass |
| Ship says it does not release | `check-kit.sh` greps ship skill | pass |
| Ticket kind field | `templates/TICKETS.md` | pass |
| Integration verify after worktree merge | `parallel-worktrees` skill | pass |
| Greenfield → wayfinder when multi-milestone | `.cursor/commands/greenfield.md` | pass |
| Retro asks if success metric moved | `retro` skill | pass |
| Router pipeline is verify → ship → release | `AGENTS.md` | pass |

## Sensitive surface

none

## CI

absent

## Waivers

| Check | Reason | Approver | When |
|-------|--------|----------|------|
| CI | Kit has no workflow file | implementer, user asked to ship the harness | 2026-10-28 |
