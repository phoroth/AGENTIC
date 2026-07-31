#!/bin/bash
TARGET="${1:-all}"
TMP_DIR="$HOME/AGENTIC-tmp"

rm -rf "$TMP_DIR"
echo "Cloning AGENTIC repository..."
git clone https://github.com/phoroth/AGENTIC.git "$TMP_DIR"

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
    cp -R "$TMP_DIR/skills/"* "$dir/skills/" 2>/dev/null || true
    cp -R "$TMP_DIR/plugins/"* "$dir/plugins/" 2>/dev/null || true
done

rm -rf "$TMP_DIR"
echo "Installation complete for all AI agent harnesses! Restart your AI agent to load the new skills."
