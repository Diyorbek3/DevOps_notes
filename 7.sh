usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]
then
   echo "Disk 80% dan oshdi!"
else
   echo "Disk OK"
fi
