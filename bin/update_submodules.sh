#!/usr/bin/env bash
#
# Updates all the declared zsh plugins declared as git submodules.

modules_path=$HOME/.dotfiles/zsh/modules
submodules=(
  forgit
  zsh-history-substring-search
  zsh-syntax-highlighting
)

for plugin in "${submodules[@]}"; do
  printf "Updating %s... " "$plugin"
  git submodule update --init --remote -- "$modules_path/$plugin" > /dev/null
  printf "Done!\n"
done