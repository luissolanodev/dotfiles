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

export PATH=$PATH:/opt/flutter/bin
