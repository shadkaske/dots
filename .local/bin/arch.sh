#!/bin/bash

# Install pre-reqs

sudo pacman --noconfirm -S tmux tmuxinator openssh

git clone --bare https://github.com/shadkaske/dots.git ~/.dots

git --work-tree=$HOME --git-dir=$HOME/.dots checkout

source ~/.zshrc

# Install Yay
git clone https://aur.archlinux.org/yay-git.git

cd yay-git

makepkg -si --noconfirm

cd ~

rm -rf ~/yay-git

# Install X
yay -S --noconfirm xorg xterm xfce4 lightdm lightdm-gtk-greeter \
    adapta-gtk-theme papirus-icon-theme kitty gnu-free-fonts noto-fonts \
    ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid ttf-ibm-plex \
    ttf-liberation firefox xcursor-breeze xcursor-breeze-adapta

# Set up font rendering
yay -S --noconfirm freetype2 lib32-freetype2 fontconfig lib32-fontconfig cairo \
    lib32-cairo fonts-meta-base fonts-meta-extended-lt

sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/30-infinality-aliases.conf /etc/fonts/conf.d

sudo sed -i '/ FREETYPE_PROPERTIES/s/^#//' /etc/profile.d/freetype2.sh

# Copy LightDM Greeter Settings
sudo cp $HOME/.config/system/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

# Enable lightdm
sudo systemctl enable lightdm

# Configure Neovim
yay -S --noconfirm neovim python-pip python2 python2-pip ruby nodejs yarn

pip install neovim neovim-remote
pip2 install neovim
gem install neovim
yarn global add neovim

# Make sure path includes gem bin
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

nvim -u $HOME/.config/nvim/plugins.vim +PlugInstall +qall
