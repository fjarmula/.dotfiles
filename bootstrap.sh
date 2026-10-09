#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/fjarmula/dotfiles.git"

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
mkdir -p ~/.config/ghostty

# Usuń domyślne pliki/stare linki, aby uniknąć błędów nadpisywania
rm -f ~/.zshrc ~/.config/starship.toml ~/.config/ghostty/config ~/.ideavimrc
rm -rf ~/.config/nvim

ln -sfn "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sfn "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES_DIR/.config/ghostty/config" ~/.config/ghostty/config
ln -sfn "$DOTFILES_DIR/.ideavimrc" ~/.ideavimrc
ln -sfn "$DOTFILES_DIR/.config/nvim" ~/.config/nvim

echo "Setup completed successfully."
