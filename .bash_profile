if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export EDITOR=nvim
export GOPATH=/home/luis/Programming/go
export JAVA_HOME=/usr/lib/jvm/default/
export JAVAFX_11=/usr/lib/jvm/java-11-openjdk/lib/
export ANDROID_SDK_ROOT=/opt/android-sdk

# Intel hardware acceleration
export LIBVA_DRIVER_NAME=i965
# Flutter
export PATH=$PATH:/opt/flutter/bin
# Todoist
export TODOIST_API_KEY="$(pass Todoist/API)"
# FZF
export FZF_DEFAULT_OPTS="--reverse --bind ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-alt-d:preview-half-page-down,ctrl-alt-u:preview-half-page-up"
# Increase bash history size
export HISTFILESIZE=10000
