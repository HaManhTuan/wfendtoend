---
name: retro
description: >-
  After a session, suggest harness improvements (rules, skills, checks, docs) most severe first.
  Use when wrapping up or when the agent repeatedly stumbled.
disable-model-invocation: true
---

# Retro

Improve the **agent environment**, not only the product code.

## Collect

- Did the SPEC **success** metric move? Write yes, no, or not measured. Do this before harness nits.
- Where did the agent guess wrong?
- Missing tests/scripts that would have caught issues earlier?
- Ambiguous glossary terms?
- Rules too long / missing / conflicting?

## Output

Prioritized list (blocker → nice-to-have):

1. Change to propose (file path)
2. Why (failure mode observed)
3. Suggested patch sketch

Ask before editing the kit or project harness files.
