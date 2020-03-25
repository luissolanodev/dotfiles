#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='\[\e[1;34m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;31m\]\h\[\e[m\] \[\e[1;33;41m\] \w \[\e[m\] $ '
PS1='\[\e[1;34m\]# \u\[\e[m\] at \[\e[1;32m\]\h\[\e[m\] in \[\e[1;33m\]\w\[\e[m\] [\D{%T}]\n\[\e[33m\]$\[\e[m\] '

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.doftiles/ --work-tree=$HOME'
