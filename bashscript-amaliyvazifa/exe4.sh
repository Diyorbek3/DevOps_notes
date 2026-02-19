#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19

FILE="/home/diyor/DevOps_notes/bashscript-amaliyvazifa"

if [ -e “$FILE” ]
 then
    echo “$FILE passwords are enabled”
fi
if [ -x “$FILE” ]
 then
   echo “You have permition to execute $FILE”
 else
   echo “You do Not have permissions to execute $FILE”
fi
