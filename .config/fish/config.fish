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

fish_add_path ~/.local/bin
fish_add_path $PNPM_HOME
fish_add_path $CARGO_HOME/bin
