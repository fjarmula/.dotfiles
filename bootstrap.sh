#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/fjarmula/dotfiles.git"

echo "Starting environment deployment..."

# 1. Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    if [[ -d "/opt/homebrew/bin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -d "/usr/local/bin" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# 2. Clone dotfiles repository if not present
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository from GitHub..."
    mkdir -p "$(dirname "$DOTFILES_DIR")"
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# 3. Pull latest changes if repository already exists
if [ -d ".git" ]; then
    echo "Pulling latest changes from remote repository..."
    git pull --rebase origin main
fi

# 4. Install dependencies via Homebrew Bundle
if [ -f "Brewfile" ]; then
    echo "Installing dependencies from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

# 5. Create required directories and symlinks
echo "Creating symlinks..."
mkdir -p ~/.config/ghostty

ln -sfn "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sfn "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES_DIR/ghostty-config" ~/.config/ghostty/config
ln -sfn "$DOTFILES_DIR/.ideavimrc" ~/.ideavimrc

# Verification step
if [ -L ~/.zshrc ] && [ -L ~/.config/starship.toml ] && [ -L ~/.config/ghostty/config ]; then
    echo "Verification successful: Symlink targets confirmed."
else
    echo "Verification failed: One or more symlinks could not be established." >&2
    exit 1
fi

echo "Environment setup completed successfully."
