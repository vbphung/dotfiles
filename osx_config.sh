#!/bin/sh

DIR=$(pwd)
CONFIG_HOME=$HOME/.config
APP_SUPPORT=$HOME/Library/ApplicationSupport

source $DIR/utils.sh

prettyecho Apply configs

# Apple's Application Support is an absolute piece of shit
prettyecho Symbolic link for Application Support
rm -rf $APP_SUPPORT
ln -s $HOME/Library/Application\ Support $APP_SUPPORT

# Git
prettyecho Apply Git configs
symlink $DIR/.gitconfig $HOME/.gitconfig

# Zsh
prettyecho Apply Zsh configs
symlink $DIR/.zshrc $HOME/.zshrc

# Alacritty
prettyecho Apply Alacritty configs
symlink $DIR/alacritty/alacritty.toml $CONFIG_HOME/alacritty/alacritty.toml

# Tmux
prettyecho Apply Tmux configs
symlink $DIR/tmux/.tmux.conf $HOME/.tmux.conf
symlink $DIR/tmux/.tmux.sh $HOME/.tmux.sh

# Neovim
prettyecho Apply Neovim configs
symlink $DIR/neovim $CONFIG_HOME/nvim

# Vscodium
prettyecho Apply Vscodium configs
symlink $DIR/vscodium/settings.json $APP_SUPPORT/VSCodium/User/settings.json
symlink $DIR/vscodium/keybindings.json $APP_SUPPORT/VSCodium/User/keybindings.json
sudo chown -R $(whoami) /Applications/VSCodium.app/Contents/MacOS/Electron

# Node.js
prettyecho Enable pnpm
corepack enable pnpm

# Ruby
prettyecho Update RubyGems
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
export GEM_HOME=$HOME/.gem
gem update --system

# Java
prettyecho Generalize JAVA_HOME
JAVA_HOME=/opt/homebrew/opt/openjdk
JAVA_HOME_SYMLINK=/usr/local/java
if [ -n $JAVA_HOME ] && [ ! -L $JAVA_HOME_SYMLINK ]; then
    sudo ln -s $JAVA_HOME $JAVA_HOME_SYMLINK
    prettyecho JAVA_HOME at $JAVA_HOME_SYMLINK
fi
