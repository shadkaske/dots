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

sudo apt install emacs27 --yes

# Install Lazy Git
sudo add-apt-repository ppa:lazygit-team/release --yes
sudo apt install lazygit --yes

# Make sure oh-my-zsh is installed
[ ! -d $HOME/.oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git \
    $HOME/.oh-my-zsh

# Make sure fzf is installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# Check if the PowerLevel10k Plugin is install
[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Check if the Autosuggestions Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Check if the Syntax Highlight Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Check if Base16-Shell is Installed
[ ! -d $HOME/.config/base16-shell ] && git clone https://github.com/chriskempson/base16-shell.git \
    $HOME/.config/base16-shell

# Setting up dot files
# stow --adopt *

# Update the Font Cache
fc-cache -f

# Clone lain repo for awesome
git clone https://github.com/lcpz/lain.git $HOME/.config/awesome/lain

# Doom PreReqs
sudo apt install --yes ripgrep silversearcher-ag fd-find build-essential cmake \
    libtool-bin isync mu4e xapian-tools nodejs npm jq python3-pip shellcheck

# Set Up Npm for Local Install
mkdir "${HOME}/.npm-global"
npm config set prefix "${HOME}/.npm-global"

# Install Python Bits
pip3 install black pyflakes isort pipenv nose pytest neovim neovim-remote

# Mark Down Compiler
npm install --global markdownlint marked js-beautify stylelint

# Doom Install
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
$HOME/.emacs.d/bin/doom sync

# Install apps
sudo apt install --yes kitty awesome dunst neovim ranger rofi volumeicon-alsa \
    xfce4-clipman unclutter nextcloud-desktop lxappearance breeze-cursor-theme

# Set Up Neovim
nvim -u $HOME/.config/nvim/plugins.vim +PlugInstall +qall

# Setup picom
# Build Bits
sudo apt install --yes libxext-dev libxcb1-dev libxcb-damage0-dev \
    libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev \
    libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
    libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev \
    libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev \
    python3-setuptools python3-wheel ninja-build

# Meson
pip3 install --user meson

git clone https://github.com/jonaburg/picom $HOME/Downloads/picom
cd $HOME/Downloads/picom
git submodule update --init --recursive
meson configure -Dprefix=$HOME/.local/ build
ninja -C build
ninja -C build install

# Clone Ranger Dev Icons Plugin
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
