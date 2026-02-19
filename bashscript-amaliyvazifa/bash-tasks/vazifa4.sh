#!/bin/bash
# author: Diyorbek
# date: 07/02/2026
# 4-Kun: Tizim Metrikalari Monitoringi (Sleep bilan)

# ====== CPU, RAM va Disk ======
show_metrics() {
    clear
    echo "========================================="
    echo "      TIZIM MONITORING DASHBOARD"
    echo "========================================="

    echo "--- CPU Holati ---"
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU yuklamasi: " 100-$8 "%"}'

    echo
    echo "--- RAM Holati ---"
    free -h | awk 'NR==2{print "RAM: " $3 " ishlatilmoqda / " $2 " umumiy"}'

    echo
    echo "--- Disk Holati ---"
    df -h / | awk 'NR==2{print "Disk: " $1 " " $5 " to‘lgan"}'
}

# ====== Xizmat holatini tekshirish ======
check_service() {
    read -p "Qaysi xizmatni tekshirmoqchisiz? (masalan: nginx): " svc

    if ! systemctl list-unit-files | grep -q "^$svc"; then
        echo "Xatolik: '$svc' nomli xizmat topilmadi!"
        return
    fi

    systemctl is-active --quiet "$svc"
    if [ $? -eq 0 ]; then
        echo "[+] $svc hozirda ishlayapti."
    else
        echo "[!] $svc hozirda to‘xtatilgan."
        read -p "[?] Uni ishga tushirishni xohlaysizmi? (y/n): " ans
        if [ "$ans" = "y" ]; then
            sudo systemctl start "$svc"
            if [ $? -eq 0 ]; then
                echo "[+] $svc muvaffaqiyatli ishga tushirildi!"
            else
                echo "Xatolik: $svc ishga tushmadi."
            fi
        fi
    fi
}

# ====== Asosiy menyu ======
while true; do
    echo
    echo "========================================="
    echo "      TIZIM MONITORING DASHBOARD"
    echo "========================================="
    echo "1. Metrikalarni ko'rish"
    echo "2. Xizmat holatini tekshirish"
    echo "3. Chiqish"
    echo
    read -p "Tanlovingiz: " ch

    case $ch in
        1)
            read -p "Monitoring oraliq vaqtini kiriting (sekund): " sec
            while true; do
                show_metrics
                echo
                echo "(Chiqish uchun Ctrl+C bosing)"
                sleep "$sec"
            done
            ;;
        2)
            check_service
            ;;
        3)
            echo "Monitoring yakunlandi. Xayr!"
            exit 0
            ;;
        *)
            echo "Xatolik: noto‘g‘ri tanlov!"
            ;;
    esac
done
