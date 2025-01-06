function dot --wraps='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' --description 'Manage dotfiles repository with home as working directory'
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv

end
