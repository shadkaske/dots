#!/bin/bash

# create direcotries if needed
if [[ ! -d "$HOME/.local/share" ]]; then
    mkdir -p $HOME/.local/share
fi

if [[ ! -d "$HOME/.local/share/zsh-customs" ]]; then
    mkdir -p $HOME/.local/share/zsh-customs
fi

# Clone oh-my-zsh
if [[ ! -d "$HOME/.local/share/oh-my-zsh" ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git \
    $HOME/.local/share/oh-my-zsh
fi

# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.local/share/zsh-customs/plugins/zsh-syntax-highlighting

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.local/share/zsh-customs/themes/powerlevel10k

# Clone base16 repos for gnome terminal and shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# System update
sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y neovim tmux tmuxinator zsh build-essential xclip git-flow \
    silversearcher-ag breeze-cursor-theme unzip kitty curl wget \
    software-properties-common apt-transport-https nautilus-dropbox \
    evolution evolution-ews openjdk-11-jdk remmina \
    remmina-plugin-rdp wine winetricks gnome-tweaks

# curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

# sudo python2 get-pip.py

# rm -rf get-pip.py

# sudo gem install neovim

# sudo npm -g install neovim

# python3 -m pip install neovim

# python2 -m pip install neovim

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
