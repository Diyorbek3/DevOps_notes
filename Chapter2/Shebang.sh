#!/usr/bin/env bash
# Purpose: Mount glusterfs at boot time
#          Must run as root
# Author: Vivek Gite
# --------------------------------------
p='gfs01:/gvol01'

mount | grep -wq "^${p}"

if [ $? -ne 0 ]
then
	mount -t glusterfs "$p" /sharedwww/
fi