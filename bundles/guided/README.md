# Guided (notebook) workshop

Turns Claude Code into a tutor that reads your workshop and walks you through the notebooks.

## Setup

1. Install Claude Code first (from the repo root): `bash install/install-claude-code.sh`
2. Add the tutor skill:
   ```bash
   mkdir -p ~/.claude/skills && cp -r bundles/guided/skills/tutor ~/.claude/skills/aws-workshop-tutor
   ```
3. `cd` into your workshop repo and start the agent. In a **disposable workshop environment**, skip permission prompts so tutoring flows without interruptions:
   ```bash
   claude --dangerously-skip-permissions
   ```
   Then say **"teach me this workshop."**

> **When `--dangerously-skip-permissions` is OK.** It lets the agent run commands and edit files without stopping to ask. Use it **only in a throwaway workshop environment** (a Workshop Studio instance or a container that gets torn down). The flag governs the *machine the agent runs on*, not just your AWS account, so **don't use it on your own laptop**, run plain `claude` there, or use [auto mode](https://docs.claude.com/en/docs/claude-code/permission-modes) for fewer prompts with a safety classifier still in the loop. Claude Code refuses the flag when run as root, so launch as a non-root user.

The tutor frames each notebook, lets you work through it, answers questions as you go, and gives you a quick comprehension check before the next one.

---

Optional: [live web search](../../addons/websearch/) · Running this as a facilitator? See [`docs/`](docs/).
