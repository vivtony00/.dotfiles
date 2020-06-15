#!/bin/bash

set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR

gpg_recipient=eriksuen@protonmail.com

# check if gpg installed and key is loaded
type gpg > /dev/null 2>&1
gpg -k | grep $gpg_recipient > /dev/null 2>&1

# encrypt zsh
gpg -r $gpg_recipient --encrypt --sign --armor --output .zsh_history.gpg .zsh_history
