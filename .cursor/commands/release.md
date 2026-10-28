# /release

Put a verified build in front of its audience. Log **Cursor command: `/release`** via `run-log`.

1. Read `AGENTS.md`. This is not `ship`.
2. Run **`release`**. Write `artifacts/reviews/<slug>-release.md` from `templates/RELEASE.md`.
3. Refuse if verify has no acceptance-evidence table.
4. Do not deploy unless this repo already has a command and the user asked to run it.
