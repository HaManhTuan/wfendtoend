---
name: pr
description: >-
  Shape a pull request body: visual summary, before/after evidence, merge-danger call.
  Use when opening or rewriting a PR; ship may invoke this.
---

# PR

## Body shape

```markdown
## Summary
<!-- smallest visual/narrative that makes the change obvious -->

## Evidence
<!-- commands + results proving it works -->

## Merge danger
- Door: one-way | two-way
- Blast radius: …

## Test plan
- [ ] …
```

## Rules

- Link SPEC/tickets when they exist.
- No “misc fixes” as the whole summary.
- Call out migrations, flag defaults, and irreversible steps under merge danger.
- Prefer screenshots/recordings for UI when available.
