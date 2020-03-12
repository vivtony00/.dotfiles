#!/bin/bash

echo "\n[$(date)] Triggering Auto Sync Dotfiles"
BASEDIR=$(dirname "$0")
cd $BASEDIR

# brew bundle dump
which brew
cd ../brew_bundle
brew bundle dump -f
/usr/local/bin/brew bundle dump -f
cd -

which git

# git commit
git add .
git commit -m "auto commit" -a
git push origin master