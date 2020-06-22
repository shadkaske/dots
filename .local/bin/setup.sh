#!/bin/bash

# Grab git submodules
git --work-tree=$HOME --git-dir=$HOME/.dots submodule update --init

# System update
sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y neovim tmux tmuxinator zsh build-essential xclip git-flow \
    curl python3-pip python2 ruby-dev tmuxinator silversearcher-ag \
    exuberant-ctags nodejs npm breeze-cursor-theme unzip kitty \
    curl dconf-editor software-properties-common apt-transport-https wget \
    nautilus-dropbox emacs evolution evolution-ews openjdk-11-jdk virtualbox \
    virtualbox-dkms virtualbox-ext-pack virtualbox-guest-additions-iso \
    remmina remmina-plugin-rdp wine winetricks gnome-tweaks

curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

sudo python2 get-pip.py

rm -rf get-pip.py

sudo gem install neovim

sudo npm -g install neovim

python3 -m pip install neovim

python2 -m pip install neovim

#VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

flatpak install flathub com.microsoft.Teams -y

flatpak install flathub org.eclipse.Java -y

flatpak install flathub com.spotify.Client -y

flatpak install flathub io.dbeaver.DBeaverCommunity -y

fc-cache -fv
