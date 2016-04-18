# PATH SETTINGS
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

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
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi
