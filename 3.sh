ls /tmp
status=$?  # Saqlash
echo "Natija: $status"  # Chiqarish
Qo'shimcha Misol: Bir necha command

date
status1=$?
ls /notexist
status2=$?
echo "Date status: $status1, LS status: $status2"
