---
name: to-questionnaire
description: >-
  Turn a decision you cannot answer alone into a Markdown questionnaire for the person who can.
  Grill about the send (audience, needed answers), not the subject. Use for async stakeholder input.
disable-model-invocation: true
---

# To questionnaire

## Steps

1. Grill briefly: who is the audience, what decision this unlocks, deadline, format.
2. Write `artifacts/research/<slug>-questionnaire.md` from `templates/QUESTIONNAIRE.md`.
3. Questions must be answerable without reading the whole codebase.
4. Include how answers will be consumed (which SPEC/plan section).

## Rules

- Do not interview the subject matter in place of the stakeholder.
- Prefer multiple choice + short free-text over essays.
- After answers return → fill the template’s **Fold-back** table, then update `discover` / `lock-scope`.
