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

install docker
install docker-compose

install nodejs
install npm
install go
install ruby

install bluez

install evince
install obsidian
install telegram-desktop

yay_install vscodium
yay_install dbvis
yay_install postman-bin
yay_install brave-bin
yay_install dropbox
