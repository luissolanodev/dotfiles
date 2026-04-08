fish_add_path ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr --erase dst dss dcd dps # Clean if exists
abbr dst 'dot status'
abbr dss 'dot status --short'
abbr dcd 'dot commit -m'
abbr dps 'dot push'
abbr da 'dot add'
abbr dd 'dot diff'
