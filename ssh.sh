#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh
prettyecho Generate SSH key

KEY_PATH=$HOME/.ssh/id_rsa

if [ ! -f $KEY_PATH ]; then
    ssh-keygen -t rsa -b 4096 -C "$USER@$(hostname)" -f $KEY_PATH
    eval $(ssh-agent -s)
    ssh-add $KEY_PATH
fi

cat $KEY_PATH.pub
