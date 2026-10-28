# SPEC: <title>

- **Slug:** `<slug>`
- **Profile:** full | one-seam
- **Status:** draft | approved
- **Date:** `<YYYY-MM-DD>`
- **Owner:** `<name who can approve>`
- **Supersedes:** none | `<path>`

Delete every `<prompt>` after you replace it. Do not leave an empty heading. If a section does not apply, write `n/a` and one line why.

**Profile `one-seam`:** one route, one rule, or one behavior. Fill Problem, a single FR row, Sensitive surface, Verification approach, and Approval. Every other section is `n/a — one seam`. Do not invent failure-mode tables to look complete.

**Profile `full`:** a product, an epic, or more than one seam. Fill every section.

## Problem

`<Who is blocked, what they do today, and the cost of leaving it. One paragraph.>`

## Users / stakeholders

| Who | Need | Served when |
|-----|------|-------------|
| `<primary user>` | `<job to be done>` | `<observable outcome>` |
| `<operator or support>` | `<what they must run or see>` | `<observable outcome>` |
| `<approver>` | `<what they must agree>` | `<approval recorded>` |

## Success looks like

- **Metric:** `<name, unit>`
- **Baseline:** `<today's number or "unmeasured">`
- **Target:** `<number or qualitative bar>`
- **When measured:** `<before release | after N days | at verify>`
- **Not success:** `<a nearby outcome that does not count>`

## Happy path

1. `<Actor does …>`
2. `<System does …>`
3. `<Actor sees …>`

## Failure modes

| Trigger | User-visible result | System behavior |
|---------|---------------------|-----------------|
| `<invalid input>` | `<message or state>` | `<reject, no partial write>` |
| `<dependency down>` | `<message or state>` | `<timeout, retry, or fail closed>` |
| `<unauthorized>` | `<message or state>` | `<deny, no data leak>` |

## Functional requirements

Stable ids. Verify maps each id to evidence. Write Given / When / Then in Acceptance.

| ID | Requirement | Acceptance |
|----|-------------|------------|
| FR1 | `<behavior>` | Given `<state>`, when `<action>`, then `<outcome>` |
| FR2 | `<behavior>` | Given `<state>`, when `<action>`, then `<outcome>` |

## Non-functional requirements

Delete rows that do not apply and say why. Do not leave the heading blank.

| ID | Area | Requirement | How verified |
|----|------|-------------|--------------|
| NFR1 | performance | `<budget: latency, size, or throughput>` | `<command or manual check>` |
| NFR2 | reliability | `<what must stay true under failure>` | `<test or drill>` |
| NFR3 | security / privacy | `<data handled, retention, who can read>` | `<review or test>` |
| NFR4 | accessibility | `<bar, or n/a for a non-UI change>` | `<check>` |
| NFR5 | operability | `<health, log, or metric on the critical path>` | `<where it shows up>` |

## Data and contracts

- **Entities:** `<name — key fields — invariant>`
- **APIs / events touched:** `<method path or event, request, response, error>`
- **Compatibility:** `<what existing callers must still do>`
- **Migration:** none | `<expand/migrate/contract, reversible? yes/no>`

## UX notes

`n/a — <why>` | `<screens, empty state, error state, loading state, copy that must not change>`

## Constraints

`<stack, deadline, compatibility, legal, or "none beyond the repo conventions">`

## Sensitive surface

none | auth | PII | payment | upload | multi-tenant | public API

`<If not none: what crosses the boundary, and the trust assumption. Verify and release must point at a threat note, a security-audit report, or a named waiver.>`

## In scope

- `<this iteration delivers>`

## Out of scope

- `<named temptation we will not build>`

## Assumptions

- `<accepted assumption, and who accepted it>`

## Open questions

| Question | Blocks plan? | Owner |
|----------|--------------|-------|
| `<unresolved fact>` | yes / no | `<name>` |

A `yes` row blocks `write-plan` until it is answered or waived.

## Verification approach

- **Automated seam:** `<public API, use-case, or UI contract under test>`
- **Manual:** `<what a human must still look at>`
- **Unacceptable waiver:** `<the check we will not skip>`

## Amendments

Empty until the SPEC is approved. After approval, scope changes go here and wait for a new approval before `implement` continues. Do not edit approved FR rows in place.

| Date | Change | Approved by |
|------|--------|-------------|
| `<YYYY-MM-DD>` | `<what moved in or out>` | `<name>` |

## Approval

- **Approved by:** `<name>`
- **Date:** `<YYYY-MM-DD>`
- **Notes:** `<conditions, or "none">`
