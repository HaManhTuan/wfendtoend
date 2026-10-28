---
name: run-log
description: >-
  Append an auditable step to artifacts/reviews/<slug>-run-log.md — Cursor slash, skill name,
  outcome. Use at the start/end of every pipeline phase so humans can see what ran.
---

# Run log

Without a run log, agents “do the work” invisibly and users cannot tell `/feature` from freestyle edits.

## When

- Start of each user-invoked skill in the feature pipeline
- After each phase gate (SPEC approved, plan approved, verify done, ship)

## File

`artifacts/reviews/<slug>-run-log.md` — create from `templates/RUN-LOG.md` if missing.

## Each entry (append)

Use the block in `templates/RUN-LOG.md`. Also update that phase’s row in the status table. The table is the index. Entries are the audit trail.

```markdown
### <ISO time> — <phase>
- **Cursor command:** `/feature` | `/greenfield` | `/ask` | _(none — say why)_
- **Skill:** `discover`
- **Outcome:** …
- **Artifacts:** `artifacts/…`
```

## Rules

1. Prefer a real Cursor slash (`/feature`, `/greenfield`, …) as the entry point. If the user did not type one, write `Cursor command: _(implicit — user said “…”)_` and still log the skill.
2. Never delete prior entries; only append. Status rows may change in place.
3. `implement` / `ship` must refuse to claim “A→Z complete” if the run log has no `discover` (or `grill-me` / `to-spec`) row **unless** a waiver row exists.
