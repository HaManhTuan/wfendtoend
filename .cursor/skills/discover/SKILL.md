---
name: discover
description: >-
  Grill the user about intent/design before coding; produce research notes and a SPEC.
  Use for any new feature, product idea, or non-trivial behavior change.
disable-model-invocation: true
---

# Discover (grill → SPEC)

Misalignment is the #1 failure mode. Interview until the design tree is resolved, then write artifacts.

## Entry

1. Append a row via **`run-log`** (`Cursor command:` `/feature` or `/greenfield` when that started the work).
2. Propose a kebab-case `<slug>` if missing.

## Rules

- Ask **one** clarifying question per turn (unless the user pastes a full brief) — use `grilling`.
- Record **every** answer under a **Q&A log** in `artifacts/research/<slug>.md`.
- Do **not** write production code.
- When terms sprawl, invoke `domain-modeling`.
- If the uncertainty is design-shaped, offer `prototype` before locking SPEC.
- If chat already resolved everything, prefer `to-spec` (still require a Q&A or “Confirmed from chat” section with bullet facts).

## Waiver (only path to skip grilling)

User must say explicitly, e.g. `skip grill: use assumptions in research` **and** list what may be assumed.

Then in research file:

```markdown
## Waiver
- User: skip grill …
- Assumptions accepted: …
```

Log the waiver in **`run-log`**. Silent assumption-filling is **forbidden**.

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

1. `artifacts/research/<slug>.md` — must include **Q&A log** _or_ **Waiver**
2. `artifacts/specs/<slug>.md` — from `templates/SPEC.md`
3. Run-log entries for discover start + SPEC ready

Only after open questions are resolved (or waived), ask the user to approve the SPEC, then point them to `lock-scope`.

## Optional

If the source is an authorized app/binary/website, run `evidence-research` first and cite findings in the research file.
