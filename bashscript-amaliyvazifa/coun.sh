#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19
function file_count()
{
  local NUMBER_OF_FILE=$(ls -l | wc -l)
   echo "$NUMBER_OF_FILE"
}
file_count
