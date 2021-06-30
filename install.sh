#!/usr/bin/env bash

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "Installing dotfiles for the first time"
    mkdir $HOME/.dotfiles
    git clone --recurse-submodules -j8 --depth=1 https://github.com/rmakoto/my-dotfiles.git "$HOME/.dotfiles"
    cd "$HOME/.dotfiles"

    bash /$HOME/.dotfiles/installer/macos/setup.sh
else
    echo "dotfiles is already installed"
fi