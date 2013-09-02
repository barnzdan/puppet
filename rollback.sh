#!/usr/bin/env bash

echo "Enter a version number to rollback to"
echo "The versions to choose from are: `git tag -n`"
read VERSION_NUM

git reset --hard ${VERSION_NUM}
