#!/bin/bash

#
# push new code changes module or manifest changes from your personal repo to 
# the Puppet Central git Repository
#

echo "Tracking changes made to working repository..."
sleep 1
git add *

echo "Pushing changes to Central Puppet Repo..."
sleep 1
git push origin master:master
