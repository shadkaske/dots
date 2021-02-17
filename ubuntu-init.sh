#!/bin/bash
setxkbmap -option ctrl:nocaps

# Gaming
sudo dpkg --add-architecture i386

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
rm -rf winehq.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
sudo apt update
sudo apt install --install-recommends winehq-staging --yes
sudo apt install winetricks --yes

# Mesa Drivers
sudo add-apt-repository ppa:kisak/kisak-mesa
sudo apt upgrade --yes
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 --yes

# Lutris and Steam
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt install lutris --yes
sudo apt install steam --yes

# Get Rid of SnapCrap
sudo apt remove --purge snapd --yes

# Set Up Flatpak
sudo apt install flatpak gnome-software-plugin-flatpak --yes
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install A Couple of App
sudo apt install gamemode zsh git tmux stow xclip --yes

# Install Emacs
sudo add-apt-repository ppa:kelleyk/emacs --no-update --yes

# We currently need to use the focal repo because we ain't gots no groovy
sudo sed -i 's/groovy/focal/g' /etc/apt/sources.list.d/kelleyk-ubuntu-emacs-groovy.list

sudo apt update
