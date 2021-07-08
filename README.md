# rmakoto's dotfiles

![Screenshot of my shell prompt](https://user-images.githubusercontent.com/16414105/124540329-9915c980-ddf5-11eb-91a7-2c5e16b157ad.png)

## made with

* vanilla [zsh](http://www.zsh.org/) with [starship-prompt](https://github.com/starship/starship) and some other [modules](./zsh/modules)
* [tmux](https://tmux.github.io/) with shortcuts configured and [tpm](https://github.com/tmux-plugins/tpm) to manage plugins
* [fzf](https://github.com/junegunn/fzf), an amazing command-line fuzzy finder
* [fasd](https://github.com/clvv/fasd), a command-line productivity booster
* [the silver searcher](https://github.com/ggreer/the_silver_searcher) for
  finding things in files
* [bat](https://github.com/sharkdp/bat), a cat with super powers
* [delta](https://github.com/dandavison/delta), a viewer for git and diff output
* iterm2 with [dracula theme](https://github.com/dracula/iterm)
* a bunch of [aliases](./zsh/config/aliases.zsh) that make me type less
* some k8s tools like [kubectx](https://github.com/ahmetb/kubectx) and [stern](https://github.com/stern/stern)
* other tools can be found [here](./installer/macos/brew.sh)

## installation

### mac os

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/rmakoto/dotfiles/master/install.sh `"
```

## docs

## iterm2

after installation, you can set `dracula theme` and `rmakoto-profile` in iterm2 manually if you want.

### how to apply theme

1. iterm2 > preferences > "profiles" > "colors tab"
2. open the "color presets"... drop-down in the bottom right corner
3. select "import"... from the list
4. in your home folder, press `⌘ + shift + .` to show .dotfiles folder
5. select [iterm2/dracula.itermcolors](./iterm2/Dracula.itermcolors) file
6. select the "dracula" from color presets from drop-down
7. open a finder window and hit `⌘ + shift + .` to hide hidden files again

### how to apply profile

[rmakoto-profile.json](./iterm2/rmakoto-profile.json) is automatically imported using [dynamic profiles](https://iterm2.com/documentation-dynamic-profiles.html) in iterm2.

to make this profile default:

1. iterm2 > preferences > "profiles"
2. select `rmakoto-profile`
3. "other actions" > "set as default"

### keyboard cursor shortcuts

* move cursor one word left: `⌥ + ←`
* move cursor one word right: `⌥ + →`
* move cursor to beginning of line: `⌘ + ←`
* move cursor to end of line: `⌘ + →`
* delete word: `⌥ + ←delete`
* delete line: `⌘ + ←delete`
* undo: `⌘ + z`

### don't forget to remove the global bindings

1. open the "profiles" tab
2. click the sub-tab "keys"
3. remove the mappings for key combinations `⌥ + ←` and `⌥ + →`

## starship-prompt

### how to customize

to customize your prompt, just change [~/.dotfiles/starship-prompt/starship.toml](./starship-prompt/starship.toml). you can enable or disable any config you want, and after saving this file, the changes are applied immediatelly.

### git symbols meaning

```toml
ahead = "⇡"
behind = "⇣"
diverged = "⇡⇣"
modified = "!"
untracked = "?"
staged = "+"
stashed = "#"
renamed = "r"
deleted = "x"
conflicted = "="
```

for more configs, check [starship documentation](https://starship.rs/config/)

## zsh

### [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)

you can type in any part of any command from history and then press ↑ and ↓ to cycle through matches

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

it enables highlighting of commands whilst they are typed at a zsh prompt into an interactive terminal

### [delta](https://github.com/dandavison/delta)

more pleasing git diff. edit [.dotfiles/git/gitconfig](./git/gitconfig) to customize it.

### [fasd](https://github.com/clvv/fasd)

hit `z` and partial match for recently used directory. tab completion enabled.

### [fzf](https://github.com/junegunn/fzf)+[bat](https://github.com/sharkdp/bat)
* `ctrl + r`: reverse command history finder
* `ctrl + t`: navigate through files with a preview and paste its path onto the command-line
* `alt + c`: cd into the selected directory

### [exa](https://github.com/ogham/exa)

more pleasing ls and tree

```bash
alias ls="exa --group-directories-first"
alias ll="exa -l --group-directories-first"
alias lll="exa -la --group-directories-first"
alias tree="exa --tree -F"
```

### git aliases

find more aliases and edit them in [~/.dotfiles/zsh/config/aliases.zsh](./zsh/config/aliases.zsh)

```bash
alias gch='git checkout'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gcm='git commit -m'
alias gc='git commit'
alias gca='git commit --amend -v --date="$(date +%Y-%m-%dT%H:%M:%S)"'
alias ga='git add -A'
alias grm='git rm --cached'
alias gl='git l'
alias gf='git fetch'
alias gcl='git clone --recurse'
alias gb='git branch'
alias gd='git diff'
alias gpl='git pull'
alias gp='git push'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'
```

## tmux

### shortcuts

prefix: `ctrl + b` or `ctrl + j`

#### windows

* create a new window: `prefix + c`
* move to next windows: `⌥ + ↑`
* move to previous windows: `⌥ + ↓`
* close a window or pane: `ctrl + d`

#### split window in panes

* split vertically: `prefix + v`
* split horizontally: `prefix + h`

#### move between panes

* move left: `shift + ←`
* move down: `shift + ↓`
* move up: `shift + ↑`
* move right: `shift + →`

#### resize panes

* resize to left: `⌥ + h`
* resize to down: `⌥ + j`
* resize to up: `⌥ + k`
* resize to right: `⌥ + l`

### [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)

tmux plugin that reduces mouse usage

* `prefix + ctrl-f` - simple file search
* `prefix + ctrl-g` - jumping over git status files (best used after git status command)
* `prefix + alt-h` - jumping over SHA-1/SHA-256 hashes (best used after git log command)
* `prefix + ctrl-u` - url search (http, ftp and git urls)
* `prefix + ctrl-d` - number search (mnemonic d, as digit)
* `prefix + alt-i` - ip address search
* `prefix + /` - regex search (strings work too)

navigation:

* `n` - jumps to the next match
* `N` - jumps back to the previous match
* `y` - copy selected text

### [how to copy with a mouse in tmux](https://unix.stackexchange.com/questions/318281/how-to-copy-and-paste-with-a-mouse-with-tmux)

enable this config in iterm2 preferences:

* iterm2 > preferences > "general" tab
* "selection" section
* check "applications in terminal may access clipboard"

there are two ways to copy:

1. `hold ⌥`, select the text with mouse and hit `⌘ + c`
2. just select with mouse and tmux-yank will copy selected text automatically to clipboard

thanks [rpereira](https://github.com/rpereira/dotfiles) for the inspiration.
