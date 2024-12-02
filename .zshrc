export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=robbyrussell

plugins=(
    aliases
    npm
    git
    docker
    docker-compose
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export GEM_HOME=$HOME/.local/share/gem/ruby/3.3.0

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$GEM_HOME/bin

alias proj=~/Documents/Projects
alias psn=~/Documents/Projects/Personal
alias keys=~/Documents/Projects/Keys

alias vcfg=~/.config/nvim
alias tcfg=~/.config/tmux

alias v=nvim
alias h=helix
alias t=~/.tmux.sh
alias code=codium
