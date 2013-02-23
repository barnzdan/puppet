#!/bin/bash
#
#
# This script will discover new vDisks presented to a RHEL VM
# Its akin to the cfgmgr command in AIX
#
# :::WARNING::: do not modify this file your changes will be overwritten
# any changes made to this file should be done on the cfgmgr.sh template
# within the admin_scripts module
#

echo "Discoverying new disks..."
sleep 1
echo "-  -  -" > /sys/class/scsi_host/host0/scan 

if [ -e /sys/class/scsi_host/host1 ]; then
    echo "-  -  -" > /sys/class/scsi_host/host1/scan
elif [ -e /sys/class/scsi_host/host2 ]; then
    echo "-  -  -" > /sys/class/scsi_host/host2/scan
elif [ -e /sys/class/scsi_host/host3 ]; then
    echo "-  -  -" > /sys/class/scsi_host/host3/scan
fi
