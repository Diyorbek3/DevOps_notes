#!/bin/bash

# 1. Argument orqali log faylni olish
LOG_FILE=$1

# Fayl tekshirish
if [[ -z "$LOG_FILE" || ! -f "$LOG_FILE" ]]; then
  echo "Xatolik: log fayl yo'q. Masalan: ./log_analyzer.sh test.log"
  exit 1
fi

REPORT_FILE="report.txt"

echo "Tahlil boshlandi: $LOG_FILE"

# 2. Statistikalar
total_lines=$(wc -l < "$LOG_FILE")
error_count=$(grep -c "ERROR" "$LOG_FILE")

# Eng ko‘p uchraydigan 5 ta error turi
top_errors=$(grep "ERROR" "$LOG_FILE" | sort | uniq -c | sort -nr | head -5)

# CRITICAL qatorlar + qator raqami
critical_lines=$(grep -n "CRITICAL" "$LOG_FILE")

# 3. Hisobot yozish
{
echo "===== LOG TAHLIL HISOBOTI ====="
echo "Fayl nomi: $LOG_FILE"
echo "Sana: $(date)"
echo "-------------------------------"
echo "Jami qatorlar: $total_lines"
echo "Jami ERROR lar: $error_count"
echo
echo "Top 5 xatolik turi:"
echo "$top_errors"
echo
echo "CRITICAL xabarlar (qator raqami bilan):"
echo "$critical_lines"
echo "======================================="
} > "$REPORT_FILE"

echo "Hisobot tayyor: $REPORT_FILE"
