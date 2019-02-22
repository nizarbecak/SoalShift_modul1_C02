#!/bin/bash

awk -F "," `$7==2012 {a[$1] += $10} END {for (i in a) print a[i]","i}` /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 1

awk -F "," '$7==2012 && $1=="United States" {a[$4] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3

awk -F "," '$7==2012 && $1=="United States" && $4=="Personal Accessories" {a[$6] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3

awk -F "," '$7==2012 && $1=="United States" && $4=="Camping Equipment" {a[$6] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3

awk -F "," '$7==2012 && $1=="United States" && $4=="Outdoor Protection" {a[$6] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3