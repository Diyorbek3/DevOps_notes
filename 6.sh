if pgrep nginx > /dev/null
then
   echo "Nginx ishlayapti"
else
   echo "Nginx ishlamayapti, restart qilamiz"
   systemctl restart nginx
fi
