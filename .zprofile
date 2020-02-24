export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# for pipenv error
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# go
export PATH="$GOPATH/bin:$PATH"

# bundler
export PATH=./vendor/bin:$PATH

# rebar3
export PATH=$PATH:~/.cache/rebar3/bin

# android studio
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# openssl@1.1
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

# use java8 instead java9 for pluntuml-viewer
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=$JAVA_HOME/bin:$PATH

# Android Studio
export PATH="$PATH:/Users/55p/Library/Android/sdk/platform-tools"
