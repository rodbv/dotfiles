#!/bin/bash


# Make some installs
sudo apt-get update -y
sudo apt-get install -y apt-utils git zsh vim tmux fontconfig build-essential libpq-dev

# Reduce image size
rm -rf /var/lib/apt/lists/*

# Generate UTF-8 locale
locale-gen en_US en_US.UTF-8

# Reconfigure locales
dpkg-reconfigure locales

# Clone oh-my-zsh repo
git clone git://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh

# Set ZSH as default shell
chsh -s $(which zsh)

# Clone dotfiles repo
git clone https://github.com/adroaldof/dotfiles.git ${HOME}/dotfiles

# Copy configuration files to container
cp -r ${HOME}/dotfiles/vim ${HOME}/.vim/
mkdir ${HOME}/.fonts
cp ${HOME}/dotfiles/vim/fonts/* ${HOME}/.fonts/
cp ${HOME}/dotfiles/adro.zsh-theme ${HOME}/.oh-my-zsh/themes/
cp ${HOME}/dotfiles/gitconfig ${HOME}/.gitconfig
cp ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf
cp ${HOME}/dotfiles/vimrc ${HOME}/.vimrc
cp ${HOME}/dotfiles/zshrc ${HOME}/.zshrc

# Rebuild font cache to use fonts
fc-cache -f -v

# Install Vundle Bundles
vim +BundleInstall! +qall > /dev/null 2>&1

