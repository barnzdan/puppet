#!/bin/bash

#
# 20120720 - had problems with non-ff updates to local git repos
# added --force to git pull to override any local changes created outside
# the workflow process. -- e00949
#

if [ $USER != "pe-puppet" ]; then
  echo "This script must be run as the pe-puppet user"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Choose a repository to promote code from:  manifests or modules"
  exit 1
fi

echo "This script will promote changes made to the central puppet git repository to the TEST puppet environment..."
sleep 5

cd $TEST/${1}
git fetch origin
git pull origin master --force



