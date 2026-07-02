---
name: grill-me
description: Stress-test a plan or design by interviewing you relentlessly until you reach shared understanding. Walks each branch of the decision tree, resolving dependencies one at a time. Use when you say "grill me", "stress test this", "poke holes", "challenge my design", or want your hackathon idea pressure-tested before you build.
---

# Grill Me

> Adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (grill-me),
> MIT licensed (see `LICENSE` in this folder). Modified for AWS workshop / hackathon use.

## Overview

Interview the builder about every aspect of their plan or design until reaching shared understanding. Walk down each branch of the decision tree, resolving dependencies between decisions one at a time. In a hackathon, this is the "think before you build" step, it catches the load-bearing assumptions before code gets written.

## Workflow

### 1. Understand the plan

Read and internalize the idea before asking anything.

- If the plan references files, code, or docs, read them before starting questions.
- Identify the key decision branches and dependencies before the first question.
- Mentally map the decision tree: what depends on what, where the load-bearing assumptions are.

### 2. Interrogate

Ask probing questions one at a time. For each, provide your own recommended answer.

- Ask **one** question at a time, then wait for the answer.
- Always include your recommended answer, this makes it a collaborative design session, not an interrogation.
- Resolve dependencies: if decision B depends on decision A, ask A first.
- If a question can be answered by exploring the code or docs, explore instead of asking.
- Start with the highest-leverage questions: foundational assumptions, scope boundaries, key tradeoffs.
- Don't ask questions already answered in the plan.
- Push back when an answer has gaps or contradictions, but stay constructive.

### 3. Converge

When all branches are resolved, summarize the shared understanding and the open items. Offer to write the resolved plan to a file so the builder has a spec to start from.

## Tone

- Direct and specific. Concrete beats vague.
- Constructive, you're helping them build, not blocking them.
- One clear question beats three fuzzy ones.
