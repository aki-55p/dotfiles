export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# bundler
export PATH=./vendor/bin:$PATH

# rebar3
export PATH=$PATH:~/.cache/rebar3/bin

# android studio
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# openssl@1.1
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
