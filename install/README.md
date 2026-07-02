# Install Claude Code on Amazon Bedrock

Works off the temporary AWS credentials your workshop account already has. No API key.

## Install

In your workshop terminal:

```bash
bash install/install-claude-code.sh
claude
```

The script installs Claude Code, points it at Bedrock, and sets your region. Start `claude` and you're in.

Prefer to install by hand (or want to pick a specific model)? Use the wizard:

```bash
curl -fsSL https://claude.ai/install.sh | bash
claude   # then choose: 3rd-party platform → Amazon Bedrock
```

The wizard detects your region and the models your account can invoke, and pins them for you. Re-run it anytime with `/setup-bedrock`.

---

## Troubleshooting & advanced

<details>
<summary>Using zsh instead of bash</summary>

The script appends two `export` lines to `~/.bashrc`. On zsh, copy them into `~/.zshrc`.
</details>

<details>
<summary>"Model not available" / your workshop isn't in the US</summary>

Claude Code's built-in default is a **US** (`us.`) cross-region inference profile. In an `eu-*` or `ap-*` account it may not be invocable, so the startup model check fails. Fix either way:

- Run `claude` and let the wizard pick a region-appropriate model, or
- Export a regional override, e.g. `export ANTHROPIC_DEFAULT_SONNET_MODEL='eu.anthropic.claude-sonnet-4-6'` (use a model ID enabled in your account).
</details>

<details>
<summary>Why the kit pins no model IDs</summary>

On purpose, so it never goes stale. Claude Code ships its own current Bedrock default and verifies availability at startup (falling back if needed). The login wizard discovers what's available per account and region. Nothing here to keep up to date.
</details>

<details>
<summary>Sonnet 5</summary>

Served through the separate **Mantle** endpoint (`CLAUDE_CODE_USE_MANTLE=1`, `anthropic.claude-sonnet-5` ID format) and requires account allowlisting. An advanced opt-in, not the workshop default.
</details>

<details>
<summary>Prerequisites</summary>

- Anthropic models enabled in Bedrock for your account.
- IAM: `bedrock:InvokeModel`, `bedrock:InvokeModelWithResponseStream`, `bedrock:ListInferenceProfiles`, `bedrock:GetInferenceProfile`.
</details>

Sources: [Claude Code setup](https://docs.claude.com/en/docs/claude-code/setup) · [Claude Code on Amazon Bedrock](https://docs.claude.com/en/docs/claude-code/amazon-bedrock)
