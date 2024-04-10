# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Google Cloud SDK
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

# Flutter
# export FLUTTER_PATH=/usr/local/Cellar/flutter/bin
# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
ANDROID_PATH=${android_home}/tools:${android_home}/platform-tools
RUST_PATH=$HOME/.cargo/bin
# Custom path for NLTK
export NLTK_DATA=$HOME/Development/nltk_data
# PATH SETTINGS
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin/:${ANDROID_PATH}:${RUST_PATH}:${FLUTTER_PATH}"
# FNM (Node Version Management)
export PATH=$HOME/.fnm:$PATH
# eval `fnm env`
# Homebrew Path
export PATH=/opt/homebrew/bin:$PATH

# Ruby and rbenv
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# eval "$(rbenv init -)"

# Avoid pyenv errors when running brew doctor
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

export SHELL=/usr/local/bin/zsh
# Language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# ZSH THEME SETTINGS
ZSH_THEME="robbyrussell"

plugins=(git macos python docker zsh-completions)

# pyenv
eval "$(pyenv init --path)"
# Python Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects/
# Tell pyenv-virtualenvwrapper to use pyenv when creating new Python environments
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# PIP formatting issue
export PIP_FORMAT=columns

# Shell Aliases
# General
alias zconf="vi ~/.zshrc"
alias ll='ls -al'
alias ..='cd ..'             # Go up one directory
alias ...='cd ../..'         # Go up two directories
alias ....='cd ../../../'
alias cd..='cd ..'

# alias ls='ls -G'
# alias l='ls -lahG'  # Long view, show hidden
# alias la='ls -AF'  # Compact view, show hidden
# alias ll='ls -lFh' # Long view, no hideen

# mv, rm, cp
# alias mv='mv --verbose'
# alias rm='rm -i -v'
# alias cp='cp --verbose'

# Git Aliases
alias gd='git diff --ignore-space-change --color $@ | diff-so-fancy | less --tabs=2 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --chop-long-lines'
alias gds='git diff --ignore-space-change --staged --color $@ | diff-so-fancy | less --tabs=2 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --chop-long-lines'
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

# Browsers
alias chrome="$HOME/Applications/Google\ Chrome.app/Contents/MacOS/Google\Chrome"
alias safari="open -a Safari"
alias ff="open -a Firefox"

# Mac Helpers
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

# Docker
alias dc="docker-compose"

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Lists all processes with open ports matching the given regex
alias open-ports='lsof -Pn -i4 -i6 | grep LISTEN | grep'

# FNM shortcut
alias n='fnm'

# Custom exports
# Set EDITOR to /usr/local/bin/nvim if NeoVim is installed
if [ -f /usr/local/bin/nvim ]; then
  export EDITOR=/usr/local/bin/nvim
fi
alias tmux="TEM=screen-256color-bce tmux"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# function ip() {
#   ifconfig | grep inet
# }

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

function docker-clean() {
  # remove all unused (containers, images, networks and volumes)
  docker system prune -f

  # remove dangling images
  docker rmi $(docker images -f dangling=true -q)

  # remove dangling volumes
  docker volume rm $(docker volume ls -f dangling=true -q)
}

# DataRobot UI commands
function dt() {
  nps "test --spec=$1"
}

function dtw() {
  nps "test.watch --spec=$1"
}

source $ZSH/oh-my-zsh.sh

[ -f ~/.quantumrc ] && source ~/.quantumrc

export WORKSPACE="$HOME/workspace"
export MMM_USER_NAME=pavlo.kochubei@datarobot.com

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
