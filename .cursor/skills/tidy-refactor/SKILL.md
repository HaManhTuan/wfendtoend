---
name: tidy-refactor
description: >-
  After a slice is green, perform naming/structural cleanup with tests staying green before the next ticket.
  Use at the end of implement slices; do not mix with new behavior.
---

# Tidy refactor

## Preconditions

- Tests for the current slice are green (`verify` or at least the slice suite).
- No open RED for new behavior.

## Allowed

- Rename for glossary alignment
- Extract deep modules at clear seams
- Remove duplication introduced in this slice
- Delete dead code you just created

## Forbidden

- New features / behavior changes
- Drive-by refactors in unrelated modules
- Expanding scope “while we’re here”

## Method

1. List tidy intents (3 bullets max).
2. Refactor in small steps; re-run tests after each.
3. Stop when the list is done or tests fail → fix back to green.
4. Note tidy in the ticket or `artifacts/reviews/<slug>.md`.
