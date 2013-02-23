#!/bin/bash

# 
# get latest updates from the central bare git repo for manifest or modules
#

if [ -z "$1" ]; then
   echo "Choose a repository to clone:  manifests or modules"
exit 1
fi

echo "Pulling latestest updates for Repo:  "$1"..."
sleep 1
cd ~
cd $1
git fetch origin master
git pull origin master
