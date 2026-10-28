---
name: ship
description: >-
  Commit and/or open a PR after verify — clear summary, evidence, merge-danger call.
  Use only when the user asks to commit or create a PR and verify has passed.
  Ship does not release. Audience delivery is the `release` skill.
disable-model-invocation: true
---

# Ship

## Preconditions

- `verify` passed (or waiver documented) and `artifacts/reviews/<slug>-verify.md` has an **Acceptance evidence** table
- User explicitly asked to commit and/or open a PR
- Run log includes discover (or waiver) — otherwise refuse “A→Z complete”

Ship does not release. Do not write “deployed” or “users have it” in the commit or PR. Point the user to `/release` when an audience should receive the build.

## Commit

Follow the user’s git safety rules:

1. `git status` / `git diff` / recent `git log` style
2. Stage relevant files (no secrets) — **include** `artifacts/**/*.md`
3. Commit with a concise why-focused message (HEREDOC)
4. Re-check `git status`

Do **not** push unless asked.

## PR

Follow the **`pr`** skill for body shape (summary, evidence, merge danger, test plan).

## After ship

1. Append **`run-log`** for ship.
2. Placeholder checklist (FE / content sites): remind owner to replace sample emails, lorem bio, fake prices before public launch — offer `wizard` if cutover steps are human-only.
3. Suggest `/release` if someone besides the branch should receive the build.
4. Suggest `retro` if the session hit harness friction. Suggest `handoff` if work continues elsewhere.
