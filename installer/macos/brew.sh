#!/usr/bin/env bash
#
# Install command-line tools using Homebrew.

bundleid() {
  osascript -e "id of application \"$1\"" 2>/dev/null ||
    { echo "$FUNCNAME: ERROR: Application with specified name not found: $1" 1>&2; return 1; }
}

echo "Checking brew..."
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
brew tap hashicorp/tap

echo "Installing Unix tools..."
brew install git
brew install ctags
brew install curl
brew install git-delta
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
brew install parallel
brew install gh
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish --bin

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
brew install hashicorp/tap/terraform

echo "Installing other useful binaries..."
brew install pandoc
brew install shellcheck
brew install qlstephen # QuickLook plugin to preview yaml, json, etc

echo "Installing K8S stuff..."
brew install kubernetes-cli
brew install minikube
brew install kind
brew install helm
brew install kubectx
brew install kube-ps1
brew install stern
brew install derailed/k9s/k9s

echo "Installing themes..."
brew install starship

echo "Installing Applications..."
if ! bundleid 'iterm2' &>/dev/null; then
    brew install iterm2
else
    echo "iterm2 already installed"
fi

brew install --cask maccy # clipboard manager app
brew install --cask rectangle # windows manager app

echo "Installing OpenPG tools..."
brew install gnupg pinentry-mac

echo "Installing security tools..."
brew install dnsmasq

# Remove outdated versions from the cellar.
brew cleanup

# Importing plist files
defaults import $HOME/Library/Containers/org.p0deje.Maccy/Data/Library/Preferences/org.p0deje.Maccy.plist plist/org.p0deje.Maccy.plist
defaults import $HOME/Library/Preferences/com.knollsoft.Rectangle.plist plist/com.knollsoft.Rectangle.plist