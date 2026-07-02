@AGENTS.md

## Claude Code

The build conventions above are the source of truth (shared with other agents via `AGENTS.md`). Claude Code reads them through this import.

- Use plan mode for anything that touches more than a couple of files.
- The `grill-me` skill lives in `skills/grill-me/`, invoke it when the builder wants to pressure-test an idea.
