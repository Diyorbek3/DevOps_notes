#!/bin/bash

if pgrep nginx > /dev/null
then
   echo "Nginx ishlayapti"
else
   echo "Nginx ishlamayapti, restart qilinmoqda"
   systemctl restart nginx
fi
