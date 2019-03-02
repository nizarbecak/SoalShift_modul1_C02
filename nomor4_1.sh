#!/bin/bash

kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
kapital="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

jam=`date +"%H"`
nama=`date +"%H:%M %d-%m-%y"`

awk '{print}' /home/syauqi/Downloads/hasil_nomor_4/"$jam"* | tr "${kecil:$jam:26}${kapital:$jam:26}" "${kecil:0:26}${kapital:0:26}" > /home/syauqi/Downloads/hasil_nomor_4/"$nama"dec.log
