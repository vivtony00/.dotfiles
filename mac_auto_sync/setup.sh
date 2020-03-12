#!/bin/bash

set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR

type fswatch > /dev/null 2>&1 || brew install fswatch

chmod +x auto_commit_push.sh

cp com.eriksuen.autosync_dotfiles.plist ~/Library/LaunchAgents

sed -i "" "s;\$HOME;${HOME};g" ~/Library/LaunchAgents/com.eriksuen.autosync_dotfiles.plist

launchctl load -w ~/Library/LaunchAgents/com.eriksuen.autosync_dotfiles.plist
