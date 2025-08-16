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

# Brew
export PATH=/opt/homebrew/bin:$PATH

# Go
export GOPRIVATE=*
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/ruby/3.3.7/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH

# Directories
alias dots=$HOME/.dotfiles
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
alias gamend="git add . && git commit --amend --no-edit"
alias gpush="git push --force"

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init - zsh)"

# Clang
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
cpprun() {
    clang++ -std=c++17 $1 -o out && ./out && rm -rf ./out
}

# Java
export JAVA_HOME=/usr/local/java
export PATH=$JAVA_HOME/bin:$PATH

export SDKMAN_DIR=$HOME/.sdkman
[[ -s $SDKMAN_DIR/bin/sdkman-init.sh ]] && source $SDKMAN_DIR/bin/sdkman-init.sh

# Cuda
export PATH=/opt/cuda/bin:$PATH
export CUDA_HOME=/opt/cuda

# Arch
yi() { yay -S --answerdiff None --answerclean None --noconfirm $@; }
