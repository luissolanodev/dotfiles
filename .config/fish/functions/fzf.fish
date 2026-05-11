function fzf
    switch "$argv[1]"
        case --bash --zsh --fish --version -h --help --man
            command fzf $argv
        case '*'
            fzf-zellij $argv
    end
end
