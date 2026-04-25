fish_add_path ~/.local/bin

set -gx EDITOR nvim
set -U nvm_default_version lts/krypton
set -gx BAT_THEME tokyonight_night
set -gx XDG_CONFIG_HOME ~/.config
set -g fish_color_autosuggestion brblack
set -g fish_color_search_match black --background=cyan

if test (uname) = Darwin
    set -gx PAGER bat
    set -gx GIT_PAGER "bat --style=plain"
    set -gx XDG_CACHE_HOME ~/Library/Caches
    set -gx PNPM_HOME ~/Library/pnpm
else
    alias bat batcat
    set -gx PAGER batcat
    set -gx GIT_PAGER "batcat --style=plain"
    set -gx XDG_CACHE_HOME ~/.cache
    set -gx PNPM_HOME ~/.local/share/pnpm
end

fish_add_path $PNPM_HOME

if status is-interactive
  abbr --erase dst dss dcd dps # Clean if exists
  abbr dst 'dot status'
  abbr dss 'dot status --short'
  abbr dcd 'dot commit -m'
  abbr dps 'dot push'
  abbr da 'dot add'
  abbr dd 'dot diff'
  abbr dlog 'dot log --oneline --decorate --color --graph'
end
