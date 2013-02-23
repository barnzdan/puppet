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
# CHANGELOG:  Lets have git repos clone to a common location ie everyones $HOME
#             Also ensure user is using e account not root or pe-puppet
#
# CHANGELOG:  Changed script to a case script to ensure we are getting the args we want
# 
# clone the central bare git repo for manifest or modules
#

# ensure running with regular account
echo $USER | grep -q '^e'
if [ $? -eq 1 ]; then
  echo "You must use your e account to run this script."
  exit 1
fi

case "$1" in

'manifests')
    echo "Cloning "$1" to $HOME/$1..."
    rm -rf ~/${1} > /dev/null 2>&1
    sleep 1
    cd ~
    git clone pe-puppet@xwtcvpconman:git/${1}.git
    cd $1
    git remote rm origin
    git remote add origin pe-puppet@xwtcvpconman:git/${1}.git
;;

'modules')
    echo "Cloning "$1" to $HOME/$1..."
    rm -rf ~/${1} > /dev/null 2>&1
    sleep 1
    cd ~
    git clone pe-puppet@xwtcvpconman:git/${1}.git
    cd $1
    git remote rm origin
    git remote add origin pe-puppet@xwtcvpconman:git/${1}.git
;;

*)
  echo "Choose a repository to clone:  manifests or modules"
  echo "Usage: `basename $0` {modules|manifests}"
  exit 1
;;

esac
