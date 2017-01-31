# This Docker file is aimed to test the install-dotfiles.sh script
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Adroaldo de Andrade <adroaldof@gmail.com>

# Set working directory to /root folder
WORKDIR /root

# Copy dotfiles bash script installer
COPY setup-machine.sh setup-machine.sh
COPY install-dotfiles.sh install-dotfiles.sh

# Run bash script install
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install sudo -y && \
    useradd -m -c "Docker Sudoer" docker && \
    echo "docker:docker" | chpasswd && \
    adduser docker sudo

RUN sh ./setup-machine.sh \
    sh ./install-dotfiles.sh

USER docker
CMD /bin/bash
