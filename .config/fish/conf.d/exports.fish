set -gx EDITOR nvim
if test (uname) = Darwin
    set -gx PAGER bat
    set -gx GIT_PAGER "bat --style=plain"
else
    alias bat batcat
    set -gx PAGER batcat
    set -gx GIT_PAGER "batcat --style=plain"
end
set -gx BAT_THEME tokyonight_night
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_CACHE_HOME ~/Library/Cachces
# Foreground for suggestions
set -g fish_color_autosuggestion brblack
# Background for tab completions
set -g fish_color_search_match black --background=cyan
set -gx PNPM_HOME ~/Library/pnpm
fish_add_path $PNPM_HOME
