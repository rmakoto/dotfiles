#Load themes from user's custom prompts (themes) in ~/.zsh.prompts
autoload promptinit
fpath+=$DOTFILES/zsh/modules/pure
fpath+=$DOTFILES/zsh/modules/themes
promptinit

eval "$(starship init zsh)"
