# Building (hackathon) workshop

A **team** builds something from scratch, with an AI coding agent as an extra pair of hands. This bundle gives you a group workflow, align → slice → divide → build, plus the conventions and live AWS docs the agent needs. Works in any AWS account, a workshop account or your own.

## Setup (once per person)

1. Set up the agent (one time): follow [`../../install/`](../../install/), a one-line install, then pick **Amazon Bedrock** in the first-run wizard.
2. Copy the config into your team's project and add the skills:
   ```bash
   cp bundles/building/AGENTS.md bundles/building/CLAUDE.md bundles/building/.mcp.json /path/to/your/project/
   mkdir -p ~/.claude/skills && cp -r bundles/building/skills/* ~/.claude/skills/
   ```
3. Run the agent. In a **disposable workshop environment**, skip permission prompts so it moves at hackathon speed:
   ```bash
   claude --dangerously-skip-permissions
   ```

> **When `--dangerously-skip-permissions` is OK.** It lets the agent run commands and edit files without stopping to ask, exactly what you want for hackathon flow. Use it **only in a throwaway workshop environment** (a Workshop Studio instance or a container that gets torn down). The flag governs the *machine the agent runs on*, not just your AWS account, so **don't use it on your own laptop**, run plain `claude` there, or use [auto mode](https://docs.claude.com/en/docs/claude-code/permission-modes) for fewer prompts with a safety classifier still in the loop. Claude Code refuses the flag when run as root, so launch as a non-root user.

## The team flow (a suggestion, not a rulebook)

1. **Argue it out.** As a group, discuss what you actually want to build. Just enough to have something to grill, don't over-plan.
2. **Mob-grill.** Gather around one screen. One person drives Claude Code and runs **`grill-me`**; the agent interviews the *group* until you all share the same picture of what you're building. Disagreements surface in the room, not in hour three. (Rotate the driver if you like, optional.)
3. **Write the PRD.** Run **`to-prd`**. It turns the grilled agreement into a short `PRD.md`, problem, solution, key decisions, user stories. This is your shared source of truth.
4. **Slice it.** Run **`to-issues`**. It slices the PRD into independent vertical slices, one file per slice in a local `issues/` folder, each referencing the PRD so every slice carries its context.
5. **Divide and build.** Each person grabs an unblocked issue (one file each, so nobody collides), splits off, and builds that slice end-to-end with the agent.
6. **Hand off and integrate.** Use **`handoff`** when a session gets long or you pass work to a teammate, it writes a pickup doc into `handoffs/` in the repo so a fresh session (or teammate) continues from the PRD and issues.

## You get

- **AGENTS.md / CLAUDE.md** — team build conventions the agent follows (shared repo, claim a slice, keep slices independent)
- **.mcp.json** — AWS Knowledge MCP, live AWS docs instead of guesswork (no auth, no cost)
- **grill-me** — mob-grill the group to a shared understanding of what to build
- **to-prd** — write that agreement up as a short `PRD.md` (problem, solution, key decisions, user stories)
- **to-issues** — slice the PRD into independently-grabbable local issues that reference it
- **handoff** — write a pickup doc into `handoffs/` so another person or agent continues cleanly

## Want to add web search to Claude?

Bedrock's Claude Code can't search the web by default, and the pre-wired **AWS Knowledge MCP** only covers AWS docs. If your build also needs the *open* web (library docs, error messages, changelogs), it's a quick optional add-on, see [`../../addons/websearch/`](../../addons/websearch/) (deploys a bit of infra, us-east-1).

---

Running this as a facilitator? See [`docs/`](docs/).
