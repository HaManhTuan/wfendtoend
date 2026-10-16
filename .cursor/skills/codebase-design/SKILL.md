---
name: codebase-design
description: >-
  Shared vocabulary for designing deep modules — lots of behavior behind a small interface,
  clean seams, testable through the interface. Use during plan, tidy-refactor, improve-architecture.
---

# Codebase design

## Vocabulary

| Term | Meaning |
|------|---------|
| **Deep module** | Rich behavior, narrow interface |
| **Shallow module** | Interface nearly as complex as internals |
| **Seam** | Boundary you can test/replace without tearing the system |
| **Inversion** | Depend on abstractions at seams, not concretes across features |

## Practice

1. Name the seam before coding the guts.
2. Put tests against the seam (`tdd`).
3. Prefer one concept per module; align names with `GLOSSARY.md`.
4. When improving design, prefer deepening an existing module over adding helpers soup.

## Anti-patterns

- `utils/` dumping grounds
- Leaking internals across layers “just this once”
- Interfaces that mirror every implementation detail
