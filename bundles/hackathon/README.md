# Hackathon (builder) workshop

Sets up Claude Code for building from scratch: build-mode conventions, live AWS docs, and an idea stress-tester.

## Setup

1. Install Claude Code first (from the repo root): `bash install/install-claude-code.sh`
2. Copy the config into your project and add the skill:
   ```bash
   cp bundles/hackathon/AGENTS.md bundles/hackathon/CLAUDE.md bundles/hackathon/.mcp.json /path/to/your/project/
   mkdir -p ~/.claude/skills && cp -r bundles/hackathon/skills/grill-me ~/.claude/skills/grill-me
   ```
3. Run `claude` from your project. Start with **"grill me"** on your idea before you build.

You get:

- **AGENTS.md / CLAUDE.md** — build-mode conventions the agent follows
- **.mcp.json** — AWS Knowledge MCP, so the agent looks up current AWS docs instead of guessing (no auth, no cost)
- **grill-me** — pressure-tests your design before you write code (MIT, [Matt Pocock](https://github.com/mattpocock/skills))

---

Optional: [live web search](../../addons/websearch/) · Running this as a facilitator? See [`docs/`](docs/).
