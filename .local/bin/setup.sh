#!/bin/bash

# Grab git submodules
alias dots='git --work-tree=$HOME --git-dir=$HOME/.dots'

dots submodule update --init

# System update
sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y neovim tmux tmuxinator zsh build-essential xclip git-flow \
    curl python3-pip python2 ruby-dev tmuxinator silversearcher-ag \
    exuberant-ctags nodejs npm breeze-cursor-theme unzip papirus-icon-theme \


fc-cache -fv

# Install Kitty Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo update-alternatives --install /usr/bin/x-terminal-emulator \
    x-terminal-emulator ~/.local/kitty.app/bin/kitty 50
sudo update-alternatives --set x-terminal-emulator ~/.local/kitty.app/bin/kitty
cp ${HOME}/.config/kitty/kitty.desktop ~/.local/share/applications
