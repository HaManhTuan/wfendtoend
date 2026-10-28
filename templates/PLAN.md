# PLAN: <title>

- **Slug:** `<slug>`
- **SPEC:** `artifacts/specs/<slug>.md`
- **Status:** draft | approved
- **Owner:** `<name>`

A developer with no chat history must be able to execute this file. No empty `TBD`. Delete the EXAMPLE step before saving.

## Task / scope

`<One sentence: what this plan delivers, and the scope file or SPEC section that bounds it.>`

## Current state

`<What already exists. What this plan will not rewrite.>`

## Requirements traceability

Every FR and in-scope NFR from the SPEC appears once. Steps that mitigate a high risk appear here too.

| Requirement / AC | Plan step | Ticket |
|------------------|-----------|--------|
| FR1 | S1 | T1 |
| NFR5 | S2 | T2 |

## Seams

| Seam | Module | Hidden behind it |
|------|--------|------------------|
| `<public function, route, or page>` | `<path>` | `<what callers must not reach into>` |

## Order constraints

`<migration before contract before behavior, when those kinds exist. Observability on the critical path unless the user waived it. Otherwise "no extra order".>`

## Plan steps

- [ ] **S1** — `<verb + outcome>`
  - **Kind:** behavior | migration | contract | observability | chore
  - **Depends on:** —
  - **Files:** `<repo-relative paths>`
  - **Change:** `<what becomes true>`
  - **Run:** `<exact command>`
  - **Expected:** `<exit 0 and the assertion>`
  - **Done when:** `<same bar as the ticket>`

<!-- EXAMPLE — delete this step before saving
- [ ] **S0** — Reject checkout when the cart is empty
  - **Kind:** behavior
  - **Depends on:** —
  - **Files:** `src/checkout.ts`, `test/checkout.test.ts`
  - **Change:** POST /checkout with no lines returns 422 and writes nothing
  - **Run:** `npm test -- checkout`
  - **Expected:** exit 0; the new test fails before the fix and passes after
  - **Done when:** FR1 acceptance passes
-->

## Won't do / Later

- `<deferred work, and the trigger that would pull it in>`

## Risks

Cover migrations, authz, backwards compatibility, perf hotspots, third-party outages, and rollback. A High/High row needs a plan step or a named waiver. Rollback names a command, or a named "no rollback" waiver.

| Risk | Likelihood | Impact | Mitigation | Owner | Plan step |
|------|------------|--------|------------|-------|-----------|
| `<what can go wrong>` | L/M/H | L/M/H | `<action>` | `<name>` | S1 or waiver |
| Rollback | `<L/M/H>` | `<L/M/H>` | `<command, or waiver: name + date>` | `<name>` | `<step or waiver>` |

- **Sensitive surface:** none | `<list, matching the SPEC>`

## Open questions

| Question | Blocks execute? | Owner |
|----------|-----------------|-------|
| `<fact>` | yes / no | `<name>` |

## Approval

- **Approved by:** `<name>`
- **Date:** `<YYYY-MM-DD>`
