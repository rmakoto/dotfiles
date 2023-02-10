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
source "$DIR/symlink.sh"

# Append /usr/local/bin/zsh to the end of /etc/shells file
grep -q -F '/usr/local/bin/zsh' /etc/shells || sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"

# Install fonts
cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts

# Install tmux tpm plugins
$DOTFILES_DIR/tmux/plugins/tpm/bin/install_plugins

# Create ~/.secrets file
if [ ! -e "$HOME/.secrets" ]; then
  touch $HOME/.secrets
  echo "# Here you can set custom environment variables and functions to make them available locally" >> $HOME/.secrets
  echo "# They are loaded everytime zsh is loaded" >> $HOME/.secrets
fi

# Make ZSH the default shell
echo "Prompt your password to make ZSH your default shell"
chsh -s "$(which zsh)"

# Compile ZSH-related files for faster autoloading
exec zsh
source "$DOTFILES_DIR/bin/zsh-compile"

# Create cache folder
mkdir -p $HOME/.zsh/cache

# Create backup folder
mkdir -p $HOME/.zsh/backup
