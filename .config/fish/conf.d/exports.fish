set -gx EDITOR nvim
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
set -gx BAT_THEME tokyonight_night
# Foreground for suggestions
set -gx XDG_CONFIG_HOME ~/.config
set -g fish_color_autosuggestion brblack
# Background for tab completions
set -g fish_color_search_match black --background=cyan
fish_add_path $PNPM_HOME
