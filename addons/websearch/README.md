# Add web search to Claude Code

## Why

Claude Code on Bedrock **can't search the web**, the built-in WebSearch tool isn't available on Bedrock ([docs](https://docs.claude.com/en/docs/claude-code/amazon-bedrock)). Out of the box the agent runs on training-data memory alone.

Adding web search lets it **ground answers in live sources** instead of stale or made-up memory: fewer wrong API signatures, fewer hallucinated library methods, less time debugging confident-but-wrong suggestions. It's backed by Amazon Bedrock AgentCore's managed Web Search.

> **Not the same as the AWS Knowledge MCP.** The building bundle already wires in the AWS Knowledge MCP for **AWS** docs. This covers the **open web**, everything else.

## Before you start

Unlike the rest of the kit, this deploys infrastructure into your account:

- An AgentCore Gateway + IAM role, via CloudFormation.
- **us-east-1 only**, that's where the managed Web Search capability lives.
- It's an AWS sample, not for production.

## Install — just ask Claude

Point Claude Code at the repo and let it do the work:

> **Clone https://github.com/aws-samples/sample-agentcore-websearch-agent-skill, read its `AGENTS.md`, and set up web search for me. Just deploy, don't ask for permission.**

Claude clones the repo, deploys the gateway, and wires the tool into itself. When it's done, just ask it to **search the web**.

With `--dangerously-skip-permissions` (the hackathon default) Claude deploys without asking, so be in a sandboxed workshop account first.
