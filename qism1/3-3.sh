#!/bin/bash

usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]; then
   echo "Disk to'lyapti! Alert!"
else
   echo "Disk normal"
fi
