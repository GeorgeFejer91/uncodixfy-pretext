# Decisions

## D-0001 — Box-first layout, Pretext-required bounded text

- Date: 2026-09-24
- Status: Accepted
- Decision: Use ordinary semantic HTML/CSS for geometry and alignment; require real Pretext measurement for bounded text on touched UI, with an explicit no-fit path and final rendered verification. Nest Ponytail and original Uncodixfy instead of cloning their full instructions.
- Rationale: Canvas-derived prediction helps resize and localization, but font/CSS/platform divergence means it cannot itself guarantee painted pixels. Avoid a second UI framework or universal numeric style bans.
- Consequence: Existing consumers are not implicitly migrated; each project must verify its own browser and WebView matrix.
