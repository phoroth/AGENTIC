# AGENTS.md - Agentic OS Knowledge & Skill Installation Guide

Welcome, AI Agent! This file is specifically crafted for AI coding assistants (Gemini Antigravity, Claude Code, OpenCode, Codex, Cursor, and Zed) reading this repository.

---

## 🎯 Repository Purpose

This repository (**AGENTIC**) contains a massive library of **1,590+ specialized agent skills** and **5 plugin bundles**.

- **Skills Directory**: `skills/`
- **Plugins Directory**: `plugins/`
- **Install Manifest**: `skills/.antigravity-install-manifest.json`

---

## ⚡ Automated Installation Instructions for AI Agents

If a user asks you to install the skills from this repository, run the appropriate automated script for the user's OS:

### 1. Windows (PowerShell)
```powershell
iwr -useb https://raw.githubusercontent.com/phoroth/AGENTIC/main/install.ps1 | iex
```
*Or locally inside this repo:*
```powershell
.\install.ps1
```

### 2. macOS & Linux (Bash)
```bash
curl -fsSL https://raw.githubusercontent.com/phoroth/AGENTIC/main/install.sh | bash
```
*Or locally inside this repo:*
```bash
chmod +x install.sh && ./install.sh
```

---

## 🛠️ Manual Installation Protocol for Agents

If automated scripts are blocked or permissions prevent running `iex`, copy the `skills` and `plugins` directories manually to the target agent config path:

### Target Locations:
- **Gemini Antigravity**: `$HOME/.gemini/config/skills` and `$HOME/.gemini/config/plugins`
- **Claude Code**: `$HOME/.claude/skills` and `$HOME/.claude/plugins`
- **OpenCode / Codex**: `$HOME/.config/opencode/skills` or `$HOME/.codex/skills`

### PowerShell Command:
```powershell
$targetDir = "$HOME\.gemini\config"
New-Item -ItemType Directory -Force -Path "$targetDir\skills", "$targetDir\plugins"
Copy-Item -Path ".\skills\*" -Destination "$targetDir\skills" -Recurse -Force
Copy-Item -Path ".\plugins\*" -Destination "$targetDir\plugins" -Recurse -Force
```

### Bash Command:
```bash
TARGET_DIR="$HOME/.gemini/config"
mkdir -p "$TARGET_DIR/skills" "$TARGET_DIR/plugins"
cp -R skills/* "$TARGET_DIR/skills/"
cp -R plugins/* "$TARGET_DIR/plugins/"
```

---

## 📋 Discovering Skills

Each skill directory inside `skills/<skill-name>/` contains a `SKILL.md` file defining its YAML frontmatter (name, description, triggers) and operational instructions.

To inspect available skills and verify installation:
- Check `skills/.antigravity-install-manifest.json` for a complete JSON list of all 1,590+ skill entry identifiers.
