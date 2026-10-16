---
name: prototype
description: >-
  Build a throwaway prototype to answer a design question before locking SPEC —
  single HTML for state/logic, or toggleable UI variants. Use when uncertainty is design-shaped.
disable-model-invocation: true
---

# Prototype

Prototypes are **disposable**. They answer a question; they are not the product.

## Modes

### A — Logic / state machine

- One shareable HTML (or tiny script) that exercises the decision tree.
- Capture what you learned in `artifacts/research/<slug>-prototype.md`.

### B — UI variants

- 2–4 radically different layouts on one route / page with a toggle.
- User picks a direction → fold into SPEC; delete or quarantine the prototype.

## Rules

- Time-box; no production polish.
- Do not merge prototype code into the main architecture without a deliberate rewrite.
- After learning → return to `discover` / `lock-scope` with decisions recorded.
