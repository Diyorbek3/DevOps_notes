#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19

cat/etc/shadow
if [ “$?” -eq “0” ]
 then
   echo “Command succeeded”
   exit 0
 else
   echo “Command failed”
   exit 1
fi
