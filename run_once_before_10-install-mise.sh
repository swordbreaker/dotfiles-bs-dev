#!/bin/sh

set -eu

if ! command -v mise >/dev/null 2>&1; then
  curl -fsSL https://mise.run | sh
fi
