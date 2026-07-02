---
name: to-prd
description: Turn the current conversation (e.g. a grill-me session) into a short PRD, no interview, just synthesis of what you already agreed. Use when you say "write a PRD", "write it up", "capture this", or after aligning on what to build and before slicing into issues.
---

# To PRD

> Adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (to-prd),
> MIT licensed (see `LICENSE` in this folder). Modified for hackathon use: writes a
> short PRD to the local repo, and drops the issue-tracker / label / glossary / ADR
> conventions.

Take the current conversation, usually the outcome of a `grill-me` session, and synthesize it into a short PRD. **Don't interview the user again**, just write up what you already agreed.

## Process

1. Work from what's already in context (the grill-me discussion, any plan). Explore the repo only if you need to understand the current state.
2. Write a `PRD.md` in the repo root using the template below. Keep it short, this is a hackathon, not a spec review.

## Template

```markdown
# <Project> — PRD

## Problem
The problem you're solving, from the user's perspective.

## Solution
The solution, from the user's perspective. One or two paragraphs.

## Key decisions
What you settled during grilling: scope, approach, what's explicitly out of scope, tradeoffs you chose. This is the context that keeps the team (and future sessions) aligned.

## User stories
A numbered list of user stories, each a thin, demoable capability.
```

The PRD is the shared source of truth for the build. Next, run `to-issues` to slice it into issues, each will reference this PRD so every slice carries its context.
