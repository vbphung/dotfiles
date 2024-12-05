#!/bin/bash

DIR=$(pwd)

rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.sh
rm -rf ~/.config/kitty/kitty.conf

ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.tmux.sh ~/.tmux.sh

mkdir -p ~/.config/kitty
ln -s $DIR/kitty.conf ~/.config/kitty/kitty.conf
git clone git@github.com:davidmathers/tokyo-night-kitty-theme.git ~/.config/kitty/tokyonight

rm -rf ~/.config/nvim
rm -rf ~/.config/VSCodium

git clone git@github.com:vbphung/lazy-config.git ~/.config/nvim
git clone --branch linux git@github.com:vbphung/vscode-config.git ~/.config/VSCodium
