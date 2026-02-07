#!/bin/bash
#author Diyorbek
#date 07/02/2026

echo "Xush kelibsiz! Interaktiv Fayl Tadqiqotchisi ishga tushdi."
echo "Joriy papkadagi fayllar va ularning hajmi:"
ls -lh
echo ""
echo ""
echo "---------------------------------------------------------"
while true; do
    read -p "Matn kiriting (To'xtash uchun Enter tugmasini bosing): " input
    if [ -z "$input" ]; then
        echo "Tadqiqotchi yopilmoqda. Xayr!"
        break
    fi
    echo "Belgilar soni: ${#input}"
    echo
done 
