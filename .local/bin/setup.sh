#!/bin/bash

# add local/bin to path
export PATH=$HOME/.local/bin:$PATH

# create direcotries if needed
git clone https://github.com/robbyrussell/oh-my-zsh.git \
    $HOME/.oh-my-zsh

# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install ZSH Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Clone base16 repos for gnome terminal and shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# System update
sudo apt update && sudo apt dist-upgrade -y

# Add nodejs PPA
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# Add Yarn PPA
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    sudo tee /etc/apt/sources.list.d/yarn.list

# add vscode ppa
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# add chrome ppa
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Add PHP PPA
sudo apt-add-repository --yes --no-update ppa:ondrej/php

sudo apt update

sudo apt install --yes neovim tmux tmuxinator zsh build-essential \
    xclip git-flow silversearcher-ag breeze-cursor-theme unzip kitty curl wget \
    software-properties-common apt-transport-https nautilus-dropbox \
    evolution evolution-ews default-jre default-jdk remmina remmina-plugin-rdp  \
    gnome-tweaks ca-certificates gnupg-agent autokey-gtk nmap \
    nodejs mysql-server php7.2-bcmath php7.2-bz2 php7.2-cli \
    php7.2-common php7.2-curl php7.2-fpm php7.2-gd php7.2-imap php7.2-intl \
    php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc \
    php7.2-opcache php7.2-readline php7.2-xml python3 python2 ruby-full \
    python3-pip libnss3-tools jq xsel nginx papirus-icon-theme \
    qt5-style-kvantum qt5-style-kvantum-themes \
    gconf2 gconf-service libappindicator1 network-manager-l2tp-gnome \
    network-manager-strongswan libstrongswan-standard-plugins \
    libstrongswan-extra-plugins onedrive wine winetricks timeshift \
    backintime-qt4 dnsmasq inotify-tools code google-chrome-stable \
    libavcodec-extra58 xournal htop nautilus-admin qemu-kvm libvirt-clients \
    libvirt-daemon-system bridge-utils virt-manager libvirt-daemon ovmf \
    spice-vdagent virt-viewer qemu

# Remove Apps we don't want
sudo apt remove --yes --purge geary

sudo apt autoremove --yes

# install yarn, just skip the recomended packages
sudo apt install --no-install-recommends yarn

# Install Composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

rm -f composer-setup.php

# install valet
composer global require cpriego/valet-linux
$HOME/.config/composer/vendor/bin/valet install

curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

sudo python2 get-pip.py

rm -rf get-pip.py

sudo gem install neovim

sudo npm -g install neovim

python3 -m pip install neovim neovim-remote

python2 -m pip install neovim

nvim -u $HOME/.config/nvim/plugins.vim +PlugInstall +CocInstall +qall

# Install Todoist App
wget https://github.com/KryDos/todoist-linux/releases/download/1.23.0/Todoist_1.23.0_amd64.deb
sudo dpkg -i Todoist_1.23.0_amd64.deb
rm -f Todoist_1.23.0_amd64.deb
sudo apt install --fix-broken --yes

# Install AngryIPScanner
wget https://github.com/angryip/ipscan/releases/download/3.7.2/ipscan_3.7.2_amd64.deb
sudo dpkg -i ipscan_3.7.2_amd64.deb
rm -f ipscan_3.7.2_amd64.deb
sudo apt install --fix-broken --yes

flatpak install flathub com.microsoft.Teams -y

flatpak install flathub org.eclipse.Java -y

flatpak install flathub io.dbeaver.DBeaverCommunity -y

# Install JetBrains Mono Nerd Font
cd $HOME/Downloads

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

unzip unzip JetBrainsMono.zip -d ./JetBrainsMono

cd ./JetBrainsMono

rm JetBrains\ Mono\ *Windows\ Compatible* -f

mv *.ttf $HOME/.local/share/fonts

cd $HOME

rm -rf $HOME/Downloads/JetBrainsMono

fc-cache -fv

# Set default terminal emulatoer
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# Add libvirt group
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu
sudo adduser $USER kvm

# change compression to no for vm dir
mkdir -p $HOME/.local/share/libvirt
sudo chattr +C ~/.local/share/libvirt
sudo chattr +C /var/run/libvirt

# Copy samba config and enable
sudo cp $HOME/.config/system/smb.conf /etc/samba/smb.conf
sudo systemctl enable smbd
sudo systemctl start smbd

# enable libvirt daemon
sudo systemctl enable libvirtd

# Set kvantum environment variable
echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile

# Import dconf settings
dconf load / < $HOME/.local/share/dconf-user-settings.conf

chsh -s /bin/zsh $USER
