###############################################################################
# Clone Dotfiles Repo
###############################################################################
git clone git@github.com:adroaldof/dotfiles.sh

###############################################################################
# Create All Symlinks to Dotfiles
###############################################################################
ln -s ~/dotfiles/adro.theme ~/.oh-my-zsh/themes/adro.zsh-theme
ln -s ~/dotfiles/fonts ~/.fonts                                         
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
fc-cache -f -v

