#!/usr/local/bin/zsh

printf "\n[$(date)] Triggering Auto Sync Dotfiles..\n"
BASEDIR=$(dirname "$0")
cd $BASEDIR

# brew bundle dump
cd ../brew_bundle
brew bundle dump -f
cd -

# zsh_history sync
zhsync

# git commit
cd ../
git add .
git commit -m "auto commit" -a
git push origin master
