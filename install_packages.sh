#!/bin/bash

function install {
    sudo pacman -S $1 --noconfirm
}

function yay_install {
    yay -S $1 --answerclean All --answerdiff None --noconfirm
}

install zsh
install tmux
install neovim
install kitty

rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --silent
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

install docker
install docker-compose

sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

install nodejs
install npm

corepack enable pnpm

install go
install ruby

curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --quiet

install bluez

install evince
install obsidian
install telegram-desktop

yay_install vscodium
yay_install dbvis
yay_install postman-bin
yay_install brave-bin
yay_install dropbox
