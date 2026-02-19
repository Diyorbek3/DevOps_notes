#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19
FILE=$1
if [ -f  "$FILE" ]
 then
   echo “It is reguler File”
   exit 0
elif [ -d "$FILE" ]
  then
    echo “It is directory”
    exit 1
else
  echo “It is another type of file”
  exit 2
fi