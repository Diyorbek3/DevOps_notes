#!/bin/bash
status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
if [ "$status" -eq 200 ]
then
   echo "OK"
elif [ "$status" -eq 404 ]
then
   echo "Not Found"
elif [ "$status" -eq 500 ]
then
   echo "Server Error"
