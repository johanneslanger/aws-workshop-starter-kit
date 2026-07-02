# Build-mode conventions

Instructions for the coding agent during a hackathon / builder workshop. These are the defaults for building something from scratch under time pressure.

## Working style

- Move fast, but confirm before large or destructive changes (deleting files, rewriting a module, changing dependencies).
- Work in small, verifiable steps. Get one thing running before adding the next.
- Prefer the simplest thing that works. This is a hackathon, not production, no premature abstraction.
- When stuck for more than a couple of attempts, step back and say so instead of thrashing.

## AWS and Bedrock

- This environment uses Amazon Bedrock via the account's temporary IAM credentials. Don't ask for API keys.
- Look up AWS service behavior, APIs, and quotas with the **AWS Knowledge MCP** (pre-wired in `.mcp.json`) rather than relying on memory. AWS moves fast; verify.
- Prefer least-privilege and read/describe/list calls over mutating calls when exploring.

## Before you build

- If the idea is fuzzy, run the **grill-me** skill first to pressure-test the design before writing code. Ten minutes of grilling saves an hour of rework.

## Testing

- Add a quick test or a runnable check as you go. "It compiles" is not "it works."
- Show the command you ran and its output when you claim something works.

## Housekeeping

- Keep secrets out of the repo and out of chat.
- Don't commit `.claude/` or local settings.
