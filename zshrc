# =========================
# PATH
# =========================

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Local binaries
. "$HOME/.local/bin/env"


# =========================
# Aliases
# =========================

alias ls='ls -GFh'
#alias cat='bat'

# macOS BSD ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"


# =========================
# fzf
# =========================

# Configure fzf preview using bat with line numbers and syntax highlighting
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :50 {} 2>/dev/null || cat {}'"

source <(fzf --zsh)


# =========================
# zoxide
# =========================

# Initialize zoxide (smart cd replacement)
eval "$(zoxide init zsh)"


# =========================
# Zsh plugins
# =========================

source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Ghostty maps Cmd-Shift-. (>) to Ctrl-F. Use it to accept the inline
# autosuggestion, matching the Copilot acceptance shortcut in Neovim.
bindkey '^F' autosuggest-accept

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
