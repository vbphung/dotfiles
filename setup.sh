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
