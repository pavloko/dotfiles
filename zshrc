# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
# Go Development
export GOPATH=$HOME/Development/Go
# PATH SETTINGS
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${ANDROID_HOME}/tools:${GOPATH}/bin"
# NVM
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH THEME SETTINGS
ZSH_THEME="robbyrussell"

# Virtual Environment
export WORKON_HOME=$HOME/Development/Python/.virtualenvs
export PROJECT_HOME=$HOME/Projects/ml
source /usr/local/bin/virtualenvwrapper.sh

# Shell Aliases
# General
alias zconf="vi ~/.zshrc"
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
source $ZSH/oh-my-zsh.sh

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

# Git Aliases
alias gd='git diff'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gh='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

# Vim Alias
alias vim='mvim'
alias vi='mvim -v'

# Tmux Alias
alias tl='tmux ls'
alias ta='tmux attach -t '
alias tn='tmux new -s '
alias tk='tmux kill-session -t '

# Custom exports
# Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# Tmux colors
alias tmux="TERM=screen-256color-bce tmux"
