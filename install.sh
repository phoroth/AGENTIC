#!/bin/bash
TARGET="${1:-all}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -d "$SCRIPT_DIR/skills" ]; then
    SOURCE_DIR="$SCRIPT_DIR"
else
    SOURCE_DIR="$HOME/AGENTIC-tmp"
    rm -rf "$SOURCE_DIR"
    echo "Fetching AGENTIC repository..."
    git clone https://github.com/phoroth/AGENTIC.git "$SOURCE_DIR"
fi

TARGETS=()

if [ "$TARGET" = "all" ] || [ "$TARGET" = "gemini" ]; then
    TARGETS+=("$HOME/.gemini/config")
fi
if [ "$TARGET" = "all" ] || [ "$TARGET" = "claude" ]; then
    TARGETS+=("$HOME/.claude")
fi
if [ "$TARGET" = "all" ] || [ "$TARGET" = "opencode" ]; then
    TARGETS+=("$HOME/.config/opencode")
fi
if [ "$TARGET" = "all" ] || [ "$TARGET" = "codex" ]; then
    TARGETS+=("$HOME/.codex")
fi
if [ "$TARGET" = "all" ] || [ "$TARGET" = "cursor" ]; then
    TARGETS+=("$HOME/.cursor")
fi

for dir in "${TARGETS[@]}"; do
    echo " -> Syncing skills & plugins to $dir..."
    mkdir -p "$dir/skills" "$dir/plugins"
    cp -R "$SOURCE_DIR/skills/"* "$dir/skills/" 2>/dev/null || true
    cp -R "$SOURCE_DIR/plugins/"* "$dir/plugins/" 2>/dev/null || true
done

if [ "$SOURCE_DIR" = "$HOME/AGENTIC-tmp" ]; then
    rm -rf "$SOURCE_DIR"
fi

echo "Installation complete for all AI agent harnesses! Restart your AI agent to load the new skills."
