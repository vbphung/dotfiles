#!/bin/sh

DIR=$(pwd)

source $DIR/utils.sh

prettyecho Setup your macOS

# Create directories
prettyecho Create directories
mkdir -p $HOME/Projects/Personal
mkdir -p $HOME/Projects/Keys
mkdir -p $HOME/Dropbox

# Install everything
$DIR/osx_install.sh

# Apply configs
$DIR/osx_config.sh
