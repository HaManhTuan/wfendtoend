---
name: grill-me
description: >-
  Relentlessly interview the user about a plan, decision, or idea until every design branch is resolved.
  Use for non-code decisions or when discover is too heavy; pairs with grilling primitive.
disable-model-invocation: true
---

# Grill me

## Rules

- Ask **one** question per turn.
- Prefer questions that close a branch of the decision tree.
- Record answers in `artifacts/research/<slug>.md`.
- Invoke `domain-modeling` when terms sprawl.
- Stop when branches are resolved or explicitly deferred as assumptions.

## After

- If building software → offer `to-spec` or continue `discover`.
- If only a decision → write the decision + ADR if warranted.
