# Install Claude Code on Amazon Bedrock

Works off the temporary AWS credentials your workshop account already has. No API key.

## 1. Install Claude Code

In your workshop terminal:

```bash
bash install/install-claude-code.sh
```

(Or directly: `curl -fsSL https://claude.ai/install.sh | bash`.)

## 2. Connect it to Bedrock (first-run wizard)

Start the agent:

```bash
claude
```

The first time, Claude Code walks you through a short setup. Choose these options in order:

1. At the login prompt → **3rd-party platform**
2. → **Amazon Bedrock**
3. For authentication → **credentials already in your environment** (a workshop account sets these for you). On your own account, pick the AWS profile or access key you normally use.
4. Let Claude Code **auto-detect the available models**, it lists the models your account can invoke in your region, so you don't hand-pick IDs.
5. When it offers the **1M-token context window**, take it. Long hackathon and tutor sessions run much further before they have to compact. (See the 1M note below for which models support it.)

You only do this once; Claude Code remembers it. Re-run the setup anytime with `/setup-bedrock`.

---

## Troubleshooting & advanced

<details>
<summary>"Model not available" / your workshop isn't in the US</summary>

The wizard verifies which models your account can invoke and adapts to your region, so this usually just works. If a model looks missing, make sure Anthropic models are enabled in the Bedrock console for your account and region.
</details>

<details>
<summary>1M-token context window</summary>

The wizard offers a 1M context option when it pins models, worth taking for long sessions. Supported on **Claude Sonnet 4.6**, **Opus 4.6 and later**, and **Sonnet 5** (Sonnet 5 always runs at 1M via the Mantle endpoint, with no variant to select). If you pin a model by hand instead, append `[1m]` to the model ID to enable it.
</details>

<details>
<summary>Why the kit pins no model IDs</summary>

On purpose, so it never goes stale. The wizard discovers the models available in your account and region at setup time, and Claude Code advances its own defaults as it updates. Nothing here to keep up to date.
</details>

<details>
<summary>Sonnet 5</summary>

Served through the separate **Mantle** endpoint (`CLAUDE_CODE_USE_MANTLE=1`) and requires account allowlisting. An advanced opt-in, not the workshop default.
</details>

<details>
<summary>Prerequisites</summary>

- Anthropic models enabled in Bedrock for your account.
- IAM: `bedrock:InvokeModel`, `bedrock:InvokeModelWithResponseStream`, `bedrock:ListInferenceProfiles`, `bedrock:GetInferenceProfile`.
</details>

<details>
<summary>Skip the wizard (fully scripted setup)</summary>

For an unattended setup, export the Bedrock env vars in the shell **before** running `claude`, then it goes straight to Bedrock with no wizard:

```bash
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=us-east-1   # your workshop region
claude
```

These must be set in the same shell that runs `claude`. Writing them to `~/.bashrc` only affects **new** terminals, that's why running the install script and then `claude` in the same shell still shows the wizard.
</details>

Sources: [Claude Code setup](https://docs.claude.com/en/docs/claude-code/setup) · [Claude Code on Amazon Bedrock](https://docs.claude.com/en/docs/claude-code/amazon-bedrock)
