#!/bin/bash

echo "\n[$(date)] Triggering Auto Sync Dotfiles"
BASEDIR=$(dirname "$0")
cd $BASEDIR

# brew bundle dump
cd ../brew_bundle
/usr/local/bin/brew bundle dump -f
cd -

# git commit
git add .
git commit -m "auto commit" -a
git push origin master