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

# mkdir $HOME/.zfunctions

# ln -s "$DOTFILES/zsh/modules/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
# ln -s "$DOTFILES/zsh/modules/pure/async.zsh" "$HOME/.zfunctions/async"

# ln -s "$zsh_modules/z/z.sh" "$zsh_fpath/z"

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

echo "Done."