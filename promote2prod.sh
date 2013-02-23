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

echo ""
echo ""
echo ""
echo "!!!!!!!!!!!!!"
echo "!!!WARNING!!!"
echo "!!!!!!!!!!!!!"
echo ""
echo "You are about to release configuration code changes to the PRODUCTION puppet environment"
echo "Ensure you have properly tested these changes in the DEV and TEST environments before proceeding"
echo ""
echo "If something goes horribly wrong you can backout your latest production release with the following command"
cd $PROD/${1}
echo "  git reset --hard `git describe --abbrev=0 --tags` "
echo ""

cd $PROD/${1}

echo "Enter a version number for production release"
echo "The latest version number is: " `git tag -l | sort -V | tail -n 1`
read VERSION_NUM

echo "Enter a comment to add to production release"
read COMMENT

git tag -a ${VERSION_NUM} -m  "${COMMENT}"

sleep 5

git fetch origin
git pull origin master --force

