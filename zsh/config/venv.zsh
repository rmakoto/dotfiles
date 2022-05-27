#!/usr/bin/env zsh

#  lazy-loading virtual environments
if [ "${commands[pyenv]}" ]; then
  pyenv() {
    unfunction "$0"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    $0 "$@"
  }
fi

if [ "${commands[rbenv]}" ]; then
  rbenv() {
    unfunction "$0"
    eval "$(command rbenv init -)"
    $0 "$@"
  }
fi

if [ "${commands[nodenv]}" ]; then
  nodenv() {
    unfunction "$0"
    eval "$(nodenv init -)"
    $0 "$@"
  }
fi

if [ "${commands[jenv]}" ]; then
  jenv() {
    unfunction "$0"
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
    $0 "$@"
  }
fi