#!/usr/bin/env bash
#
# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

echo "Installing GNU tools..."
# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install `wget` with IRI support.
brew install wget

brew tap homebrew/cask

echo "Installing Unix tools..."
brew install git
brew install ctags
brew install curl
brew install diff-so-fancy
brew install less
brew install openssl
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install tmux
brew install vim
brew install zsh
brew install jq
brew install fasd
brew install bat # cat replacement
brew install exa # ls and tree replacement
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

echo "Installing programming languages..."
brew install python
brew install pyenv
brew install pyenv-virtualenv
brew install go
brew install nodenv
brew install rbenv
brew install ruby-build
brew install rust
brew install jenv

echo "Installing other useful binaries..."
# brew install imagemagick
brew install pandoc
brew install shellcheck

echo "Installing K8S stuff..."
brew install kubernetes-cli
brew install minikube
brew install kind
brew install helm
brew install kubectx
brew install kube-ps1
brew install stern

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

echo "Installing themes..."
brew install starship

echo "Installing Applications"
# brew cask install iterm2
# brew cask install sourcetree
brew install macvim

echo "Installing OpenPG tools..."
brew install gnupg pinentry-mac

echo "Installing security tools..."
brew install dnsmasq

# Remove outdated versions from the cellar.
brew cleanup