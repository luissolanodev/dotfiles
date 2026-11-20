# Shared environment for fish and zsh.
# Keep to plain `export KEY=value` lines: fish sources this file too.

export EDITOR=nvim
export VISUAL=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PAGER=bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GIT_PAGER="bat --style=plain"

export PNPM_HOME="$HOME/Library/pnpm"
export TERM_HAS_NERD_FONT=1

export CARGO_HOME="$XDG_DATA_HOME/cargo"
