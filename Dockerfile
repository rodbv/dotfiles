FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Adroaldo de Andrade <adroaldof@gmail.com>

# Set working directory to /root folder
WORKDIR /root

# Make some installs
RUN apt-get update -y && \
    apt-get install -y apt-utils git zsh vim tmux fontconfig build-essential libpq-dev && \

    # Reduce image size
    rm -rf /var/lib/apt/lists/* && \

    # Generate UTF-8 locale
    locale-gen en_US en_US.UTF-8 && \

    # Reconfigure locales
    dpkg-reconfigure locales && \

    # Clone oh-my-zsh repo
    git clone git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh && \

    # Set ZSH as default shell
    chsh -s $(which zsh)

# Copy configuration files to container
COPY adro.zsh-theme .oh-my-zsh/themes/
COPY gitconfig .gitconfig
COPY tmux.conf .tmux.conf
ADD vim .vim/
ADD vim/fonts .fonts/
COPY vimrc .vimrc
COPY zshrc .zshrc

# Rebuild font cache to use fonts
RUN fc-cache -f -v

# Install Vundle Bundles
RUN vim +BundleInstall! +qall > /dev/null 2>&1

