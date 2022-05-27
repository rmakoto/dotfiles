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

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias cat='bat --style="plain"'
alias ls="exa --group-directories-first"
alias ll="exa -la --group-directories-first"
alias tree="exa --tree -F"
alias o='open'

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

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 4); do /usr/bin/time $shell -i -c exit; done
}
