#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh

prettyecho Install everything

# Essential packages
prettyecho Install extra packages
sudo pacman -S --noconfirm - <$DIR/pkglist.txt

# Essential apps
prettyecho Install AUR packages
yay -S --answerdiff None --answerclean All --noconfirm --removemake - <$DIR/pkglist-aur.txt

# Oh-My-Zsh
prettyecho Install Oh-My-Zsh
if test ! $(which zsh); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    prettyecho Install Zsh plugins
    ZSH_PLUGIN=$HOME/.oh-my-zsh/custom/plugins
    gitclone git@github.com:zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN/zsh-syntax-highlighting
    gitclone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN/zsh-autosuggestions
fi

# Tmux Plugin Manager
prettyecho Install Tmux Plugin Manager
gitclone git@github.com:tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm

# Rust
prettyecho Install Rust
curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -yq

# gRPC
prettyecho Install gRPC Gateway
go install \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest \
    google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Ollama
prettyecho Install Ollama
curl -fsSL https://ollama.com/install.sh | sh
