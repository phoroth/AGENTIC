#!/bin/bash
INSTALL_DIR="$HOME/.gemini/config"
echo "Installing AGENTIC Skills to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR/skills" "$INSTALL_DIR/plugins"
git clone https://github.com/phoroth/AGENTIC.git "$HOME/AGENTIC-tmp"
cp -R "$HOME/AGENTIC-tmp/skills/"* "$INSTALL_DIR/skills/" 2>/dev/null || true
cp -R "$HOME/AGENTIC-tmp/plugins/"* "$INSTALL_DIR/plugins/" 2>/dev/null || true
rm -rf "$HOME/AGENTIC-tmp"
echo "Installation complete! Restart your AI agent to load the new skills."
