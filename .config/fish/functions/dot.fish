function dot --wraps=git --description 'Manage dotfiles repository with home as working directory'
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv
end
