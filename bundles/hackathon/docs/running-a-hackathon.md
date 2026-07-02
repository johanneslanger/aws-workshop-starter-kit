# Running a hackathon (builder) workshop

A short playbook for facilitators running a build-from-scratch workshop with Claude Code on Bedrock.

## Before the workshop

1. Decide whether attendees start from an empty repo or a light scaffold you provide.
2. Test the flow: run `install/install-claude-code.sh`, copy `AGENTS.md`, `CLAUDE.md`, `.mcp.json` into a project, run `claude`, and confirm the AWS Knowledge MCP connects (`/mcp` inside Claude Code lists tools).
3. Decide if you want the web-search add-on (needs us-east-1, deploys infra, ~$7/1k queries). See [`../../addons/websearch/`](../../addons/websearch/).

## Attendee steps

1. Open a terminal in the workshop environment.
2. Install:
   ```bash
   bash install/install-claude-code.sh
   ```
3. Drop the bundle into the project:
   ```bash
   cp AGENTS.md CLAUDE.md .mcp.json .
   mkdir -p ~/.claude/skills && cp -r skills/grill-me ~/.claude/skills/grill-me
   ```
4. Run `claude`. Start by saying **"grill me"** on your idea before building.

## Facilitation tips

- Push the grill-me step. Teams that pressure-test their design for ten minutes waste far less time mid-build.
- Remind attendees the agent has live AWS docs via the Knowledge MCP, tell it to look things up rather than guess.
- Keep secrets out of the repo and out of the chat.

## What this bundle does NOT do

- It doesn't scaffold a specific app, attendees bring their own idea.
- It doesn't pin models. See [`../../install/README.md`](../../install/README.md).

## Maintainer notes

**Why `CLAUDE.md` is one line.** Claude Code reads `CLAUDE.md`, not `AGENTS.md` ([docs](https://docs.claude.com/en/docs/claude-code/memory)). `AGENTS.md` holds the build conventions as the single source of truth (Codex and other agents read it directly); `CLAUDE.md` is just `@AGENTS.md` so there's no duplicated content to maintain.

**AWS Knowledge MCP endpoint (confirmed).** `.mcp.json` uses the officially documented endpoint `https://knowledge-mcp.global.api.aws` ([AWS blog](https://aws.amazon.com/blogs/machine-learning/connect-amazon-quick-suite-to-enterprise-apps-and-agents-with-mcp/)), no auth. Verified 2026-07-02 with a live MCP `initialize` call: the bare host returns a valid handshake (`serverInfo: AWSKnowledgeMCP`). The `/mcp` path also works identically; we ship the documented bare host.
