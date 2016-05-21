# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
export GOPATH=$HOME/Development/Go
# PATH SETTINGS
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${ANDROID_HOME}/tools:${GOPATH}/bin"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH THEME SETTINGS
ZSH_THEME="robbyrussell"

# Virtual Environment
export WORKON_HOME=$HOME/Development/Python/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

# Shell Aliases
# General
alias zconf="vi ~/.zshrc"
alias ll='ls -al'
alias cd..='cd ..'
alias cd...='cd ../..'
source $ZSH/oh-my-zsh.sh

## Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gh='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

## Vim Alias
alias vim='mvim'
alias vi='mvim -v'

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# Tmux colors
alias tmux="TERM=screen-256color-bce tmux"
