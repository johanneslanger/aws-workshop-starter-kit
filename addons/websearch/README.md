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

## How to install

Easiest path: tell Claude Code to clone the sample repo and follow its own instructions.

> Clone [`aws-samples/sample-agentcore-websearch-agent-skill`](https://github.com/aws-samples/sample-agentcore-websearch-agent-skill) (MIT-0) and follow its `AGENTS.md`. It deploys the gateway, then wires the tool into Claude Code.

Both ways to connect it come from that repo, after the gateway is deployed:

- **As an MCP server (simplest):**
  ```bash
  claude mcp add agentcore-websearch -- uvx mcp-proxy-for-aws "$GATEWAY_URL" --region us-east-1
  ```
- **As a skill:** `cp -r skills/agentcore-websearch ~/.claude/skills/` (needs the repo's CLI installed)

Then just ask the agent to **search the web**, no need to name the tool.

We don't vendor the code here on purpose, it's maintained upstream, so you always follow the current instructions.
