#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19

MESSAGE="Random number is: $RANDOM"
echo "$MESSAGE"
logger -t "messages" -p user.info "$MESSAGE"

