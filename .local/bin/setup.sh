#!/bin/bash

# Grab git submodules
git --work-tree=$HOME --git-dir=$HOME/.dots submodule update --init

# System update
sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y neovim tmux tmuxinator zsh build-essential xclip git-flow \
    curl python3-pip python2 ruby-dev tmuxinator silversearcher-ag \
    exuberant-ctags nodejs npm breeze-cursor-theme unzip papirus-icon-theme \
    kitty

curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

sudo python2 get-pip.py

rm -rf get-pip.py

sudo gem install neovim

sudo npm -g install neovim

python3 -m pip install neovim

python2 -m pip install neovim

fc-cache -fv
