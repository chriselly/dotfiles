#!/usr/bin/env bash
## Initial setup of dotfiles on a new computer

#git clone needed repos
echo "Downloading support"
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
git clone https://github.com/revans/bash-it.git $HOME/.homesick/repos/bash-it

#setup bash-it symlink for compatibility
ln -s $HOME/.homesick/repos/bash-it $HOME/.bash_it
BASH_IT=$HOME/.homesick/repos/bash-it

#dotfiles location
DOTFILES_PATH=$HOME/.homesick/repos/dotfiles

echo "Setting up my dotfiles using homeshick, abort if you don't want to overwrite your existing dotfiles"
$HOME/.homesick/repos/homeshick/bin/homeshick link dotfiles

function add_bashit_completion {
  echo "Enabling $1.completion"
  [ ! -d "$BASH_IT/completion/enabled" ] && mkdir "$BASH_IT/completion/enabled"
  ln -fs "$BASH_IT/completion/available/$1.completion.bash" "$BASH_IT/completion/enabled/$1.completion.bash"
}

function add_bashit_alias {
  echo "Enabling $1.alias"
  [ ! -d "$BASH_IT/aliases/enabled" ] && mkdir "$BASH_IT/aliases/enabled"
  ln -fs "$BASH_IT/aliases/available/$1.alias.bash" "$BASH_IT/aliases/enabled/$1.alias.bash"
}

function add_bashit_plugin {
  echo "Enabling $1.plugin"
  [ ! -d "$BASH_IT/plugins/enabled" ] && mkdir "$BASH_IT/plugins/enabled"
  ln -fs "$BASH_IT/plugins/available/$1.plugin.bash" "$BASH_IT/plugins/enabled/$1.plugin.bash"
}

function copy_plugins() {
  ln -fs $DOTFILES_PATH/customs/custom.plugins.bash $BASH_IT/custom/custom.plugins.bash
  echo ""
  echo "To get a full list of custom commands, use 'bash-it help plugins'"
  echo ""
  echo "In order to use the 'cdd' command you must specify the folder where you keep your development repositories"
  echo "This is typically located at $HOME/Development"
  echo ""
  echo -n "Enter the full path to yours: "
  read devpath
  if [ $devpath ] && [ -e $devpath ]; then
    cp $DOTFILES_PATH/customs/set_devfolder.bash $BASH_IT/custom/set_devfolder.bash
    printf '\n# Set default folder for development repos\nexport REPOS_FOLDER='$devpath'\nsetup_pretty_terminal' >> $BASH_IT/custom/set_devfolder.bash
  fi
}

function copy_theme {
  add_bashit_completion "git"
  ln -fs $DOTFILES_PATH/customs/custom.theme.bash $BASH_IT/custom/custom.theme.bash
}

function install_defaults {
  add_bashit_alias "general"
  add_bashit_completion "bash-it"
  add_bashit_completion "brew"
  add_bashit_completion "git"
  add_bashit_completion "grunt"
  add_bashit_completion "pip"
  add_bashit_plugin "virtualenv"
}

while true
do
  read -p "Would you like to enable custom bash-it plugins provided by my dotfiles (Y/N) " RESP
  case $RESP
  in
  [yY])
    copy_plugins
    break
    ;;
  [nN])
    break
    ;;
  *)
    echo "Unknown choice. Please enter Y or N."
    continue
    ;;
  esac
done

while true
do
  read -p "Would you like to enable my custom bash-it prompt theme provided by my dotfiles (Y/N) " RESP
  case $RESP
  in
  [yY])
    copy_theme
    break
    ;;
  [nN])
    break
    ;;
  *)
    echo "Unknown choice. Please enter Y or N."
    continue
    ;;
  esac
done

while true
do
  read -p "Would you like to enable the recommended defaults for bash-it used by my dotfiles (Y/N) " RESP
  case $RESP
  in
  [yY])
    install_defaults
    break
    ;;
  [nN])
    break
    ;;
  *)
    echo "Unknown choice. Please enter Y or N."
    continue
    ;;
  esac
done

while true
do
  read -p "Would you like to setup Github now? (Y/N) " RESP
  case $RESP
  in
  [yY])
    $DOTFILES_PATH/scripts/githubsetup.sh
    break
    ;;
  [nN])
    echo "You can always set this up later by running: $DOTFILES_PATH/scripts/githubsetup.sh"
    break
    ;;
  *)
    echo "Unknown choice. Please enter Y or N."
    continue
    ;;
  esac
done


echo -n "Enter the full path to your development editor (/usr/bin/subl): "
read deveditor
if [ $deveditor ]; then
  printf '\n# Set development editors\nexport EDITOR='$deveditor'\nexport GIT_EDITOR='$deveditor'' > $BASH_IT/custom/set_deveditor.bash
else
  printf '\n# Set development editors\nexport EDITOR="/usr/bin/subl"\nexport GIT_EDITOR="/usr/bin/subl -w"' > $BASH_IT/custom/set_deveditor.bash
fi

echo ""
echo "Done. If you want more, see 'bash-it help' for more details"

source $HOME/.bashrc