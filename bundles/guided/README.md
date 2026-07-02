# Guided (notebook) workshop

Turns Claude Code into a tutor that reads your workshop and walks you through the notebooks.

## Setup

1. Install Claude Code first (from the repo root): `bash install/install-claude-code.sh`
2. Add the tutor skill:
   ```bash
   mkdir -p ~/.claude/skills && cp -r bundles/guided/skills/tutor ~/.claude/skills/aws-workshop-tutor
   ```
3. `cd` into your workshop repo, run `claude`, and say **"teach me this workshop."**

The tutor frames each notebook, lets you work through it, answers questions as you go, and gives you a quick comprehension check before the next one.

---

Optional: [live web search](../../addons/websearch/) · Running this as a facilitator? See [`docs/`](docs/).
