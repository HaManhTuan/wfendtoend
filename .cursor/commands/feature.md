# /feature

Run the **feature** pipeline for this repo using cursor-workflow.

1. Read `AGENTS.md` and `GLOSSARY.md`.
2. If no slug yet, propose one (kebab-case).
3. Start **`discover`** (or `grill-me` → `to-spec` if already discussed): research + SPEC.
4. After SPEC approval: **`lock-scope`** → **`write-plan`** → **`risk-assess`** → **`to-tickets`**.
5. On user go-ahead: **`implement`** or **`implement-spec`** (with **`tdd`** + **`tidy-refactor`**), then **`dual-review`** → **`verify`**.
6. Commit/PR only if asked (`ship` / `pr`).

Do not skip to code unless the user explicitly waives discover.
