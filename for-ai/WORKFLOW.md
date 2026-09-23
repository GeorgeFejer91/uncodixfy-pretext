# Maintenance workflow

1. Read `AGENTS.md`, this router, and the task-owned file. Inspect Git status before editing.
2. Make the narrowest source change in `SKILL.md` or its Pretext reference. Keep external claims sourced and the skill independent of any one app.
3. Run the matching checks in `VERIFICATION.md`; record what did not run.
4. Update this control plane only for a durable routing, scope, or verification change. Do not add transcripts, daily logs, or speculative protocols.
5. Review the exact diff, commit intended files, push normally, verify remote SHA, then synchronize and hash-check the installed skill when runtime guidance changed.

Never stage unrelated user work, force-push, bypass protection, or describe documentation checks as browser proof.
