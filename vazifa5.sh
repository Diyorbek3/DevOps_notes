#!/bin/bash

input_file="test_log.log"
output_file="errors_only.log"

if [ ! -f "$input_file" ]; then
  echo "Xatolik: $input_file topilmadi!"
  exit 1
fi

grep "ERROR" "$input_file" > "$output_file"

error_count=$(wc -l < "$output_file")

echo "--- Log Tahlili Yakunlandi ---"
echo "Jami xatoliklar soni: $error_count"
echo "Xatoliklar '$output_file' fayliga saqlandi."
