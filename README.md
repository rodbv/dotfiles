# Quick Dotfiles

This repo is aimed to make initial setup to a new Ubuntu Machine

## What it does

1. Install ZSH, Tmux, Vim
1. Add some fonts to `.fonts`
1. Add `.vim/` and `.vimrc` configuration files
1. Add `.tmux.conf` file
1. Add `adro.zsh-theme` to `.oh-my-zsh/themes`
1. Add `.zshrc` file
1. Intall Vim plugins

## Test and/or Install

You can test this environment with a Docker container

```bash
git clone git@github.com:adroaldof/dotfiles.git
cd dotfiles
```

To test install [Docker](https://www.docker.com/) and run
```bash
docker build <container_name> .
docker run -it <container_name> /bin/zsh
```

To install this run the follow script
```bash
. ./install-dotfiles.sh
```

---
Enjoy :+1:

