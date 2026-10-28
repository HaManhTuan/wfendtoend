---
name: to-spec
description: >-
  Turn the current conversation into a formal SPEC without a new interview — synthesize what was
  already discussed. Use after grilling when enough is known; prefer discover when still vague.
disable-model-invocation: true
---

# To spec

## When

- Grill/`discover` Q&A already happened in this chat, **or**
- User pasted a solid brief and wants it formalized

## When not

- Still vague → `discover` / `grill-me` first

## Steps

1. Read chat + any research notes.
2. Write `artifacts/specs/<slug>.md` from `templates/SPEC.md`. One seam uses profile `one-seam` (Problem, one FR, Sensitive surface, Verification, Approval; other sections `n/a — one seam`).
3. Mark assumptions explicitly; do not invent requirements.
4. Ask for approval → then `lock-scope`.
