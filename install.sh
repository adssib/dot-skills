#!/bin/bash

# dotskills installer
# Symlinks your skills into a project so Claude Code can see them.
#
# Usage: ./install.sh ~/projects/atlas-mcp

set -e

DOTSKILLS_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_LINK_NAME=".claude-skills"

if [ -z "$1" ]; then
    echo "Usage: ./install.sh <project-path>"
    echo ""
    echo "Creates a symlink at <project>/${SKILLS_LINK_NAME} → this repo"
    echo "so Claude Code picks up your skills automatically."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: $1 is not a directory"
    exit 1
fi

target="$1/$SKILLS_LINK_NAME"

ln -sfn "$DOTSKILLS_DIR" "$target"

echo "Linked: $target → $DOTSKILLS_DIR"
echo ""
echo "Add to your .gitignore:"
echo "  ${SKILLS_LINK_NAME}"