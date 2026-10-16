---
name: discover
description: >-
  Grill the user about intent/design before coding; produce research notes and a SPEC.
  Use for any new feature, product idea, or non-trivial behavior change.
disable-model-invocation: true
---

# Discover (grill → SPEC)

Misalignment is the #1 failure mode. Interview until the design tree is resolved, then write artifacts.

## Rules

- Ask **one** clarifying question per turn (unless the user pastes a full brief) — use `grilling`.
- Record answers in `artifacts/research/<slug>.md` as you go.
- Do **not** write production code.
- When terms sprawl, invoke `domain-modeling`.
- If the uncertainty is design-shaped, offer `prototype` before locking SPEC.
- If chat already resolved everything, prefer `to-spec` instead of re-interviewing.

## Interview coverage

Cover until each branch is decided or explicitly deferred:

1. Problem / user / success metric
2. Happy path + top failure modes
3. In scope / out of scope
4. Constraints (stack, time, compatibility, security)
5. Data model / seams / APIs touched
6. UX / API contracts if relevant
7. Test / verification approach at high level

## Outputs (required)

1. `artifacts/research/<slug>.md` — Q&A, sources, assumptions
2. `artifacts/specs/<slug>.md` — from `templates/SPEC.md`

Only after open questions are resolved (or accepted as assumptions), ask the user to approve the SPEC, then point them to `lock-scope`.

## Optional

If the source is an authorized app/binary/website, run `evidence-research` first and cite findings in the research file.
