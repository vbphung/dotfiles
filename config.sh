#!/bin/sh

prepare() { mkdir -p $(dirname $1) && rm -rf $1; }
symlink() { prepare $2 && ln -s $1 $2; }
gitclone() { prepare $2 && git clone $1 $2; }

DIR=$(pwd)

echo --- Apply configs ---

# Fonts
echo --- Install fonts ---
unzip $DIR/fonts/Input.zip -d $HOME/.local/share/fonts

# Docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

# Git
symlink $DIR/.gitconfig $HOME/.gitconfig

# Zsh
symlink $DIR/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# Kitty
symlink $DIR/kitty/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
gitclone git@github.com:davidmathers/tokyo-night-kitty-theme.git $XDG_CONFIG_HOME/kitty/tokyonight

# Tmux
symlink $DIR/tmux/.tmux.conf $HOME/.tmux.conf
symlink $DIR/tmux/.tmux.sh $HOME/.tmux.sh

# Neovim
symlink $DIR/nvim $XDG_CONFIG_HOME/nvim

# Vscodium
symlink $DIR/vscodium $XDG_CONFIG_HOME/VSCodium

# Node.js
corepack enable pnpm

# Personal tools
mkdir -p $HOME/.me
