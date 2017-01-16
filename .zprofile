export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

#node
if [ -d ${HOME}/node_modules/.bin ]; then
  export PATH=${PATH}:${HOME}/node_modules/.bin
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# bundler
export PATH=./vendor/bin:$PATH

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:${PATH}
    eval "$(pyenv init -)"
fi

# rebar3
export PATH=$PATH:~/.cache/rebar3/bin

# android studio
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# openssl@1.1
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
