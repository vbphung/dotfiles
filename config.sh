#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh

prettyecho Apply configs

# Install fonts
prettyecho Apply fonts configs
symlink $DIR/xfce4/fonts.xml $XDG_CONFIG_HOME/fontconfig/fonts.conf

# Docker
prettyecho Start Docker with systemd
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

# Bluetooth
prettyecho Start Bluetooth with systemd
sudo systemctl enable bluetooth.service

# Git
prettyecho Apply Git configs
symlink $DIR/.gitconfig $HOME/.gitconfig

# Zsh
prettyecho Apply Zsh configs
symlink $DIR/.zshrc $HOME/.zshrc

# Kitty
prettyecho Apply Kitty configs
symlink $DIR/kitty/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
gitclone git@github.com:folke/tokyonight.nvim.git $XDG_CONFIG_HOME/kitty/tokyonight
kitten themes --reload-in=all --config-file-name=themes.conf Rosé Pine

# Ghostty
prettyecho Apply Ghostty configs
symlink $DIR/ghostty/config $XDG_CONFIG_HOME/ghostty/config
symlink $XDG_CONFIG_HOME/kitty/tokyonight/extras/ghostty/tokyonight_moon $XDG_CONFIG_HOME/ghostty/themes/tokyonight_moon

# Tmux
prettyecho Apply Tmux configs
symlink $DIR/tmux/.tmux.conf $HOME/.tmux.conf
symlink $DIR/tmux/.tmux.sh $HOME/.tmux.sh

# Neovim
prettyecho Apply Neovim configs
symlink $DIR/neovim $XDG_CONFIG_HOME/nvim

# Vscodium
prettyecho Apply Vscodium configs

sudo chown -R $(whoami) /opt/vscodium-bin

symlink $DIR/vscodium/settings.json $XDG_CONFIG_HOME/VSCodium/User/settings.json
symlink $DIR/vscodium/keybindings.json $XDG_CONFIG_HOME/VSCodium/User/keybindings.json
symlink $DIR/vscodium/product.json $XDG_CONFIG_HOME/VSCodium/product.json

# Xfce
prettyecho Apply Xfce configs
symlink $DIR/xfce4/keyboard_shortcuts.xml $XDG_CONFIG_HOME/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

# Node.js
prettyecho Enable pnpm
sudo corepack enable pnpm

# Java
prettyecho Generalize JAVA_HOME

JDK=java-23-jdk
sudo archlinux-java set $JDK

JAVA_HOME=/usr/lib/jvm/$JDK
JAVA_HOME_SYMLINK=/usr/local/java
if [ -n $JAVA_HOME ] && [ ! -L $JAVA_HOME_SYMLINK ]; then
    sudo ln -s $JAVA_HOME $JAVA_HOME_SYMLINK
    prettyecho JAVA_HOME at $JAVA_HOME_SYMLINK
fi

# Nvidia
prettyecho Apply Nvidia configs
sudo cp $DIR/nvidia/nvidia.hook /etc/pacman.d/hooks/nvidia.hook
sudo cp $DIR/nvidia/70-nvidia.rules /etc/udev/rules.d/70-nvidia.rules
nvidia-settings --load-config-only
