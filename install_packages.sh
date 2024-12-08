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
install alacritty

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

install clang

install protobuf
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest

install bluez

install evince
install obsidian
install telegram-desktop

yay_install vscodium
yay_install dbvis
yay_install postman-bin
yay_install brave-bin
yay_install dropbox
