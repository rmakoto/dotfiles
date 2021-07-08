# Aliases in this file are bash and zsh compatible

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# if [[ $platform == 'linux' ]]; then
#   alias ll='ls -alh --color=auto'
#   alias ls='ls --color=auto'
# elif [[ $platform == 'darwin' ]]; then
#   alias ll='ls -alGh --color --group-directories-first'
#   alias ls='ls -Gh --color --group-directories-first'
# fi

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

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

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias cat='bat'
#alias cat='bat --style="plain"'
alias ls="exa --group-directories-first"
alias ll="exa -l --group-directories-first"
alias lll="exa -la --group-directories-first"
alias tree="exa --tree -F"

# Zippin
alias gz='tar -zcvf'

alias ka9='killall -9'
alias k9='kill -9'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

# Global aliases
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }
