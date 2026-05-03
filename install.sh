#!/bin/bash

# dotskills installer
# Symlinks your skills into a project's .claude/skills/ so Claude Code picks them up automatically.
#
# Usage:
#   ./install.sh ~/projects/atlas-mcp          # install all skills
#   ./install.sh ~/projects/atlas-mcp git-setup docs  # install specific skills only

set -e

DOTSKILLS_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -z "$1" ]; then
    echo "Usage: ./install.sh <project-path> [skill1 skill2 ...]"
    echo ""
    echo "Examples:"
    echo "  ./install.sh ~/projects/atlas-mcp"
    echo "  ./install.sh ~/projects/atlas-mcp git-setup docs"
    exit 1
fi

PROJECT_DIR="$1"
shift  # remaining args are skill names, if any

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: $PROJECT_DIR is not a directory"
    exit 1
fi

SKILLS_TARGET="$PROJECT_DIR/.claude/skills"
mkdir -p "$SKILLS_TARGET"

# Collect skills to install
if [ "$#" -gt 0 ]; then
    SKILLS=("$@")
else
    # All subdirectories that contain a SKILL.md
    SKILLS=()
    for dir in "$DOTSKILLS_DIR"/*/; do
        name="$(basename "$dir")"
        if [ -f "$dir/SKILL.md" ]; then
            SKILLS+=("$name")
        fi
    done
fi

# Symlink each skill
installed=0
for skill in "${SKILLS[@]}"; do
    src="$DOTSKILLS_DIR/$skill"
    dst="$SKILLS_TARGET/$skill"

    if [ ! -d "$src" ] || [ ! -f "$src/SKILL.md" ]; then
        echo "  SKIP  $skill — not found or missing SKILL.md"
        continue
    fi

    ln -sfn "$src" "$dst"
    echo "  ✓  $skill → $dst"
    installed=$((installed + 1))
done

echo ""
echo "$installed skill(s) installed into $SKILLS_TARGET"
echo ""
echo "Add to your .gitignore:"
echo "  .claude/skills/"
