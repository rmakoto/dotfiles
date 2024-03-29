# Sets history options and defines history aliases.

# Variables
HISTFILE="$HOME/.zhistory"       # The path to the history file.
HISTSIZE=500000                   # The maximum number of events to save in the internal history.
SAVEHIST=500000                   # The maximum number of events to save in the history file.

# Options
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before adding to the history list.

# zhistory backup
if [ $(stat -c%s "$HISTFILE") -gt 64000 ]; then
    cp -f $HISTFILE $HOME/.zsh/backup/zhistory_$(date +\%Y_\%m_\%d).bak
fi

# Delete zhistory backup files older than 30 days
find $HISTFILE -name "*.bak" -type f -mtime +30 -delete
