#!/bin/bash

day=$(date +%u)

if [ "$day" -eq 5 ]; then
   echo "Backup boshlanmoqda..."
   tar -czf backup.tar.gz /home
else
   echo "Bugun backup kuni emas"
fi
