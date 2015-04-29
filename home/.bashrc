# Set ulimit for number of open files
ulimit -n 4096

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Path to the bash it configuration
export BASH_IT=$HOME/.homesick/repos/bash-it

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

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

export TMUX_POWERLINE_SEG_WEATHER_LOCATION="2503863"
export TMUX_POWERLINE_SEG_WEATHER_GREP="/usr/local/Cellar/grep/2.18/bin/ggrep"

if tmux has; then tmux attach -d; else tmux new; fi