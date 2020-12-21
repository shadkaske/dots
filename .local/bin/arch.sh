#!/bin/bash

# Install Yay
git clone https://aur.archlinux.org/yay-git.git

cd yay-git

makepkg -si --noconfirm

cd ~

rm -rf ~/yay-git

# Install Packages
yay -S --noconfirm --removemake xorg xterm xfce4 lightdm lightdm-gtk-greeter \
    adapta-gtk-theme papirus-icon-theme kitty gnu-free-fonts noto-fonts \
    ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid ttf-ibm-plex \
    ttf-liberation firefox xcursor-breeze xcursor-breeze-adapta pulseaudio \
    network-manager-applet archlinux-wallpaper xfce4-screenshooter \
    xfce4-screensaver xfce4-whiskermenu-plugin xfce4-weather-plugin \
    xfce4-pulseaudio-plugin xclip xdg-user-dirs xdg-utils tmux tmuxinator \
    freetype2 lib32-freetype2 fontconfig lib32-fontconfig cairo \
    lib32-cairo fonts-meta-base fonts-meta-extended-lt mesa lib32-mesa \
    xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver \
    lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau wine-staging \
    winetricks steam lutris wine-mono wine-gecko vulkan-icd-loader \
    lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs awesome lazygit ranger \
    grub-theme-vimix rofi rofi-greenclip rofi-dmenu update-grub

# Set up font rendering
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/30-infinality-aliases.conf /etc/fonts/conf.d

sudo sed -i '/ FREETYPE_PROPERTIES/s/^#//' /etc/profile.d/freetype2.sh

# Copy LightDM Greeter Settings
sudo cp $HOME/.config/system/lightdm-gtk-greeter.conf \
    /etc/lightdm/lightdm-gtk-greeter.conf

# Enable lightdm
sudo systemctl enable lightdm

# Enable pulseaudio server
systemctl --user enable pulseaudio.service

# Configure Neovim
yay -S --noconfirm neovim python-pip python2 python2-pip ruby nodejs yarn

# Make sure path includes gem bin
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

pip install neovim
pip install neovim-remote
pip2 install neovim
gem install neovim
yarn global add neovim

nvim -u $HOME/.config/nvim/plugins.vim +PlugInstall +qall

xdg-user-dirs-update

git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain

echo 'GRUB_THEME="/usr/share/grub/themes/Vimix/theme.txt"' | sudo tee -a \
    /etc/default/grub

sudo sed -i '/SAVEDEFAULT/s/^#//' /etc/default/grub
