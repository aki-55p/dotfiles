export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# pyenv virtualenv
export PYTHONPATH="/Users/55p/.anyenv/envs/pyenv/shims:$PYTHONPATH"
eval "$(pyenv virtualenv-init -)"

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
