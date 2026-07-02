# Workshop Starter Kit — AI-agent-powered AWS workshops

Run AWS workshops where participants work alongside an AI coding agent (Claude Code on Amazon Bedrock). Two ready-to-use setups: a **guided** notebook tutor, and a **building** hackathon flow for teams.

## Get started

1. **Get the files.** Open a terminal in your workshop environment (in JupyterLab or the Code Editor instance, look for **Terminal**), and type:
   ```bash
   git clone https://github.com/johanneslanger/aws-workshop-starter-kit.git
   cd aws-workshop-starter-kit
   ```
2. **Open the README for your workshop style** and follow its setup:
   - 🎓 **Guided — learning:** work through notebooks with an agent tutor, at your own pace. → [`bundles/guided/`](bundles/guided/)
   - 🛠️ **Building — hackathon:** a team builds from scratch: align → mob-grill → slice → divide → build. → [`bundles/building/`](bundles/building/)

## What's in the box

```
install/            Install the agent (Claude Code) + wire it to Bedrock — shared by both paths
bundles/guided/     Learning path: notebook tutor
bundles/building/   Hackathon path: mob-grill → slice → divide → build, as a team
addons/websearch/   Optional: give the agent web search (Bedrock has none built in)
```

## More

- Install details, troubleshooting, region and model notes → [`install/README.md`](install/README.md)
- Running the workshop? Each bundle has a `docs/` facilitator playbook.
- License: MIT-0 ([`LICENSE`](LICENSE)) · third-party notices in [`NOTICE`](NOTICE)
