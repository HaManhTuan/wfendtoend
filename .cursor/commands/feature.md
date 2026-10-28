# /feature

Run the **feature** pipeline for this repo using cursor-workflow. This slash **is** the audit trail entry point — log it via `run-log`.

1. Read `AGENTS.md` and `GLOSSARY.md`.
2. If no slug yet, propose one (kebab-case).
3. Create/append `artifacts/reviews/<slug>-run-log.md` (`run-log` skill) with **Cursor command: `/feature`**.
4. Start **`discover`**: grill one question per turn → research Q&A + SPEC.  
   Do **not** skip grilling unless the user typed an explicit `skip grill: …` waiver.
5. After SPEC approval: **`lock-scope`** → **`write-plan`** → **`risk-assess`** → **`to-tickets`** (log each phase).
6. On user go-ahead: **`implement`** or **`implement-spec`** (with **`tdd`** + **`tidy-refactor`**), then **`dual-review`** → **`verify`**.
7. Commit/PR only if asked (`ship` / `pr`). Ship does not release.
8. **`/release`** only when the user wants an audience to receive the build.
9. Offer **`retro`**. Ask whether the success metric moved.

Never jump to code on “làm giúp A→Z” without discover or a written waiver.
