---
name: ship
description: >-
  Commit and/or open a PR after verify — clear summary, evidence, merge-danger call.
  Use only when the user asks to commit or create a PR and verify has passed.
disable-model-invocation: true
---

# Ship

## Preconditions

- `verify` passed (or waiver documented)
- User explicitly asked to commit and/or open a PR

## Commit

Follow the user’s git safety rules:

1. `git status` / `git diff` / recent `git log` style
2. Stage relevant files (no secrets)
3. Commit with a concise why-focused message (HEREDOC)
4. Re-check `git status`

Do **not** push unless asked.

## PR

Follow the **`pr`** skill for body shape (summary, evidence, merge danger, test plan).

## After ship

Suggest `retro` if the session hit harness friction. Suggest `handoff` if work continues in another session.
