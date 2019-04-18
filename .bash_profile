#node
# if [ -d ${HOME}/node_modules/.bin ]; then
#   export PATH=${PATH}:${HOME}/node_modules/.bin
# fi

# export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
# export PATH=$HOME/.rbenv/bin:$PATH
# eval "$(rbenv init -)"

# bundler
export PATH=./vendor/bin:$PATH

# pyenv
# export PYENV_ROOT="${HOME}/.pyenv"
# if [ -d "${PYENV_ROOT}" ]; then
#     export PATH=${PYENV_ROOT}/bin:${PATH}
#     eval "$(pyenv init -)"
# fi

alias ls='ls -G'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/55p/.sdkman"
[[ -s "/Users/55p/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/55p/.sdkman/bin/sdkman-init.sh"
