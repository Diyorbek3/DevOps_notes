#!/bin/bash
# author: Diyorbek
# date: 07/02/2026
# 3-Kun: Foydalanuvchi hisoblarini boshqarish

# Root tekshiruvi
if [ "$EUID" -ne 0 ]; then
    echo "Xatolik: Skriptni ishlatish uchun root ruxsati kerak. sudo bilan ishga tushiring."
    exit 1
fi

# Yordam funksiyasi
show_help() {
    echo "Usage: $0 [OPTION]"
    echo "Options:"
    echo "  -c, --create    Yangi foydalanuvchi yaratish"
    echo "  -d, --delete    Foydalanuvchini o'chirish"
    echo "  -r, --reset     Parolni yangilash"
    echo "  -l, --list      Foydalanuvchilarni ko'rish"
    echo "  -h, --help      Yordam menyusi"
}

# Foydalanuvchi yaratish
create_user() {
    read -p "Yangi foydalanuvchi nomini kiriting: " uname
    if id "$uname" &>/dev/null; then
        echo "Xatolik: '$uname' foydalanuvchisi tizimda mavjud!"
        exit 1
    fi
    read -s -p "Parolni kiriting: " upass
    echo
    useradd -m "$uname"
    echo "$uname:$upass" | chpasswd
    echo "Muvaffaqiyatli: '$uname' foydalanuvchisi yaratildi!"
}

# Foydalanuvchi o'chirish
delete_user() {
    read -p "O'chirilishi kerak bo'lgan foydalanuvchi nomi: " uname
    if ! id "$uname" &>/dev/null; then
        echo "Xatolik: Bunday foydalanuvchi topilmadi!"
        exit 1
    fi
    userdel -r "$uname"
    echo "Muvaffaqiyatli: '$uname' foydalanuvchisi o'chirildi!"
}

# Parolni yangilash
reset_password() {
    read -p "Parolni yangilash uchun foydalanuvchi nomini kiriting: " uname
    if ! id "$uname" &>/dev/null; then
        echo "Xatolik: Bunday foydalanuvchi topilmadi!"
        exit 1
    fi
    read -s -p "Yangi parolni kiriting: " upass
    echo
    echo "$uname:$upass" | chpasswd
    echo "Muvaffaqiyatli: '$uname' foydalanuvchisi paroli yangilandi!"
}

# Foydalanuvchilar ro'yxati
list_users() {
    echo "Foydalanuvchilar va UID:"
    echo "------------------------"
    cut -d: -f1,3 /etc/passwd | awk -F: '{print $1 ": " $2}'
}

# Argumentlarni tekshirish
case "$1" in
    -c|--create)
        create_user
        ;;
    -d|--delete)
        delete_user
        ;;
    -r|--reset)
        reset_password
        ;;
    -l|--list)
        list_users
        ;;
    -h|--help|*)
        show_help
        ;;
esac
