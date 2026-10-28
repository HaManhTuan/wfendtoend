# Review: <title>

- **Slug:** `<slug>`
- **Date:** `<YYYY-MM-DD>`
- **Base:** `<branch, tag, or SHA>`
- **Head:** `<SHA>`
- **Diff command:** `<git diff base...head>`
- **Reviewer:** `<agent or human>`

Read the SPEC, the tickets, and the code the diff calls. A finding names what the code does, what goes wrong, the fix, and what happens if we skip it. Empty tables are not a review. Delete the EXAMPLE row.

## Files read

| Path | Why |
|------|-----|
| `<file in the diff>` | `<changed behavior>` |
| `<caller or schema not in the diff>` | `<what would break if this is wrong>` |

## Axis A — Standards

Conventions, naming, error handling, secrets, and structural smells. This axis is not a security audit.

| Finding | Severity | Location | If we skip it |
|---------|----------|----------|---------------|
| `<what the code does and what goes wrong>` | blocker / should / nit | `<path:line>` | `<user-visible or maintenance cost>` |

## Axis B — Spec

| Finding | Severity | Requirement | Covered? |
|---------|----------|-------------|----------|
| `<gap against FR or Done when>` | blocker / should / nit | `<FR1 or T1>` | no / partial |

- **Out of scope creep:** no | yes — `<what landed that the SPEC excluded>`
- **Done-when with no check:** none | `<T1 — missing test>`

## Sensitive surface

none | `<pointer to the threat note, security-audit report, or waiver in the verify file>`

Do not treat a hygiene comment as that gate.

## Verdict

- [ ] Ready to ship (git only — release is separate)
- [ ] Needs fixes

**Blockers:**

- `<none, or the finding that blocks ship>`

## Notes

`<disagreements, follow-ups that are not blockers>`
