#!/bin/bash

printf "\n[$(date)] Triggering Auto Sync Dotfiles..\n"
BASEDIR=$(dirname "$0")
cd $BASEDIR

# brew bundle dump
cd ../brew_bundle
PATH=/Users/eriksuen/.pyenv/shims:/Users/eriksuen/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/fzf/bin
echo $PATH
echo $HOME
/usr/local/bin/brew bundle dump -f
cd -

# git commit
cd ../
git add .
git commit -m "auto commit" -a
git push origin master
