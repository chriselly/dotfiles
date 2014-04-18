# Add dotfile scripts to path
export PATH=$HOME/.homesick/repos/dotfiles/scripts:$PATH

# Set ulimit for number of open files
ulimit -n 4096

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Path to the bash it configuration
export BASH_IT=$HOME/.homesick/repos/dotfiles/bash-it

# Lock and Load a custom theme file
# location /.bash_it/themes/
# export BASH_IT_THEME='bobby'

# Use custom theme without using bash-it
source $HOME/.homesick/repos/dotfiles/themes/personal.theme.bash

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/subl"
export GIT_EDITOR='/usr/bin/subl -w'

# Set the path nginx
# export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Set default folder for development repos
export REPOS_FOLDER=$HOME/Development

# Pretty print the path for terminal.app when in development repos folders
export PROMPT_COMMAND='echo -ne "\033]0;${PWD#*'$REPOS_FOLDER'/}\007"'

# Load Bash It
source $BASH_IT/bash_it.sh

# make sure virtualenv directory exists; else create it
[ -d $HOME/sites/env ] || mkdir -p $HOME/sites/env

# default workon directory for virtualenv
export WORKON_HOME=$HOME/sites/env

# Setup VIRTUALENV globals
export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
export VIRTUALENV_USE_DISTRIBUTE=true

# pip virtualenv stuff
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### Added by homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"