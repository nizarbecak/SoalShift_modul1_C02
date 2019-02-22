#!/bin/bash

i=1

for file in /home/syauqi/Downloads/nature/*.jpg
do
  base64 -d "$file" | xxd -r > /home/syauqi/Downloads/nature/image"$i".jpg
  ((i++))
done