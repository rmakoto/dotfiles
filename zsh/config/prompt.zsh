#Load themes from user's custom prompts (themes) in ~/.zsh.prompts
autoload promptinit
fpath=($DOTFILES/zsh/modules/pure $DOTFILES/zsh/modules/themes $fpath)
promptinit
prompt pure
