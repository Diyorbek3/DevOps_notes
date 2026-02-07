#!/bin/bash

APP_NAME="my_web_app"

# Docker mavjudligini tekshirish
if ! command -v docker &> /dev/null; then
    echo "Docker topilmadi. O'rnatilmoqda..."
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
fi

# Agar konteyner allaqachon bo‘lsa
if sudo docker ps -a | grep -q $APP_NAME; then
    echo "Konteyner mavjud. Qayta ishga tushirilmoqda..."
    sudo docker rm -f $APP_NAME
fi

echo "Nginx konteyneri ishga tushirilmoqda..."
sudo docker run -d -p 80:80 --name $APP_NAME nginx

echo "✅ Muvaffaqiyatli!"
