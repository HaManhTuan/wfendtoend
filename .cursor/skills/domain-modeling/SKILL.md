---
name: domain-modeling
description: >-
  Build and sharpen the project's domain model: challenge terms, stress-test scenarios,
  update GLOSSARY.md and ADRs. Use during discover or whenever jargon drifts.
---

# Domain modeling

Shared language beats long prompts.

## When

- Mid-`discover` / `grill-me` when terms keep expanding into paragraphs
- User says a word three different ways
- Before naming modules/APIs in `write-plan`

## Loop

1. List candidate terms from chat + code.
2. For each term: one-sentence definition, examples, counter-examples.
3. Stress-test with edge scenarios (“what if X is cancelled mid-flow?”).
4. Update `GLOSSARY.md`.
5. If a hard decision is locked, write `docs/adr/NNNN-title.md` (see `templates/ADR.md`).

## Rules

- Prefer the glossary word in code (types, folders, tickets).
- Challenge synonyms; pick one canonical term.
- Do not invent domain fantasy the user did not confirm.
