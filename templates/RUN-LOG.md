# Run log: <title>

- **Slug:** `<slug>`
- **Started:** `<YYYY-MM-DD>`

The status table is updated in place (one row per phase). **Entries are append-only.** Never delete an entry. `implement` / `ship` must refuse “A→Z complete” unless an entry exists for `discover`, `grill-me`, or `to-spec`, or a waiver entry exists.

## Status

| Phase | Skill | Cursor command | Status | Notes |
|-------|-------|----------------|--------|-------|
| discover | `<discover / grill-me / to-spec>` | `</feature or implicit>` | todo / doing / done / waived | `<Q&A or waiver>` |
| lock-scope | `lock-scope` | | todo / doing / done / skipped | |
| plan | `write-plan` | | todo / doing / done / skipped | |
| risks | `risk-assess` | | todo / doing / done / skipped | |
| tickets | `to-tickets` | | todo / doing / done / skipped | |
| implement | `implement` | | todo / doing / done / skipped | |
| review | `dual-review` | | todo / doing / done / skipped | |
| verify | `verify` | | todo / doing / done / skipped | |
| ship | `ship` | | todo / doing / done / skipped | `<git only>` |
| release | `release` | `/release` | todo / doing / done / skipped | `<audience, or skipped>` |
| retro | `retro` | | todo / doing / done / skipped | `<success metric moved? yes / no / not measured>` |

## Entries

Copy this block. Do not edit old entries.

### `<YYYY-MM-DDThh:mm:ss+07:00>` — `<phase>`

- **Cursor command:** `/feature` | `/greenfield` | `/bug` | `/release` | `/ask` | `_(implicit — user said “…”)_`
- **Skill:** `<skill name>`
- **Outcome:** `<what is now true, including waiver text when that is the outcome>`
- **Artifacts:** `<paths>`

<!-- EXAMPLE — delete before saving
### 2026-10-28T10:46:00+07:00 — discover

- **Cursor command:** `/feature`
- **Skill:** `discover`
- **Outcome:** Q&A closed. SPEC written, waiting for approval.
- **Artifacts:** `artifacts/research/shop-mvp.md`, `artifacts/specs/shop-mvp.md`
-->
