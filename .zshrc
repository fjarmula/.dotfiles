# =========================
# Environment & Editors
# =========================

export EDITOR="nvim"
export VISUAL="nvim"

# macOS BSD ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"


# =========================
# PATH Configuration
# =========================

# Homebrew (Hardcoded path avoids running `brew --prefix` on every shell startup)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# asdf version manager
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Local binaries
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"


# =========================
# Aliases
# =========================

alias ls='ls -GFh'


# =========================
# Core Tools Setup
# =========================

# Starship prompt
eval "$(starship init zsh)"

# Zoxide (smart cd replacement)
eval "$(zoxide init zsh)"

# Initialize command completion before fzf
autoload -Uz compinit
compinit

# fzf configuration
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :50 {} 2>/dev/null || cat {}'"
source <(fzf --zsh)


# =========================
# Zsh Plugins (Optimized)
# =========================

HOMEBREW_PREFIX="/opt/homebrew"

# Plugins
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Ghostty keybinding: Map Cmd-Shift-. (>) -> Ctrl-F to accept inline suggestions
bindkey '^F' autosuggest-accept

# Syntax highlighting (Must be loaded last)
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# =========================
# Syntax Highlighting Colors
# =========================

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[command]='fg=#89b4fa,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#f5c2e7,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#89b4fa,bold'
