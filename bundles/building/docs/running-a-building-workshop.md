# Running a building (hackathon) workshop

A short playbook for facilitators running a **team** build-from-scratch workshop with an AI coding agent.

## Before the workshop

1. Decide whether teams start from an empty repo or a light scaffold you provide.
2. Test the flow yourself: install the agent, copy `AGENTS.md`/`CLAUDE.md`/`.mcp.json` into a project, run `claude`, confirm the AWS Knowledge MCP connects (`/mcp` lists tools), and do a quick `grill-me` → `to-issues` pass.
3. Decide if you want the web-search add-on (needs us-east-1, deploys infra). See the [web-search add-on](../../../addons/websearch/).
4. Set team size to ~3-5. Each team shares one repo.

## What each team does

1. Everyone installs the agent (see the bundle [README](../README.md)).
2. The team discusses what they want to build.
3. **Mob-grill:** one driver, shared screen, run `grill-me` until the group agrees.
4. `to-prd` writes the agreement to `PRD.md`; `to-issues` slices it into `issues/`.
5. Members divide the slices and build in parallel, one issue each.
6. `handoff` writes pickup docs into `handoffs/` to pass context between people or sessions.

## Facilitation tips

- Push the mob-grill step. Ten minutes of group alignment beats three teammates quietly building three different things.
- Keep it simple: one driver, shared screen for the grill. Rotating the driver is optional.
- Remind teams the agent has live AWS docs via the Knowledge MCP, tell it to look things up rather than guess.
- Keep secrets out of the repo and out of the chat.

## What this bundle does NOT do

- It doesn't scaffold a specific app, teams bring their own idea.
- It doesn't pin models. See the [install guide](../../../install/README.md).

## Maintainer notes

**Why `CLAUDE.md` is one line.** Claude Code reads `CLAUDE.md`, not `AGENTS.md` ([docs](https://docs.claude.com/en/docs/claude-code/memory)). `AGENTS.md` holds the build conventions as the single source of truth (Codex and other agents read it directly); `CLAUDE.md` is just `@AGENTS.md` so there's no duplicated content to maintain.

**AWS Knowledge MCP endpoint (confirmed).** `.mcp.json` uses the officially documented endpoint `https://knowledge-mcp.global.api.aws` ([AWS blog](https://aws.amazon.com/blogs/machine-learning/connect-amazon-quick-suite-to-enterprise-apps-and-agents-with-mcp/)), no auth. Verified 2026-07-02 with a live MCP `initialize` call: the bare host returns a valid handshake (`serverInfo: AWSKnowledgeMCP`). The `/mcp` path also works identically; we ship the documented bare host.
