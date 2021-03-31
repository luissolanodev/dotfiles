export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/default/
export JAVAFX_11=/usr/lib/jvm/java-11-openjdk/lib/
export ANDROID_SDK_ROOT=/opt/android-sdk
export BAT_THEME=base16
export PATH=$PATH:~/.local/bin

# AWS
export AWS_PROFILE=luis-solano-business
export AWS_CONFIG_FILE=~/.config/aws/config
export AWS_SHARED_CREDENTIALS_FILE=~/.config/aws/credentials

# Intel hardware acceleration
export LIBVA_DRIVER_NAME=i965
# Flutter
export PATH=$PATH:/opt/flutter/bin
# Ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
# Todoist
export TODOIST_API_KEY="$(pass Todoist/API)"
# Increase bash history size
export HISTFILESIZE=10000


alias vim=nvim
# Git bare repo for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
