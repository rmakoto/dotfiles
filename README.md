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
* iterm2 with [dracula theme](https://github.com/dracula/iterm)
* a bunch of [aliases](./zsh/config/aliases.zsh) that make me type less
* some k8s tools like [kubectx](https://github.com/ahmetb/kubectx) and [stern](https://github.com/wercker/stern)
* other tools can be found [here](./installer/macos/brew.sh)

## installation

### mac os

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/rmakoto/dotfiles/master/install.sh `"
```

thanks [rpereira](https://github.com/rpereira/dotfiles) for the inspiration.
