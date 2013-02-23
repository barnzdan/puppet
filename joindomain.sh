#!/usr/bin/env bash

#
# This script is controlled and distributed by puppet enterprise
# any modifications to this outside the puppet module admin_scripts
# will be overwritten
#
# This script will prompt you for required information to add a system to 
# the Active Directory PGE domain.
#

echo "Please enter the Centrify Zone you are putting this system in:  "
read READ_ONE

echo "Please enter your Active Directory account name with permissions to add this system to the AD domain:  "
read READ_TWO

adjoin -c "ou=UNIX Servers,ou=unix" -z ${READ_ONE} -u ${READ_TWO}@corp.dom corp.dom

echo "Restarting crond to make it LDAP aware..."
sleep 1
/sbin/service crond restart
