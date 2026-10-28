# Handoff: <title>

- **Slug:** `<slug>`
- **From session:** `<who or which agent>`
- **Date:** `<YYYY-MM-DD>`
- **Branch:** `<name>`
- **SHA:** `<git rev-parse --short HEAD>`

The next agent starts with this file and `AGENTS.md`. The next action is one command or one skill, not “continue somehow”.

## Goal

`<The user outcome this work is still chasing. One paragraph.>`

## Done

- `<finished slice, with the artifact or SHA that proves it>`

## Not done

- `<ticket or decision still open, and why it stopped>`

## Artifacts

| Kind | Path | Status |
|------|------|--------|
| Research | `artifacts/research/<slug>.md` | `<missing / draft / has Q&A or waiver>` |
| Spec | `artifacts/specs/<slug>.md` | `<draft / approved>` |
| Plan | `artifacts/plans/<slug>.md` | `<draft / approved / missing>` |
| Tickets | `artifacts/tickets/<slug>.md` | `<ready frontier: …>` |
| Verify | `artifacts/reviews/<slug>-verify.md` | `<missing / pass / fail>` |
| Release | `artifacts/reviews/<slug>-release.md` | `<missing / draft / released>` |

## Commands already run

| Command | Exit | What it proved |
|---------|------|----------------|
| `<command>` | `<code>` | `<one line>` |

## Decisions the next agent must not reopen

- `<decision — where it is written>`

## Open blockers

- `<none, or fact / access / approval still required>`

## Next concrete action

1. `<Read this path.>`
2. `<Run this skill or this command.>`
3. `<Stop condition: what “done for this sitting” means.>`

## Pitfalls

- `<trap: a file that looks authoritative but is stale, a failing test that is environmental, a word that does not mean what it sounds like>`

## Do not

- Dump the chat into this file.
- Start a new slice while a blocker above is open.
- Call ship a release.
