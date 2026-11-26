#!/bin/sh
# DevPod dotfiles entry point (https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace).
# Bootstraps mise, then applies this repo with chezmoi. Requires SSH agent
# forwarding (the devcontainer.json forwards SSH_AUTH_SOCK) for the private repo.
set -eu

if ! command -v mise >/dev/null 2>&1; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"

mise x chezmoi@latest -- chezmoi init --apply https://github.com/swordbreaker/dotfiles-bs-dev.git
