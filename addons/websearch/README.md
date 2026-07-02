# Add-on: Web search for Claude Code on Bedrock

Claude Code on Bedrock has **no built-in WebSearch tool** ([docs](https://docs.claude.com/en/docs/claude-code/amazon-bedrock)). If your workshop needs the agent to search the live web, add the AgentCore Web Search tool.

We don't vendor the code here, it's maintained upstream. Point Claude Code (or the attendee) at the sample and follow its own instructions:

> **Repo:** [`aws-samples/sample-agentcore-websearch-agent-skill`](https://github.com/aws-samples/sample-agentcore-websearch-agent-skill) (MIT-0)
>
> Easiest install: tell Claude Code to clone that repo and follow its `AGENTS.md`.

## Before you enable it — read this

This add-on is heavier than the rest of the kit. Attendees should know what they're opting into:

- **It deploys infrastructure.** Following the repo runs `aws cloudformation deploy --capabilities CAPABILITY_IAM`, creating an AgentCore Gateway + IAM role in the account. If you have Claude Code run it, Claude Code is executing that deploy, make sure the attendee is aware.
- **us-east-1.** The managed Web Search capability lives in `us-east-1`, so the gateway must be deployed there. Simplest when your workshop runs in us-east-1. (Cross-region calling is technically possible but out of scope for this kit.)
- **It costs money:** ~$7 per 1,000 queries, billed to the workshop account.
- It's an AWS **sample**, explicitly "not for production."

## Two ways to wire it into Claude Code

Both come from the upstream repo after you deploy the gateway:

- **Skill:** `cp -r skills/agentcore-websearch ~/.claude/skills/` (needs the repo's CLI installed).
- **MCP server (simplest):** `claude mcp add agentcore-websearch -- uvx mcp-proxy-for-aws "$GATEWAY_URL" --region us-east-1`

Then ask Claude Code to "search the web with agentcore."

See the upstream repo's `README.md` and `AGENTS.md` for the full deploy/teardown steps.
