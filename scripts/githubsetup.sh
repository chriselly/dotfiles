#/bin/bash

echo "This script will generate your personal key and setup Github."
echo -n "Enter your Github username: "
read gituser

echo -n "Enter your Github email: "
read gitemail

if [ -z $gituser ]; then
	echo "You must enter a username to continue."
	exit 1
fi

if [ -z $gitemail ]; then
	echo "You must enter an email address to continue."
	exit 1
fi

ssh-keygen -t rsa -C $gitemail -f $HOME/.ssh/id_rsa

if [ ! -d "$HOME/.config" ]; then
	mkdir $HOME/.config
	if [ ! -d "$HOME/.config/git" ]; then
		mkdir $HOME/.config/git
	fi
fi

git config -f $HOME/.config/git/config user.name $gituser
git config -f $HOME/.config/git/config user.email $gitemail

echo

pbcopy < $HOME/.ssh/id_rsa.pub

echo "Your public key has been copied to the clipboard. Please add it to your SSH keys on GitHub."

open https://github.com/settings/ssh
