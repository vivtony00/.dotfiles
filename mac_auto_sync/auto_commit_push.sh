#!/bin/bash

printf "\n[$(date)] Triggering Auto Sync Dotfiles..\n"
BASEDIR=$(dirname "$0")
cd $BASEDIR

# brew bundle dump
cd ../brew_bundle
/usr/local/bin/brew config
/usr/local/bin/brew bundle dump -f --all
cd -

# git commit
cd ../
git add .
git commit -m "auto commit" -a
git push origin master
