#!/bin/bash

# 
# Author: e00949
# Date: 20120720
#
# push new code changes module or manifest changes from your personal repo to 
# the Puppet Central git Repository
#
# Author: e00949
# Update: 20120720
# CHANGELOG:  potentially not all changes are being pushed to the repo if you are not
#             in the right directory of the repository. Lets fix this and ensure the user
#             is in ~/[cloned_repo] before doing the push
#
# 20120730 <e00949>    revised the way I do a git add using 'git add .' instead of path         
#

echo $USER | grep -q '^e' 
if [ $? -eq 1 ]; then
  echo "You must use your e account to run this script."
  exit 1
fi

echo "Enter the name of the repo you are pushing to [manifests | modules] "
read GIT_REPO

echo "Enter a description for the changes you are commiting: "
read GIT_COMMENT

echo "Adding changed files to git..."
cd ~/${GIT_REPO}
sleep 1
#git add ~/${GIT_REPO}/*
git add .

echo "Commiting changes to git..."
sleep 1
git commit -m "${GIT_COMMENT}"

echo "Pushing changes to Central Puppet Repo..."
sleep 1
git push origin master:master
