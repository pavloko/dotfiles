# Google Cloud SDK
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
# Custom path for NLTK
export NLTK_DATA=$HOME/Development/nltk_data
# PATH SETTINGS
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
# NVM (Node Version Management)
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

export SHELL=/usr/local/bin/zsh

# Language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# ZSH THEME SETTINGS
ZSH_THEME="robbyrussell"

plugins=(git osx python docker zsh-completions)

# Python Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/experiments/
# Virtualenv Wrapper Settings
# export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3/'
# export VIRTUALENVWRAPPER_VIRTUALENV='/usr/local/bin/virtualenv'
# source /usr/local/bin/virtualenvwrapper.sh

# PIP formatting issue
export PIP_FORMAT=columns

# Shell Aliases
# General
alias zconf="vi ~/.zshrc"
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'

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

# vim
alias vimog="/usr/local/bin/vim"
alias vi="nvim"
alias vim="nvim"

## Browsers
alias chrome="$HOME/Applications/Google\ Chrome.app/Contents/MacOS/Google\Chrome"
alias safari="open -a Safari"
alias ff="open -a Firefox"

# Custom exports
# Set EDITOR to /usr/local/bin/nvim if NeoVim is installed
if [ -f /usr/local/bin/nvim ]; then
  export EDITOR=/usr/local/bin/nvim
fi
alias tmux="TERM=screen-256color-bce tmux"

source $ZSH/oh-my-zsh.sh
