# Running a guided (notebook) workshop

A short playbook for facilitators using the tutor with a notebook-based workshop.

## Before the workshop

1. Confirm the workshop repo has a top-level `README.md` and notebooks the tutor can read.
2. Make sure the Workshop Studio environment (JupyterLab or Code Editor) has terminal access.
3. Test the flow yourself: run `install/install-claude-code.sh`, copy the tutor skill, open the workshop repo, and say "teach me this workshop."

## Attendee steps

1. Open a terminal in the workshop environment.
2. Run the installer:
   ```bash
   bash install/install-claude-code.sh
   ```
3. Copy the tutor skill:
   ```bash
   mkdir -p ~/.claude/skills && cp -r skills/tutor ~/.claude/skills/aws-workshop-tutor
   ```
4. `cd` into the workshop repo, run `claude`, and say **"teach me this workshop."**

## Facilitation tips

- The tutor is Socratic. Encourage attendees to attempt the comprehension-check answers before asking for the solution.
- If a notebook needs infrastructure deployed first, the tutor flags it, but call it out in your intro too so nobody hits a wall.
- Attendees can jump between notebooks; the tutor tracks the overall arc and recommends the next one.

## What this bundle does NOT do

- It doesn't deploy the workshop infrastructure. That's the workshop's own job.
- It doesn't pin models. See [`../../install/README.md`](../../install/README.md).
