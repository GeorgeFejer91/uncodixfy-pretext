# Skill routing

Use only what the current maintenance task requires, in this order:

| Work | Skill | Rule |
| --- | --- | --- |
| Skill creation or changes | `skill-creator` | Read completely, then validate the final skill. |
| Any code or dependency decision | `ponytail` | Keep the smallest complete change; Pretext is the explicit required UI dependency. |
| Research on changing Pretext APIs, browser behavior, or accessibility standards | `multi-source-web-search` | Open primary sources and check counterevidence. |
| Codex skill discovery or installation guidance | `openai-docs` | Use official OpenAI guidance. |
| Installing this repository as a skill | `skill-installer` | Review the source and verify the installed files. |

Original `uncodixfy` is a design reference nested by the runtime skill, not a second competing routing authority. Never claim a skill ran unless it was loaded and followed. Do not execute code from an unreviewed external skill.
