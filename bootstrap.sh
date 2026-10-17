#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/fjarmula/.dotfiles.git"

echo "Starting macOS environment setup..."

# 1. Install Homebrew if missing
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi

# 2. Clone or update repository
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    echo "Updating dotfiles repository..."
    git -C "$DOTFILES_DIR" pull --rebase origin main
fi

# 3. Install packages and app
echo "Installing packages and Ghostty..."
brew install \
    asdf \
    starship \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zsh-autocomplete \
    fzf \
    ripgrep \
    bat \
    zoxide \
    fastfetch \
    uv \
    nvim \
    node \
    tree-sitter-cli

brew install --cask \
    ghostty \
    font-jetbrains-mono-nerd-font

# 4. Link configuration files
echo "Creating symlinks..."

# Delete default files/old links to avoid overwriting errors
rm -f ~/.zshrc ~/.config/starship.toml ~/.ideavimrc
rm -rf ~/.config/nvim ~/.config/bat ~/.config/ghostty

# Create symlinks for configuration files
ln -sfn "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sfn "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES_DIR/.ideavimrc" ~/.ideavimrc
ln -sfn "$DOTFILES_DIR/.config/nvim" ~/.config/nvim
ln -sfn "$DOTFILES_DIR/.config/bat" ~/.config/bat
ln -sfn "$DOTFILES_DIR/.config/ghostty" ~/.config/ghostty

echo "Setup completed successfully."
