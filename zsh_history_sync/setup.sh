#!/bin/bash

set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR

rm -rf ~/.oh-my-zsh/plugins/history-sync
cp -r history-sync ~/.oh-my-zsh/plugins