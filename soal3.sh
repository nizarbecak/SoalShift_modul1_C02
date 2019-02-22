#!/bin/bash

length=12
digits=({0..9})
lower=({a..z})
upper=({A..Z})
CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
ArrayLength=${#CharArray[*]}
password=""
for i in `seq 1 $length`
do
  index=$(($RANDOM%$ArrayLength))
  char=${CharArray[$index]}
  password=${password}${char}
done

i=1

while [ -f "/home/syauqi/Downloads/hasil_nomor_3/password$i.txt" ]
do
  ((i++))
done

echo "$password" > /home/syauqi/Downloads/hasil_nomor_3/password"$i".txt