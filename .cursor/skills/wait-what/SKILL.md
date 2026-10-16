---
name: wait-what
description: >-
  Fire when a message did not land — re-pitch in plain English using GLOSSARY vocabulary and
  the missing context. Use when the user is confused or says "wait what".
disable-model-invocation: true
---

# Wait what

## Steps

1. Identify what failed to land (term, decision, plan step, diff intent).
2. Re-explain in plain language, **using `GLOSSARY.md` terms**.
3. Add only the missing context (why it matters, what changes for them).
4. Offer one check question: “Does this match what you meant?”

## Do not

- Dump a longer version of the same jargon wall.
- Start implementing while clarifying.
