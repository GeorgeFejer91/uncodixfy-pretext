# Uncodixfy Pretext

A Codex skill for HTML interfaces that look intentional and keep their text readable as controls resize, languages change, or the UI moves from desktop to phone. It combines [Uncodixfy's](https://github.com/cyxzdev/uncodixfy) visual restraint, [Cheng Lou's Pretext](https://github.com/chenglou/pretext) text measurement, and Ponytail's YAGNI discipline.

**The short version:** design the layout around the purpose of each region; measure text against the space actually available inside it; if readable text does not fit, change the layout or expose the full text. A tiny font or hidden overflow is not a successful fit.

## What the skill does

1. **Allocate boxes with HTML and CSS.** Grid/Flex establish the page, control, icon, and text slots. The box is not sized around today's label.
2. **Measure bounded text with Pretext.** Buttons, tabs, compact status, dialog actions, and similar regions use the current string and font to test their real inner width, height, and line budget. Pretext is required for bounded text on the UI being changed.
3. **Handle no-fit explicitly.** Prefer more room, wrapping, or reflow before reducing type within a small readable range. Keep essential wording available in full.
4. **Check the rendered result.** Pretext predicts text geometry; the browser or Tauri WebView decides what is actually painted. Verify resize, zoom, localization, and accessibility cases there.

This is a design and implementation workflow, **not** a CSS framework, a Pretext fork, or an automatic retrofit of existing applications. The skill does not ship Pretext into an app: when it is used on a page, add a locked `@chenglou/pretext` dependency to that application's normal package workflow.

## Where it applies

Use it when creating or revising text-bearing HTML UI in a browser, responsive phone layout, or Tauri WebView—especially when labels live in bounded controls. It is not for native-only widgets or canvas-only rendering. Ordinary flowing prose can use normal CSS wrapping; measuring every paragraph or rebuilding unrelated screens would add work without improving the touched UI.

The original Uncodixfy is a design reference, not a universal set of palette, font, or radius bans. Preserve each product's identity. Ponytail keeps the implementation small: reuse the existing component system and add only the measurement and verification that the changed UI needs.

## Use it in Codex

Ask Codex's [`$skill-installer`](https://learn.chatgpt.com/docs/build-skills) to install the skill from this repository:

```text
$skill-installer Install the skill from https://github.com/GeorgeFejer91/uncodixfy-pretext
```

Start a new task if the skill does not appear immediately. For the full YAGNI companion workflow, also make [Ponytail](https://github.com/DietrichGebert/ponytail) available. The repository's `SKILL.md` and `references/pretext.md` are the runtime instructions; the README is an overview.

Example request:

> Use `$uncodixfy-pretext` to revise this Tauri settings panel. Keep the existing visual language, implement Pretext measurement for bounded labels, and verify the rendered layout at narrow widths, 200% text resize, and long German strings.

For an existing project, route future HTML UI work to this skill in its `AGENTS.md` or `for-ai/` guidance. A pointer alone does not implement Pretext or qualify existing controls.

## The text-fitting contract

```text
semantic box + reserved icon/gap/padding space
    → actual text-slot width and height
    → loaded font + full string + locale + wrapping rules
    → Pretext fit prediction
    → readable fit OR explicit no-fit layout
    → rendered DOM/WebView check
```

Keep the typography used by Pretext and the DOM in sync: font family, face, weight, size, line height, letter spacing, language, and wrapping behavior. Prepare again after a text, font, size, or locale change; a width-only resize can reuse prepared measurements. Center an icon-and-label *group* in a button rather than positioning each piece by eye. For implementation API choices and platform caveats, read [the Pretext reference](references/pretext.md).

For example, an icon button may fit “Save” but not its longer translated label. Measure the label against the space left **after** the icon, gap, and padding. If it still fails at the readable minimum, give the action more room or rearrange the narrow layout; do not clip the translation and call it finished.

Do not treat `overflow: hidden`, ellipsis, or shrinking below a readable floor as proof that a control works. If a required string cannot fit, the UI should grow, reflow, scroll an intentional region, reveal the full value, or report that the design has no valid fit. There is no finite fixed box that holds arbitrary text at a fixed readable size.

## Definition of done for a changed UI

- Bounded text is measured with real Pretext calls, not only `clamp()` or a test mock.
- Short and long strings, supported translations, font loading, shrinking **and regrowth**, and both width and height changes behave as intended.
- The target browser/WebView is checked at the supported narrow layout, 320 CSS px reflow, 200% text resize/zoom, and user text-spacing overrides.
- No required text is clipped, overlapped, or available only on hover; keyboard focus, reading order, and accessible names still work.
- The handoff names what was actually tested and any unsupported case. Documentation or a green Pretext prediction alone is not browser proof.

## Read next

- [SKILL.md](SKILL.md) — authoritative instructions Codex follows.
- [Pretext reference](references/pretext.md) — APIs, font/locale lifecycle, measurement limits, and verification details.
- [Maintainer `for-ai/` guide](for-ai/README.md) — how this skill repository is maintained and published; not app runtime guidance.
- [Pretext upstream](https://github.com/chenglou/pretext) and [platform bug ledger](https://github.com/chenglou/pretext/blob/main/PLATFORM_BUGS.md) — current API and known parity limits.
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — rendered reflow, resize-text, and text-spacing criteria.
