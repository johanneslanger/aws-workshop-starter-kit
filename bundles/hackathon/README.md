# Hackathon (builder) workshop

Sets up Claude Code for building from scratch: build-mode conventions, live AWS docs, and a small set of skills that take you from a rough idea to shipped vertical slices. Works in any AWS account, a workshop account or your own.

## Setup

1. Install Claude Code first (from the repo root): `bash install/install-claude-code.sh`
2. Copy the config into your project and add the skills:
   ```bash
   cp bundles/hackathon/AGENTS.md bundles/hackathon/CLAUDE.md bundles/hackathon/.mcp.json /path/to/your/project/
   mkdir -p ~/.claude/skills && cp -r bundles/hackathon/skills/* ~/.claude/skills/
   ```
3. Run `claude` from your project.

## Recommended flow (a suggestion, not a rulebook)

1. **Talk it through.** Tell the agent what you want to build and discuss the approach.
2. **`grill-me`** — let the agent interview you until you both agree on *what* you're building.
3. **`to-issues`** — turn that agreement into a handful of vertical-slice issues in a local `issues/` folder. Each slice is demoable on its own.
4. **Build slice by slice.** Grab an unblocked issue, build it end-to-end, mark it done.
5. **`handoff`** — when the conversation gets long or you're passing work to a teammate, compact the state into a handoff doc so a fresh session picks up from the issues.

## You get

- **AGENTS.md / CLAUDE.md** — build-mode conventions the agent follows
- **.mcp.json** — AWS Knowledge MCP, so the agent looks up current AWS docs instead of guessing (no auth, no cost)
- **grill-me** — pressure-tests your design before you write code
- **to-issues** — slices the plan into independently-grabbable local issues
- **handoff** — compacts a long session so another agent (or teammate) continues cleanly

grill-me, to-issues, and handoff are based on / adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT). See [`../../NOTICE`](../../NOTICE).

---

Optional: [live web search](../../addons/websearch/) · Running this as a facilitator? See [`docs/`](docs/).
