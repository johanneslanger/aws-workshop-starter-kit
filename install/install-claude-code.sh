#!/usr/bin/env bash
#
# Install Claude Code for an AWS workshop.
# Verified against https://docs.claude.com/en/docs/claude-code/setup (2026-07-01).
#
# This installs Claude Code. Connecting it to Amazon Bedrock happens on the
# first `claude` run via the built-in wizard, see install/README.md.

set -euo pipefail

echo "==> Installing Claude Code (native installer)…"
curl -fsSL https://claude.ai/install.sh | bash

# The native installer drops the binary in ~/.local/bin.
export PATH="$HOME/.local/bin:$PATH"

echo "==> Verifying…"
if ! claude --version; then
  echo "ERROR: 'claude' not found on PATH." >&2
  echo "Add \$HOME/.local/bin to your PATH, then run 'claude --version'." >&2
  exit 1
fi

echo
echo "==> Claude Code installed."
echo "    Next: run 'claude' and connect it to Amazon Bedrock in the first-run"
echo "    wizard (choose: 3rd-party platform → Amazon Bedrock). See install/README.md."
