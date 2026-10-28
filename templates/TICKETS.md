# Tickets: <title>

- **Slug:** `<slug>`
- **Plan:** `artifacts/plans/<slug>.md`
- **SPEC:** `artifacts/specs/<slug>.md`

**Kind**

| Kind | Use when |
|------|----------|
| `behavior` | User-visible or domain behavior changes |
| `migration` | Schema or data move. Blocks behavior that reads the new shape |
| `contract` | Public API, event, or file format. Blocks callers |
| `observability` | Health, log, or metric on a path that can fail in production |
| `chore` | Tooling or docs that do not change behavior |

Copy the T1 block for every ticket. Delete the EXAMPLE. Keep the graph, the frontier, and **Blocked by** in sync.

## Graph overview

```text
T1 → T2
T1 → T3
```

`<Replace with the real edges. One line per edge.>`

## Ready frontier

Tickets whose **Blocked by** are all done:

- `<T1, or "none">`

---

### T1 — `<verb + outcome>`

- **Kind:** behavior | migration | contract | observability | chore
- **AC:** `<FR1, NFR5, or "none">`
- **Goal:** `<one paragraph: user or operator outcome>`
- **Done when:** Given `<state>`, when `<action>`, then `<outcome>`
- **Test first:** `<the failing check to write before production code, or the build/smoke bar for static FE>`
- **Files:** `<likely paths>`
- **Verify:** `<command and the expected signal>`
- **Blocked by:** —
- **Blocks:** `<T2 or —>`
- **Parallel?** yes | no
- **Status:** todo | doing | done
- **Notes:** `<migration reversibility, flag default, or "none">`

### T2 — `<verb + outcome>`

- **Kind:** behavior | migration | contract | observability | chore
- **AC:** `<id>`
- **Goal:** `<one paragraph>`
- **Done when:** Given `<state>`, when `<action>`, then `<outcome>`
- **Test first:** `<check>`
- **Files:** `<paths>`
- **Verify:** `<command>`
- **Blocked by:** `<T1 or —>`
- **Blocks:** —
- **Parallel?** yes | no
- **Status:** todo | doing | done
- **Notes:** `<or "none">`

<!-- EXAMPLE — delete before saving
### T0 — Reject an empty cart at checkout

- **Kind:** behavior
- **AC:** FR1
- **Goal:** A shopper cannot place an order with no lines, and the attempt leaves no order row.
- **Done when:** Given an empty cart, when the shopper checks out, then the API returns 422 and the order table is unchanged.
- **Test first:** `test/checkout.test.ts` asserts 422 before the handler exists.
- **Files:** `src/checkout.ts`, `test/checkout.test.ts`
- **Verify:** `npm test -- checkout` exits 0
- **Blocked by:** —
- **Blocks:** —
- **Parallel?** no
- **Status:** todo
- **Notes:** none
-->
