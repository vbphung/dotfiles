#!/bin/sh

DIR=$(pwd)

echo --- Setup your Arch ---

#   Create directories
echo --- Create directories ---
mkdir -p $HOME/Projects/Personal
mkdir -p $HOME/Projects/Keys
mkdir -p $HOME/Dropbox

# Install  everything
./ install.sh

# Apply configs
./ config.sh
