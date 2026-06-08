#!/bin/bash

# Exit on error
set -e

# Repo root = directory where this script is located
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_NVIM="$REPO_ROOT/nvim"

# Check if source exists
if [ ! -d "$SOURCE_NVIM" ]; then
    echo "Error: Source folder not found: $SOURCE_NVIM" >&2
    exit 1
fi

# Target for Neovim on Unix-like systems
TARGET_NVIM="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

echo "Linking Neovim config..."
echo "  Source: $SOURCE_NVIM"
echo "  Target: $TARGET_NVIM"

# Handle existing target
if [ -e "$TARGET_NVIM" ] || [ -L "$TARGET_NVIM" ]; then
    # Check if it's already a symbolic link pointing to our source
    if [ -L "$TARGET_NVIM" ] && [ "$(readlink -f "$TARGET_NVIM")" = "$SOURCE_NVIM" ]; then
        echo "Already linked. Nothing to do."
        exit 0
    fi

    # Backup existing config (directory or file)
    TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
    BACKUP="${TARGET_NVIM}.backup.$TIMESTAMP"
    echo "Target exists; moving to backup: $BACKUP"
    mv "$TARGET_NVIM" "$BACKUP"
fi

# Ensure the parent directory (~/.config) exists
mkdir -p "$(dirname "$TARGET_NVIM")"

# Create the symbolic link
ln -s "$SOURCE_NVIM" "$TARGET_NVIM"

echo "Done."

echo "Now installing agent skills to ~/.config/opencode/skills"
git clone ssh://git@codeberg.org/MordechaiHadad/skills.git ~/.config/opencode/skills
