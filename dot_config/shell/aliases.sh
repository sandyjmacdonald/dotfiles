# ~/.config/shell/aliases.sh — shared across zsh & bash

# Prefer modern tools, fall back if missing (functions safer than aliases)
df() { command -v duf  >/dev/null 2>&1 && duf  "$@" || command df "$@"; }
du() { command -v dust >/dev/null 2>&1 && dust "$@" || command du "$@"; }

alias ls='eza -lah --git'
alias cat='bat'
alias grep='rg'
alias ..='cd ..'
alias ...='cd ../..'
