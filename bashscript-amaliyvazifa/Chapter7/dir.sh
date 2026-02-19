#!/bin/bash
dir_path="/tmp/foo"
if mkdir "$dir_path"
then
   echo "Dir created." 
else
   echo "Dir failed to create."
fi
