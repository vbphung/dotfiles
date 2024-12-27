#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh

prettyecho Apply configs

# Docker
prettyecho Start Docker with systemd
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

# Git
prettyecho Apply Git configs
symlink $DIR/.gitconfig $HOME/.gitconfig

# Zsh
prettyecho Apply Zsh configs
symlink $DIR/.zshrc $HOME/.zshrc

# Kitty
prettyecho Apply Kitty configs
symlink $DIR/kitty/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
gitclone git@github.com:davidmathers/tokyo-night-kitty-theme.git $XDG_CONFIG_HOME/kitty/tokyonight

# Tmux
prettyecho Apply Tmux configs
symlink $DIR/tmux/.tmux.conf $HOME/.tmux.conf
symlink $DIR/tmux/.tmux.sh $HOME/.tmux.sh

# Neovim
prettyecho Apply Neovim configs
symlink $DIR/neovim $XDG_CONFIG_HOME/nvim

# Vscodium
prettyecho Apply Vscodium configs
symlink $DIR/vscodium/settings.json $XDG_CONFIG_HOME/VSCodium/User/settings.json
symlink $DIR/vscodium/keybindings.json $XDG_CONFIG_HOME/VSCodium/User/keybindings.json
sudo chown -R $(whoami) /usr/share/vscodium

# Node.js
prettyecho Enable pnpm
corepack enable pnpm
