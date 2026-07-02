# Workshop Starter Kit — Claude Code on Amazon Bedrock

Get [Claude Code](https://docs.claude.com/en/docs/claude-code) running in your AWS workshop in about two minutes, powered by Amazon Bedrock. No API keys, it uses the credentials your workshop account already has.

## Get started

**1. Clone this repo** in your workshop terminal (JupyterLab or the Code Editor instance):

```bash
git clone <repo-url> && cd workshop-starter-kit
```

**2. Install Claude Code:**

```bash
bash install/install-claude-code.sh
```

Then start it with `claude`. (First run may take a moment.)

**3. Pick your workshop type** and follow that bundle's short setup:

| Your workshop is… | Go to | What you get |
|---|---|---|
| **Notebook / learning** | [`bundles/guided/`](bundles/guided/) | A tutor that walks you through the notebooks |
| **Hackathon / builder** | [`bundles/hackathon/`](bundles/hackathon/) | Build-mode setup, AWS docs on tap, an idea stress-tester |

That's it.

## More

- Install details, troubleshooting, region and model notes → [`install/README.md`](install/README.md)
- Optional live web search → [`addons/websearch/`](addons/websearch/)
- License: MIT ([`LICENSE`](LICENSE)) · third-party notices in [`NOTICE`](NOTICE)
