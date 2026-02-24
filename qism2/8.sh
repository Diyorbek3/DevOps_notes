#!/bin/bash

FILE="/var/log/syslog"

if [ -f "$FILE" ]
then
   echo "Log mavjud"
else
   echo "Log yo'q"
fi
