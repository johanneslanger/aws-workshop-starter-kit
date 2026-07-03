---
name: handoff
description: Compact the current conversation into a handoff document another agent or teammate can pick up from. Use when a session gets long or you're passing work to someone else.
argument-hint: "What will the next session be used for?"
disable-model-invocation: true
---

Write a handoff document summarising the current conversation so a fresh agent, or a teammate, can continue the work.

Save it to a `handoffs/` directory in the repo root (create it if it doesn't exist), with a timestamped filename like `handoffs/2026-07-02-1430-short-topic.md`. Keeping it in the shared repo is the point, a teammate on their own machine can pick it up.

Include a "suggested skills" section listing which skills the next session should invoke. Reference existing artifacts (`PRD.md`, the `issues/` files, commits, diffs) by path instead of duplicating them. Redact any secrets or personal information.

If the user passed arguments, treat them as a description of what the next session will focus on and tailor the doc accordingly.
