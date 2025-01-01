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

# Install fonts
prettyecho Install fonts
unzip -oq $DIR/fonts/Input.zip -d $HOME/Library/Fonts/Input

# Git
prettyecho Apply Git configs
symlink $DIR/.gitconfig $HOME/.gitconfig

# Zsh
prettyecho Apply Zsh configs
symlink $DIR/.zshrc $HOME/.zshrc

# Kitty
prettyecho Apply Kitty configs
symlink $DIR/kitty/kitty.conf $CONFIG_HOME/kitty/kitty.conf
gitclone git@github.com:folke/tokyonight.nvim.git $CONFIG_HOME/kitty/tokyonight

# Ghostty
prettyecho Apply Ghostty configs
GHOSTTY_CONF=$APP_SUPPORT/com.mitchellh.ghostty
symlink $DIR/ghostty/config $GHOSTTY_CONF/config
symlink $CONFIG_HOME/kitty/tokyonight/extras/ghostty/tokyonight_moon $GHOSTTY_CONF/themes/tokyonight_moon

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
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export GEM_HOME=$HOME/.gem
gem update --system
