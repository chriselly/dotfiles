# custom dotfile plugin commands
cite about-plugin
about-plugin 'dotfile helper functions'

### general customs
function cdd { 
  about 'switches to a matching developer subdirectory, or the root directory where they live'
  group 'custom'
  if [ $REPOS_FOLDER ]; then
    test=`find $REPOS_FOLDER/* -maxdepth 0 -type d | grep -i "$1" -m 1`
    if [ ! $1 ] || [ ! $test ]; then
      cd $REPOS_FOLDER
    else
      cd $test
    fi 
  fi
}

function lowernames { 
  about 'renames all files in the current directory to be all lowercase'
  group 'custom'
  for f in *; do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done ; 
}

function grepmatch { 
  about 'finds matching files in all directories that contain the specified (case insensitive) string'
  group 'custom'
  grep -RInils "${@}" .; 
}

alias findgrep='grepmatch'
alias matchgrep='grepmatch'

### virtualenv customs
function wocd {
  about 'works on the virtualenv and switches to the directory'
  group 'custom'

  workon $1
  cdvirtualenv
}

### git customs
function ghist { 
  about 'shows full git log history with pretty print and colors'
  group 'custom'
  git log --pretty=format:"%Cblue%h %Creset%cn: %s" --graph $@ ; 
}


### OSX customs
function fixairplay {
  about 'fixes airplay when it crashes and prevents audio stream'
  group 'custom'
  sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`
}

function ql {
  about 'show a OS X Quick Look view of files'
  group 'custom'
  /usr/bin/qlmanage -p "$@" >& /dev/null &
}

### my dev customs, if you don't understand then don't worry about it
function newpush {
  about 'push update on our staging server'
  group 'custom'
  ssh stag 'cd update; screen -d -m bash -c "./newpush.sh '$@'"'
}

function oldpush {
  about 'old push update on our staging server'
  group 'custom'
  ssh stag 'cd update; screen -d -m bash -c "./push.sh '$@'"'
}

function devserve {
  about 'run dev server for testing'
  group 'custom'
  cd $REPOS_FOLDER/devserve
  npm start
}