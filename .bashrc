#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='\[\e[1;34m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;31m\]\h\[\e[m\] \[\e[1;33;41m\] \w \[\e[m\] $ '
PS1='\[\e[1;34m\]# \u\[\e[m\] at \[\e[1;32m\]\h\[\e[m\] in \[\e[1;33m\]\w\[\e[m\] [\D{%T}]\n\[\e[34m\] \[\e[m\] '

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias vim=nvim
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yay -S icons-in-terminal
source /usr/share/icons-in-terminal/icons_bash.sh
