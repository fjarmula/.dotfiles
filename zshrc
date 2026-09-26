# =========================
# PATH
# =========================

# Homebrew and applications
export PATH="/opt/homebrew/bin:/Applications/RubyMine.app/Contents/MacOS:$PATH"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Local binaries
. "$HOME/.local/bin/env"


# =========================
# Aliases
# =========================

alias ls='ls -GFh'

# macOS BSD ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"


# =========================
# fzf
# =========================

source <(fzf --zsh)


# =========================
# Zsh plugins
# =========================

source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Syntax highlighting should be loaded after other Zsh plugins
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# =========================
# Syntax highlighting colors
# =========================

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[command]='fg=#89b4fa,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#f5c2e7,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#89b4fa,bold'


# =========================
# Prompt
# =========================

eval "$(starship init zsh)"