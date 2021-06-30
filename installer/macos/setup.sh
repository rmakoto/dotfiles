#!/usr/bin/env bash

export DOTFILES_DIR=$HOME/.dotfiles

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Ask for the administrator password upfront.
sudo -v

# Install Xcode Command Line Tools
if [[ -z `xcode-select -p` ]]; then
  xcode-select --install
fi

# Install Homebrew and Cask
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# Install Homebrew formulaes
# shellcheck disable=SC1090
source "$DIR/brew.sh"

# Symlink it up!
source "$DIR/symlink_setup.sh"

# Compile ZSH-related files for faster autoloading
source '../../bin/zsh-compile'

# Append /usr/local/bin/zsh to the end of /etc/shells file
grep -q -F '/usr/local/bin/zsh' /etc/shells || sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"

# Make ZSH the default shell
chsh -s "$(which zsh)"

if [ ! -d "$HOME/.dotfiles/" ]; then
    echo "Installing dotfiles for the first time"
    git clone --depth=1 https://github.com/rmakoto/my-dotfiles.git "$HOME/.dotfiles"
    cd "$HOME/.dotfiles"

    bash /$HOME/.dotfiles/installer/macos/setup.sh
else
    echo "dotfiles is already installed"
fi

# Install fonts
cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts