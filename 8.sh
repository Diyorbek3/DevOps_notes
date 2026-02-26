
if curl -s http://localhost:8080 > /dev/null
then
   echo "Service live"
else
   echo "Service down, restart qilamiz"
   systemctl restart myapp
fi
