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

### don't forget to remove the previous bindings

* open the "profiles" tab
* click the sub-tab "keys"
* remove the mappings for key combinations `⌥ + ←` and `⌥ + →`

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

## tmux

### shortcuts

bind: `control + b` or `control + j`

#### windows

* create a new window: `bind + c`
* move to next windows: `⌥ + ↑`
* move to previous windows: `⌥ + ↓`
* close a window or pane: `control + d`

#### split window in panes

* split vertically: `bind + v`
* split horizontally: `bind + h`

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

### [how to copy with a mouse in tmux](https://unix.stackexchange.com/questions/318281/how-to-copy-and-paste-with-a-mouse-with-tmux)

enable this config in iterm2 preferences:

* iterm2 > preferences > "general" tab
* "selection" section
* check "applications in terminal may access clipboard"

there are two ways to copy:

1. `hold ⌥`, select the text with mouse and hit `⌘ + c`
2. just select with mouse and tmux-yank will copy selected text automatically to clipboard

thanks [rpereira](https://github.com/rpereira/dotfiles) for the inspiration.
