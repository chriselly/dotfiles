### general customs
function cdd { 
  about 'switches to a matching developer subdirectory, or the root directory where they live'
  group 'general'
  test=`find $REPOS_FOLDER/* -maxdepth 0 -type d | grep -i "$1" -m 1`
  if [ ! $1 ] || [ ! $test ]; then
    cd $REPOS_FOLDER
  else
    cd $test
  fi 
}

function lowernames { 
  about 'renames all files in the current directory to be all lowercase'
  group 'general'
  for f in *; do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done ; 
}

function grepmatch { 
  about 'finds matching files in all directories that contain the specified (case insensitive) string'
  group 'general'
  grep -RInils $@ .; 
}

alias findgrep='grepmatch'
alias matchgrep='grepmatch'

### virtualenv customs
function wocd {
  about 'works on the virtualenv and switches to the directory'
  group 'virtualenv'

  workon $1
  cdvirtualenv
}

### git customs
function ghist { 
  about 'shows full git log history with pretty print and colors'
  group 'git'
  git log --pretty=format:"%Cblue%h %Creset%cn: %s" --graph $@ ; 
}


### OSX customs
function fixairplay {
  about 'fixes airplay when it crashes and prevents audio stream'
  group 'osx'
  sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`
}

function ql {
  about 'show a Quick Look view of files'
  group 'osx'
  /usr/bin/qlmanage -p "$@" >& /dev/null &
}

### my dev customs
function newpush {
  about 'push update'
  group 'developer'
  ssh stag 'cd update; screen -d -m bash -c "./newpush.sh '$@'"'
}

function oldpush {
  about 'old push update'
  group 'developer'
  ssh stag 'cd update; screen -d -m bash -c "./push.sh '$@'"'
}