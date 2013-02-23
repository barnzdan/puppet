#!/bin/bash

echo ""
echo "This script will wipe and refresh your environment from the git bare repo from /var/lib/puppet/git. Press ^C to bailout"
echo ""

sleep 5

rm -rf manifests
rm -rf modules

sudo -u pe-puppet /usr/local/sbin/clonerepo.sh manifests
sudo -u pe-puppet /usr/local/sbin/clonerepo.sh modules
