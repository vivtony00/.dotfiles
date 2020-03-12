#!/bin/bash

echo "[$(date)] Triggering Auto Sync Dotfiles"
BASEDIR=$(dirname "$0")
cd $BASEDIR

# brew bundle dump
pushd
cd ../brew_bundle
brew bundle dump -f
popd

# git commit
git add .
git commit -m "auto commit" -a
git push origin master