#!/bin/bash

kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
kapital="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

jam=`date +"%H"`
nama=`date +"%H:%M %d-%m-%y"`

awk '{print}' /var/log/syslog | tr "${kecil:0:26}${kapital:0:26}" "${kecil:$jam:26}${kapital:$jam:26}" > "/home/syauqi/Downloads/hasil_nomor_4/$nama.log"