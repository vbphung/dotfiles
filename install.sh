#!/bin/sh

echo --- Install everything ---

# Essential packages
echo --- Install extra packages ---
pacman -S - <$DIR/pkglist.txt

# Essential apps
echo --- Install AUR packages ---
yay -S - <$DIR/pkglist-aur.txt

# Oh-My-Zsh
echo --- Install Oh-My-Zsh ---
if test ! $(which zsh); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo --- Install Zsh plugins ---
    ZSH_PLUGIN=$HOME/.oh-my-zsh/custom/plugins
    git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN/zsh-syntax-highlighting
    git clone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN/zsh-autosuggestions
fi

# Tmux Plugin Manager
echo --- Install Tmux Plugin Manager ---
git clone git@github.com:tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm

# Rust
echo --- Install Rust ---
curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh

# gRPC
echo --- Install gRPC Gateway ---
go install \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2 \
    google.golang.org/protobuf/cmd/protoc-gen-go \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc

# Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Personal tools
echo --- Install personal tools ---
git clone git@github.com:vbphung/me.git $HOME/.me
cd $HOME/.me
make install
