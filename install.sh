#!/usr/bin/env bash
# Multi-Model Red-Team Kit installer.
# Clones the upstream PAL MCP server (NOT vendored here) and wires in this
# kit's red-team config. Re-runnable: skips the clone if it already exists.
set -euo pipefail

PAL_REPO="https://github.com/BeehiveInnovations/pal-mcp-server.git"
KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAL_DIR="$KIT_DIR/pal-mcp-server"

echo "==> Multi-Model Red-Team Kit installer"

if [ ! -d "$PAL_DIR/.git" ]; then
  echo "==> Cloning upstream PAL MCP server..."
  git clone --depth 1 "$PAL_REPO" "$PAL_DIR"
else
  echo "==> PAL MCP already cloned, pulling latest..."
  git -C "$PAL_DIR" pull --ff-only || echo "    (skip pull; local changes present)"
fi

echo "==> Running upstream PAL setup (creates .pal_venv, installs deps)..."
if [ -x "$PAL_DIR/run-server.sh" ]; then
  ( cd "$PAL_DIR" && ./run-server.sh ) || {
    echo "    Upstream setup needs attention — see its output above."
  }
fi

if [ ! -f "$PAL_DIR/.env" ]; then
  echo "==> Seeding .env from the kit's red-team preset..."
  cp "$KIT_DIR/.env.example" "$PAL_DIR/.env"
  echo "    Edit $PAL_DIR/.env and add your API keys (need >= 2 providers)."
else
  echo "==> $PAL_DIR/.env already exists, leaving it untouched."
fi

echo
echo "==> Done. Next:"
echo "    1. Edit pal-mcp-server/.env with your keys"
echo "    2. Register the server: see config/claude-code.md or config/claude-desktop.json"
echo "    3. Use the prompts in prompts/ to start red-teaming"
