#!/bin/bash

read -p "Parol kiriting: " pass

if [ "$pass" = "1234" ]
then
   echo "Kirish ruxsat etildi"
else
   echo "Access denied"
fi
