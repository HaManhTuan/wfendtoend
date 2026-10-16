---
name: lock-scope
description: >-
  After discover/research, lock inclusion/exclusion boundaries and assumptions before planning.
  Use when SPEC exists but plan must not start without clear edges.
disable-model-invocation: true
---

# Lock scope

Read `artifacts/research/<slug>.md` and `artifacts/specs/<slug>.md` first.

## Produce

Append or write `artifacts/specs/<slug>-scope.md` (or a **Scope** section in the SPEC) containing:

```markdown
## In scope
- …

## Out of scope
- …

## Assumptions (accepted)
- …

## Open risks
- …

## Non-goals this iteration
- …
```

## Gate

Ask the user to confirm. On approval, next skill is `write-plan`.

Do not draft a full implementation plan here.
