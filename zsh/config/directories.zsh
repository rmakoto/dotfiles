#------------------------------------------------
# Change, make and remove directory
#------------------------------------------------
# Auto changes to a directory without typing cd.
setopt AUTO_CD

# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD

# Swap the meaning of cd +1 and cd -1; we want them to mean the opposite of
# what they mean in csh, because it makes more sense in this scheme, and it's
# easier to type.
setopt PUSHDMINUS

# Do not store duplicates in the stack.
setopt PUSHD_IGNORE_DUPS

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Prevent the directory stack from getting too large.
DIRSTACKSIZE=9

for index ({1..$DIRSTACKSIZE}); do
  alias "$index"="cd -${index}"
done
unset index

#------------------------------------------------
# Colors
#------------------------------------------------
# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
