#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh

# Xcode's Command Line Tools
prettyecho Install Xcode\'s Command Line Tools
xcode-select --install

# Homebrew
prettyecho Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=$PATH:/opt/homebrew/bin

# Homebrew packages
prettyecho Install Homebrew packages
brew bundle --file=$DIR/Brewfile

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
