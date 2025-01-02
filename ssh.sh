#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh
prettyecho Generate SSH key

ssh-keygen -t ed25519 -C "$USER@$(hostname)" -f $HOME/.ssh/id_ed25519

eval $(ssh-agent -s)

ssh-add $HOME/.ssh/id_ed25519

cat $HOME/.ssh/id_ed25519.pub
