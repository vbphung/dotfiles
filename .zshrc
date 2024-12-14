export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=robbyrussell

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Go
export GOPRIVATE=*
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# Directories
alias proj=$HOME/Projects
alias psn=$HOME/Projects/Personal
alias keys=$HOME/Projects/Keys
alias dropbox=$HOME/Dropbox

# Shortcuts
alias t=$HOME/.tmux.sh
alias v=nvim
alias c=codium

# Docker
alias dcup="docker-compose up --detach --build"
alias dcdown="docker-compose down"
alias dlogs="docker logs --follow"
alias dclean="docker stop $(docker ps -aq) && docker rm --force $(docker ps -aq) && docker volume rm $(docker volume ls -qf dangling=true)"

# Git
alias gclear="git reset && git clean -fd && git checkout -- ."
alias gcommit="git add . && git commit -m"
alias gamend="git add . && git commit --amend"
alias gpush="git push --force"
