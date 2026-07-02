# Team build conventions

Instructions for the coding agent during a hackathon-style workshop where a **team** builds something together in one repo. Defaults for building fast, in parallel, without stepping on each other.

## Working as a team

- One shared repo. Work is tracked as vertical-slice issues in the `issues/` folder (see the `to-issues` skill).
- Build one slice at a time, end-to-end. A slice is done when it's demoable on its own.
- Before starting a slice, set its issue to `status: doing`; set `done` when it lands. Don't grab an issue whose `blocked_by` aren't done yet.
- Keep slices independent so teammates aren't blocked on your in-progress work.

## Working style

- Move fast, but confirm before large or destructive changes (deleting files, rewriting a module, changing dependencies).
- Work in small, verifiable steps. Get one thing running before adding the next.
- Simplest thing that works. This is a hackathon, not production, no premature abstraction.
- Stuck after a couple of attempts? Step back and say so instead of thrashing.

## AWS

- This environment uses Amazon Bedrock. In a workshop account, credentials are already set, don't ask for API keys. In your own account, make sure your Bedrock model access is configured.
- Look up AWS behavior, APIs, and quotas with the **AWS Knowledge MCP** (pre-wired in `.mcp.json`) instead of relying on memory. Verify, don't guess.
- Prefer read/describe/list over mutating calls when exploring.

## Before you build

- Align first: mob-grill the idea with **grill-me**, write it up with **to-prd** (a short `PRD.md`), then **to-issues** to slice the PRD. Ten minutes of alignment saves hours of rework and merge pain.
- Build against `PRD.md` and the `issues/` files, they're the shared source of truth.

## Testing

- Add a quick test or runnable check as you go. "It compiles" is not "it works."
- Show the command you ran and its output when you claim something works.

## Housekeeping

- Keep secrets out of the repo and out of chat.
- Don't commit `.claude/` or local settings.
