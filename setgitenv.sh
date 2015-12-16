#!/usr/bin/env bash

#
# setup users git environment author info
#

echo "Enter your full name: "
read FULL_NAME

echo "Enter your email address: "
read EMAIL

git config --global user.name "${FULL_NAME}"
git config --global user.email "${EMAIL}"
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
