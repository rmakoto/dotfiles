#!/usr/bin/env bash

echo "Creating symlinks..."

export DOTFILES=$HOME/.dotfiles

# zsh
ln -sf "$DOTFILES/zsh/zlogin" "$HOME/.zlogin"
ln -sf "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zprofile" "$HOME/.zprofile"

# zsh modules
zsh_fpath="$HOME/.zfunctions"
zsh_modules="$DOTFILES/zsh/modules"

# man1_path="$DOTFILES/man/man1"

# mkdir "$man1_path"
# ln -s "$zsh_modules/z/z.1" "$man1_path/z.1"

# vim
# ln -sf "$DOTFILES/vim/vimrc" "$HOME/.vimrc"
# ln -sf "$DOTFILES/vim/gvimrc" "$HOME/.gvimrc"
# mkdir "$HOME/.vim/autoload"
# ln -sf "$DOTFILES/vim/autoload/*" "$HOME/.vim/autoload/"
# mkdir "$HOME/.vim/after"
# ln -sf "$DOTFILES/vim/ftplugin" "$HOME/.vim/after/ftplugin"
# mkdir "$HOME/.vim/snippets"
# ln -sf "$DOTFILES/vim/snippets" "$HOME/.vim/snippets"

# tmux
ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

# git
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/gitignore" "$HOME/.gitignore"

# TheSilverSearcher ignore list
ln -sf "$DOTFILES/ag/agignore" "$HOME/.agignore"

# ctags
# ln -sf "$DOTFILES/ctags/ctags" "$HOME/.ctags"

# curl
# ln -sf "$DOTFILES/curl/curlrc" "$HOME/.curlrc"

# Starship prompt config
if [ ! -d "$HOME/.config" ] 
then
    mkdir -p $HOME/.config
fi
ln -sf "$DOTFILES/starship-prompt/starship.toml" "$HOME/.config/starship.toml"

# Add dynamic profile in iterm2
ln -sf "$DOTFILES/iterm2/rmakoto-profile.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/rmakoto-profile.json"

echo "Done."