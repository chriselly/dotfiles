# Pretty print the path for terminal.app when in development repos folders
function setup_pretty_terminal () {
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD#*'$REPOS_FOLDER'/}\007"'
  export PROMPT_COMMAND='echo -ne "\033k${PWD#*'$REPOS_FOLDER'/}\033\\";'$PROMPT_COMMAND''
}
