#!/bin/bash

BASEDIR=$(dirname "$0")
cd $BASEDIR
echo $(pwd)
git add .
git commit -m "auto commit" -a
git push origin master