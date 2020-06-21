#!/bin/bash

# System update
sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y neovim tmux tmuxinator zsh build-essential xclip git-flow \
    curl python3-pip python2 ruby-dev tmuxinator silversearcher-ag \
    exuberant-ctags nodejs npm breeze-cursor-theme unzip papirus-icon-theme \


fc-cache -fv



# Install Kitty Terminal
