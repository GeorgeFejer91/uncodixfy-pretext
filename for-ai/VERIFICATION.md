# Verification

- `VERIFIED`: directly checked; `PARTIAL`: checked with named gaps; `NOT RUN`: intentionally omitted; `BLOCKED`: external obstacle.
- For skill text changes: run the installed skill-creator validator, `git diff --check`, and review links/API claims against current official Pretext documentation.
- For installation: compare SHA-256 of `SKILL.md` and `references/pretext.md` between repository and installed skill, then validate the installed copy.
- For the control plane: run `for-ai/scripts/check-context.ps1` and inspect the changed Markdown for duplicated or contradictory rules.
- For publication: stage only intended paths, commit without force, push, and compare local `HEAD` with `origin/main`.
- Browser or Tauri overflow checks belong to each consumer project. This repository's document validation alone cannot qualify a UI.
