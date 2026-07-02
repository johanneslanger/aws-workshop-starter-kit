# Workshop Starter Kit — AI-agent-powered AWS workshops

A starter kit for running AWS workshops where participants work alongside an AI coding agent (Claude Code on Amazon Bedrock). Pick the style that matches your workshop, each path has its own short setup.

## Two workshop styles

### 🎓 Guided — learning
Work through pre-built notebooks and code at your own pace. The agent becomes a **tutor** that reads the workshop and teaches it, one notebook at a time. Individual-first.

→ [`bundles/guided/`](bundles/guided/)

### 🛠️ Building — hackathon
A **team** builds something from scratch. The group aligns on what to build, mob-grills the agent to a shared understanding, slices the work into independent pieces, and divides them.

→ [`bundles/building/`](bundles/building/)

Each path's README starts with installing the agent (a one-line script), then takes it from there.

## What's in the box

```
install/            Install the agent (Claude Code) + wire it to Bedrock — shared by both paths
bundles/guided/     Learning path: notebook tutor
bundles/building/   Hackathon path: mob-grill → slice → divide → build, as a team
addons/websearch/   Optional: give the agent web search (Bedrock has none built in)
```

## More

- Install details, troubleshooting, region and model notes → [`install/README.md`](install/README.md)
- License: MIT ([`LICENSE`](LICENSE)) · third-party notices in [`NOTICE`](NOTICE)
