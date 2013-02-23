#!/bin/bash

#
# push new code changes module or manifest changes from your personal repo to 
# the Puppet Central git Repository
#

echo "Enter a description for the changes you are commiting: "
read GIT_COMMENT

echo "Commiting changes to git..."
sleep 1
git commit -m "${GIT_COMMENT}"

echo "Pushing changes to Central Puppet Repo..."
sleep 1
git push origin master:master
