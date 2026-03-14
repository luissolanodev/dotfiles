if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/Users/luis.solano/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

abbr --erase dst dss dcd dps # Clean if exists
abbr dst 'dot status'
abbr dss 'dot status --short'
abbr dcd 'dot commit -m'
abbr dps 'dot push'
abbr da 'dot add'
abbr dd 'dot diff'
