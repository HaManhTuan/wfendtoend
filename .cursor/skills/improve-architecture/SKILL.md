---
name: improve-architecture
description: >-
  Survey the codebase for deepening opportunities (simpler interfaces, clearer seams), present
  candidates, then grill which one to pursue. Use periodically, not as emergency rescue.
disable-model-invocation: true
---

# Improve architecture

Survey → pick → grill → optionally plan. Not a big-bang rewrite.

## Steps

1. Scan for shallow modules, tangled folders, duplicated concepts, glossary mismatches.
2. Produce 3–7 **candidates** in `artifacts/reviews/<slug>-architecture.md`:
   - Problem smell
   - Proposed deepening
   - Risk / blast radius
   - Suggested first slice
3. Present candidates; user picks one (or none).
4. Run `grill-me` / `grilling` on the pick until decisions are locked.
5. Hand off to `write-plan` → `to-tickets` (do not start a mega-refactor unscoped).

## Rules

- Prefer incremental deepening over rewrites.
- Use `codebase-design` vocabulary (deep modules, seams).
- On a genuinely muddy legacy system: find candidates; do not claim you untangled everything.
