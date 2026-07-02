# Add web search to Claude Code

## Why you'd want this

Claude Code on Bedrock **can't search the web out of the box**, the built-in WebSearch tool isn't available on Bedrock ([docs](https://docs.claude.com/en/docs/claude-code/amazon-bedrock)). So by default the agent can't look anything up online: library docs, error messages, changelogs, current APIs, anything outside its training data.

This add-on gives Claude Code a web search tool, backed by Amazon Bedrock AgentCore's managed Web Search.

**Why it matters for a hackathon:** it's not just convenience. With web search, the agent can **ground its answers in current internet sources** instead of leaning on training-data memory that may be stale or made up. Better-grounded answers mean fewer wrong API signatures, fewer hallucinated library methods, and less time lost debugging confident-but-wrong suggestions.

> **This is not the same as the AWS Knowledge MCP.** The building bundle already wires in the AWS Knowledge MCP, which covers **AWS** documentation. This add-on covers the **open web** (everything else). Add it when your build needs live info beyond AWS docs.

## What it costs to set up

Heads up before you start, unlike the rest of the kit, this one deploys infrastructure:

- **Deploys an AgentCore Gateway + IAM role** via CloudFormation (`--capabilities CAPABILITY_IAM`).
- **us-east-1 only** — the managed Web Search capability lives there. Simplest when your workshop runs in us-east-1.
- **~$7 per 1,000 queries**, billed to the account.
- It's an AWS **sample**, explicitly not for production.

## How to install — just ask Claude

You don't run any setup scripts yourself. Point Claude Code at the repo and let it do the work:

> **Clone https://github.com/aws-samples/sample-agentcore-websearch-agent-skill, read its `AGENTS.md`, and set up web search for me.**

Claude clones the repo, deploys the AgentCore Gateway (a CloudFormation stack), and wires the web search tool into itself, following the repo's own instructions. When it's done, just ask it to **search the web**.

If you're running with `--dangerously-skip-permissions` (the hackathon default), Claude deploys that infrastructure without stopping to ask, so make sure you're in a sandboxed workshop account before you run the prompt.

We don't vendor the code here on purpose, it's maintained upstream, so Claude always follows the current instructions.
