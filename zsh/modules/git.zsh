# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}

# Load forgit
source $HOME/.dotfiles/zsh/modules/forgit/forgit.plugin.zsh

# Customizing forgit
export FORGIT_LOG_GRAPH_ENABLE=false

# Git Aliases
alias gch='git checkout'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gsh='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gc='git commit'
alias gca='git commit --amend -v --date="$(date +%Y-%m-%dT%H:%M:%S)"'
alias gunc='git uncommit'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias grm='git rm --cached'
alias gcp='git cp'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias gl='git l'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfpd='git fetch --recurse-submodules --prune && git pull origin develop && git submodule update --recursive --remote'
alias gfpm='git fetch --recurse-submodules --prune && git pull && git submodule update --recursive --remote'
alias gcl='git clone --recurse'
alias gb='git branch'
alias gupdate_repos='find . -name .git -type d | xargs -n1 -I% git --git-dir=% --work-tree=%/.. fetch --all --recurse-submodules' #@mndrix
alias gd='git diff'
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w' # Staged and cached are the same thingz
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gp='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gsu='git submodule update --init --recursive' # add submodules after git clone
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'