# Enable kubectl autocompletion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

alias kc='kubectx'
alias kn='kubens'
alias kde='kubectl get pods | grep Error | cut -d' ' -f 1 | xargs kubectl delete pod'