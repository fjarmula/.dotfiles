# Dotfiles

Personal environment configurations for macOS, managed via Zsh, Starship, Ghostty, Neovim, and IdeaVim.

## Quick Installation

Deploy the environment on a fresh macOS installation:

```bash
curl -fsSL https://raw.githubusercontent.com/fjarmula/dotfiles/main/bootstrap.sh | bash
```

## Standard Installation

### 1. Clone the repository

```bash
git clone https://github.com/fjarmula/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Run the bootstrap script

```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

### 3. Restore Homebrew packages

```bash
brew bundle --file=Brewfile
```

## Reference

A complete reference for Neovim keymaps, LSP bindings, and terminal integration is available in `cheatsheet.vim`.