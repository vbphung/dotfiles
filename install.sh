#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh

prettyecho Install everything

# Remove packages
prettyecho Remove packages
sudo pacman -Rns --noconfirm ttf-liberation noto-fonts-emoji

# Essential packages
prettyecho Install packages
yay -S --answerdiff None --answerclean None --noconfirm - <$DIR/pkglist.txt
yay -S --answerdiff None --answerclean None --noconfirm - <$DIR/pkglist-aur.txt

# Oh-My-Zsh
prettyecho Install Oh-My-Zsh
prepare $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

prettyecho Install Zsh plugins
ZSH_PLUGIN=$HOME/.oh-my-zsh/custom/plugins
gitclone git@github.com:zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN/zsh-syntax-highlighting
gitclone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN/zsh-autosuggestions

# Tmux Plugin Manager
prettyecho Install Tmux Plugin Manager
gitclone git@github.com:tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm

# Rust
prettyecho Install Rust
curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -yq

# gRPC
prettyecho Install gRPC Gateway
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Java
prettyecho Install Java libs
curl -s https://get.sdkman.io | bash
sdk install springboot
