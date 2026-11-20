# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}
setopt share_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks
setopt interactive_comments

# Completion
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
[[ -d ${ZSH_COMPDUMP:h} ]] || mkdir -p ${ZSH_COMPDUMP:h}
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Functions
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $ZDOTDIR/functions/*(.:t)

# Plugins live outside the config dir; only .zsh_plugins.txt is tracked.
export ANTIDOTE_HOME="$XDG_DATA_HOME/antidote"
source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh
antidote load $ZDOTDIR/.zsh_plugins.txt $XDG_CACHE_HOME/zsh/plugins.zsh

# Key bindings
bindkey -e
bindkey '^ ' autosuggest-accept

# Tools
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[[ -s $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh

command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"

# Aliases
alias vi=nvim
alias vim=nvim
alias ls='ls -GTh'
alias l='ls -la'

# Abbreviations
abbr -S -qq dst='dot status'
abbr -S -qq dss='dot status --short'
abbr -S -qq dcd='dot commit -m'
abbr -S -qq dps='dot push'
abbr -S -qq da='dot add'
abbr -S -qq --force dd='dot diff'
abbr -S -qq dlog='dot log --oneline --decorate --color --graph'
