# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
# Custom path for NLTK
export NLTK_DATA=$HOME/Development/nltk_data
# PATH SETTINGS
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
# NVM (Node Version Management)
# export NVM_DIR="$HOME/.nvm"
# source $(brew --prefix nvm)/nvm.sh

# Language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# ZSH THEME SETTINGS
ZSH_THEME="robbyrussell"

plugins=(git osx python docker)

# Python Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/experiments/
# export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3/'
# export VIRTUALENVWRAPPER_VIRTUALENV='/usr/local/bin/virtualenv'
# source /usr/local/bin/virtualenvwrapper.sh

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
