###############################################################################
# Generate ssh keys
###############################################################################
# ssh-keygen -t rsa -b 4096 -C "your@email.com"
# chmod 600 ~/.ssh/*


###############################################################################
# Make all updates
###############################################################################
sudo apt-get update -qqy
sudo apt-get upgrade -qqy
sudo apt-get dist-upgrade -qqy


###############################################################################
# Install xClip
###############################################################################
# Aliases
# -----
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
sudo apt-get install xclip -qqy


###############################################################################
# Install Tweak Tools
###############################################################################
sudo apt-get install gnome-tweak-tool -qqy


###############################################################################
# Install Curl
###############################################################################
sudo apt install curl -qqy


###############################################################################
# Install vim
###############################################################################
# install vim
sudo apt-get install vim -qqy

# Install vim copy to clipboard
sudo apt-get install vim-gtk -qqy

# Install silver search
sudo apt-get install silversearcher-ag -qqy


###############################################################################
# Install Essential Packages
###############################################################################
sudo apt-get install build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip -qqy


###############################################################################
# Install Git
###############################################################################
sudo apt-get install git-core -qqy


###############################################################################
# Install NVM
###############################################################################
sudo apt-get install nodejs -qqy
sudo apt-get install npm -qqy
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
source ~/.profile
nvm install stable
npm i -g git-x


###############################################################################
# Install Docker
###############################################################################
# Install docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -qqy docker-engine
sudo usermod -aG docker $(whoami)

# Install docker-compose
sudo touch /usr/local/bin/docker-compose && sudo chown $USER /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install docker authentication file
mkdir ~/.docker
echo -e "{\n    \"auths\": {\n        \"https://docker.bravi.com.br/v1/\": {\n            \"auth\": \"YWRtaW46MTIz\",\n            \"email\": \"$USER@bravi.com.br\"\n        },\n        \"https://docker-registry.bravi.com.br/v1/\": {\n            \"auth\": \"YnJhdmktZGV2ZWxvcGVyOnNsZS1tZVctaVQ=\",\n            \"email\": \"$USER@bravi.com.br\"\n        }\n    }\n}" > ~/.docker/config.json


###############################################################################
# Install ZSH and oh-my-zsh
###############################################################################
sudo apt-get install zsh -qqy
sh -c "$(wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh)"
chsh -s `which zsh`


###############################################################################
# Install Tmux
###############################################################################
# Aliases
# -----
# alias tmux="tmux -2"
# alias ta="tmux attach -t"
# alias tnew="tmux new -s"
# alias tls="tmux ls"
# alias tkill="tmux kill-session -t"
sudo apt-get install tmux -qqy


###############################################################################
# Install Browsers
###############################################################################
# Install Default Chrome Browser
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update -qqy
sudo apt-get install google-chrome-stable -qqy

# Install Chrome Browser
sudo apt-get install chromium-browser -qqy

# Install Opera browser
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update -qqy
sudo apt-get install opera -qqy


###############################################################################
# Install SQLEletrom
###############################################################################
curl -L https://github.com/sqlectron/sqlectron-gui/releases/download/v1.20.0/Sqlectron-1.20.0.deb > /tmp/sqlectron.deb
sudo dpkg -i /tmp/sqlectron.deb && sudo apt install -f


###############################################################################
# Install Dotfiles
###############################################################################
git clone git@github.com:adroaldof/dotfiles.sh
ln -s ~/dotfiles/fonts ~/.fonts
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/adro.theme ~/.oh-my-zsh/themes/adro.theme
fc-cache -f -v


###############################################################################
# Install Bravi Goods
###############################################################################
# Add network configurations
echo '\nauto lo:0' | sudo tee --append /etc/network/interfaces
echo 'iface lo:0 inet static' | sudo tee --append /etc/network/interfaces
echo 'address 10.10.10.10' | sudo tee --append /etc/network/interfaces
echo 'netmask 255.0.0.0' | sudo tee --append /etc/network/interfaces

# Restart network services
sudo service networking restart


###############################################################################
# Install Bravi Goods
###############################################################################
# zshsrc() {
#   source ~/alias.sh
# }
# update-alias() {
#   if [ -d "/tmp/bravi-docs" ]; then
#     (cd /tmp/bravi-docs && git pull)
#   else
#     (cd /tmp && git clone git@git.bravi.com.br:bravi-docs/bravi-docs.git)
#   fi
#   ls /tmp/bravi-docs/setup/alias/aliases
#   cp /tmp/bravi-docs/setup/alias/aliases/* ~/aliases
#   zshsrc
# }
# for f in ~/aliases/*; do source $f; done
# -----
# mkdir ~/aliases
# source ~/alias.sh
# update-alias


###############################################################################
# Install GitKraken
###############################################################################

###############################################################################
# Install Spotify
###############################################################################
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

