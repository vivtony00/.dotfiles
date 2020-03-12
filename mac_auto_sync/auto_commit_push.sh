#!/bin/bash

echo "[$(date)] Triggering Auto Sync Dotfiles"
BASEDIR=$(dirname "$0")
cd $BASEDIR
git add .
git commit -m "auto commit" -a
git push origin master