#!/usr/bin/env bash

echo "Creating symlinks..."

export DOTFILES_DIR=$HOME/.dotfiles

# zsh
ln -sf "$DOTFILES_DIR/zsh/zlogin" "$HOME/.zlogin"
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/zsh/zprofile" "$HOME/.zprofile"

# zsh modules
zsh_fpath="$HOME/.zfunctions"
zsh_modules="$DOTFILES/zsh/modules"

# man1_path="$DOTFILES/man/man1"

# mkdir "$man1_path"
# ln -s "$zsh_modules/z/z.1" "$man1_path/z.1"

# vim
# ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
# ln -sf "$DOTFILES_DIR/vim/gvimrc" "$HOME/.gvimrc"
# mkdir "$HOME/.vim/autoload"
# ln -sf "$DOTFILES/vim/autoload/*" "$HOME/.vim/autoload/"
# mkdir "$HOME/.vim/after"
# ln -sf "$DOTFILES_DIR/vim/ftplugin" "$HOME/.vim/after/ftplugin"
# mkdir "$HOME/.vim/snippets"
# ln -sf "$DOTFILES_DIR/vim/snippets" "$HOME/.vim/snippets"

# tmux
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# git
ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/git/gitignore" "$HOME/.gitignore"

# TheSilverSearcher ignore list
ln -sf "$DOTFILES_DIR/ag/agignore" "$HOME/.agignore"

# ctags
# ln -sf "$DOTFILES_DIR/ctags/ctags" "$HOME/.ctags"

# curl
# ln -sf "$DOTFILES/curl/curlrc" "$HOME/.curlrc"

# Starship prompt config
if [ ! -d "$HOME/.config" ] 
then
    mkdir -p $HOME/.config
fi
ln -sf "$DOTFILES_DIR/starship-prompt/starship.toml" "$HOME/.config/starship.toml"

# Add dynamic profile in iterm2
ln -sf "$DOTFILES_DIR/iterm2/rmakoto-profile.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/rmakoto-profile.json"

echo "Done."