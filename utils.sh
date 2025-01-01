#!/bin/sh

prepare() { mkdir -p $(dirname $1) && rm -rf $1; }
symlink() { prepare $2 && ln -s $1 $2; }
gitclone() { prepare $2 && git clone $1 $2; }

PRETTY_COLOR="\033[1;33m"
PRETTY_RESET="\033[0m"
prettyecho() { echo -e 🌻 ${PRETTY_COLOR}$@${PRETTY_RESET}; }
