#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19

DAY=$(date +%F)
for FILE in *.jpg
do
   mv $FILE ${DAY}-${FILE}
done
