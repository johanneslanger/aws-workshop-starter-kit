#!/usr/bin/env bash
#
# Install Claude Code and point it at Amazon Bedrock for an AWS workshop.
#
# Verified against the official docs on 2026-07-01:
#   - Install:  https://docs.claude.com/en/docs/claude-code/setup
#   - Bedrock:  https://docs.claude.com/en/docs/claude-code/amazon-bedrock
#
# In a Workshop Studio environment the account already has temporary IAM
# credentials, so no API key is needed. This script only installs Claude Code
# and tells it to use Bedrock. It deliberately does NOT pin model IDs — see
# install/README.md for why.

set -euo pipefail

echo "==> Installing Claude Code (native installer)…"
curl -fsSL https://claude.ai/install.sh | bash

# The native installer drops the binary in ~/.local/bin. Make sure it's on
# PATH for the rest of this script.
export PATH="$HOME/.local/bin:$PATH"

echo "==> Verifying installation…"
if ! claude --version; then
  echo "ERROR: 'claude' not found on PATH." >&2
  echo "Add \$HOME/.local/bin to your PATH, then run 'claude --version'." >&2
  exit 1
fi

# --- Bedrock wiring -------------------------------------------------------
# Region resolution: honor an already-set AWS_REGION / AWS_DEFAULT_REGION,
# otherwise fall back to us-east-1 (the broadest Bedrock model coverage).
: "${AWS_REGION:=${AWS_DEFAULT_REGION:-us-east-1}}"

# Persist for future shells. Workshop Studio terminals are bash by default;
# zsh users should copy these two lines into ~/.zshrc instead.
RC_FILE="$HOME/.bashrc"
if ! grep -q "CLAUDE_CODE_USE_BEDROCK" "$RC_FILE" 2>/dev/null; then
  {
    echo ""
    echo "# --- AWS workshop: Claude Code on Bedrock ---"
    echo "export CLAUDE_CODE_USE_BEDROCK=1"
    echo "export AWS_REGION=${AWS_REGION}"
  } >> "$RC_FILE"
fi

# …and for the current shell.
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION="${AWS_REGION}"

echo
echo "==> Done. Claude Code will use Amazon Bedrock in region: ${AWS_REGION}"
echo "    Start it with:  claude"
echo
echo "    Region note: Claude Code's built-in default is a US (us.) inference"
echo "    profile. If your workshop account is in eu-* or ap-* and the startup"
echo "    model check fails, run 'claude' and pick a region-appropriate model"
echo "    in the wizard (it auto-detects what your account can invoke), or set"
echo "    an eu./apac. profile override. See install/README.md."
