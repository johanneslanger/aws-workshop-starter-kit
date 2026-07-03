---
name: to-issues
description: Break an agreed plan or PRD into independently-grabbable issues using tracer-bullet vertical slices, written to a simple local issue tracker. Use when you say "turn this into issues", "break this down", "slice this up", "create issues", or have a plan/PRD ready to decompose.
---

# To Issues

Break an agreed plan into **tracer-bullet vertical slices**, each a thin but COMPLETE path through every layer (data, logic, UI, test), demoable on its own. Slices are vertical, not horizontal layers.

By default this writes to a **local tracker**: a folder of markdown files in the current repo. No external issue tracker, no setup, no auth.

## Process

### 1. Start from the PRD (or the plan in context)
If a `PRD.md` exists in the repo root (written by the `to-prd` skill), slice from it, it carries the agreed problem, solution, and implementation decisions. Otherwise use whatever plan is in the conversation (for example a `grill-me` outcome), or a file path the user passes.

### 2. Draft vertical slices
- Each slice cuts end-to-end through all layers, not one horizontal layer.
- A completed slice is demoable or verifiable on its own.
- Keep slices small enough to grab and finish independently.
- Where the PRD has user stories, map slices to them.

### 3. Quiz the user once
Present the proposed slices as a numbered list. For each, show the title and which slices (if any) block it. Ask:
- Is the granularity right (too coarse / too fine)?
- Are the dependencies correct?
- Should any be merged or split?

Iterate until approved. Don't over-slice, a handful of slices beats twenty.

### 4. Write the issues (local tracker — default)
Create an `issues/` folder in the repo root if it doesn't exist. Write one file per slice, named `issues/NNN-short-title.md` with a zero-padded sequential id:

```markdown
---
id: NNN
title: <short descriptive title>
status: todo        # todo | doing | done
blocked_by: []      # ids that must finish first, e.g. [1, 2]
---
Goal: <one sentence>
Done when: <a demoable or verifiable check>
From: <which PRD user story this implements, if there's a PRD>
Notes: <optional>
```

Each issue points back at the PRD so whoever grabs it, or a fresh session via `handoff`, has the context. `ls issues/` is the backlog; the next grabbable slice is any `status: todo` whose `blocked_by` are all `done`.

## Optional: GitHub or GitLab

Only if the user **explicitly** asks ("use GitHub issues" / "use GitLab issues") AND the CLI is available (`gh` or `glab`) with a matching remote: publish each slice as a remote issue instead, using the same Goal / Done-when body and `blocked by #N` references. No label taxonomy, no templates beyond that.

**Never create remote issues without an explicit request**, the default is always the local `issues/` folder.
