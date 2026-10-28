# Research: <title>

- **Slug:** `<slug>`
- **Date:** `<YYYY-MM-DD>`
- **Mode:** discover | cited | evidence
- **Question:** `<one sentence this file answers>`

Discover mode requires **Q&A log** or **Waiver**. Cited mode requires **Findings** with a source on every non-obvious claim. Evidence mode requires **Authorization** and a pointer on every claim. Delete sections that the mode does not use, and say which mode you kept.

## Sources

| Source | Date seen | Taken | Fact or inference |
|--------|-----------|-------|-------------------|
| `<chat, path, URL, or ticket>` | `<YYYY-MM-DD>` | `<what we used>` | fact / inference |

## Spec snapshot

`<Five to ten bullets a planner can trust without re-reading chat. Empty until the design tree is resolved.>`

## Confirmed

- `<decision the user stated>`

## Assumptions

- `<only items the user accepted, or items listed under Waiver>`

## Ambiguities

| Item | Status | Resolution |
|------|--------|------------|
| `<open design choice>` | open / closed | `<answer or "deferred to wayfinder">` |

## Q&A log

Required for discover mode unless Waiver is filled. One question per agent turn. Keep every answer.

### Q1. `<question>`

**A:** `<answer>`

### Q2. `<question>`

**A:** `<answer>`

## Waiver

Delete this section unless the user typed `skip grill: …`.

- **User text:** `<the exact waiver>`
- **Assumptions accepted:** `<list>`
- **Recorded in run log:** yes

## Decisions

| Decision | Alternatives rejected | Why |
|----------|----------------------|-----|
| `<what we chose>` | `<what we did not>` | `<reason>` |

## Cited findings

Required for mode `cited`. Separate fact from inference. If sources conflict, say so in the row.

| Finding | Source | Fact or inference |
|---------|--------|-------------------|
| `<claim>` | `<URL or path, with version and date>` | fact / inference |

- **Recommendation:** `<what the SPEC should do with this>`
- **Open unknowns:** `<what we could not prove>`

## Evidence

Required for mode `evidence`. Stop if authorization is missing.

- **Target:** `<app, binary, or site>`
- **Authorization:** `<who confirmed ownership or permission, and when>`
- **Method and tools:** `<browser, source path, HAR, or other>`
- **Findings:** `<claim — pointer (file, symbol, screenshot, request id)>`
- **Unknowns:** `<what you could not prove>`
- **Limits:** `<obfuscation, missing symbols, dynamic-only behavior>`
- **Feed into SPEC:** `<which requirement this supports>`
