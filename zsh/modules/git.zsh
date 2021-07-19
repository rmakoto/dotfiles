# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}

# Load forgit
source $HOME/.dotfiles/zsh/modules/forgit/forgit.plugin.zsh