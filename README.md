Akhmad Nizar Zulmi (05111640007002) <br>
Ahmad Syauqi (05111740000093)

# SoalShift_modul1_C02

## Soal 1
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah
dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah
nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh
file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari
jumat pada bulan Februari.
Hint: Base64, Hexdump

### Penyelesaian
- Membuat file .sh dengan isi seperti berikut
  ```
  #!/bin/bash
  
  i=1
  
  for file in /home/syauqi/Downloads/nature/*.jpg
  do
    base64 -d "$file" | xxd -r > /home/syauqi/Downloads/nature/image"$i".jpg
    ((i++))
  done
  ```
  i sebagai increament nama file yang akan disimpan nantinya<br>
  base64 untuk melakukan decode<br>
  xxd -r untuk merubah isi dari hex menjadi binary<br>

- Menambah cronjob dengan format berikut
  ```
  14 14 14 2 5 /bin/bash /home/syauqi/Downloads/nomor1.sh
  ```
  
![soal1](/image_modul1/soal1.png)

## Soal 2
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:
1. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
2. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
3. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

### Penyelesaian
- Membuat file .sh dengan isi seperti berikut
  ```
  #!/bin/bash

  awk -F "," `$7==2012 {a[$1] += $10} END {for (i in a) print a[i]","i}` /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 1

  awk -F "," '$7==2012 && $1=="United States" {a[$4] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3

  awk -F "," '$7==2012 && $1=="United States" && $4=="Personal Accessories" {a[$6] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3

  awk -F "," '$7==2012 && $1=="United States" && $4=="Camping Equipment" {a[$6] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3

  awk -F "," '$7==2012 && $1=="United States" && $4=="Outdoor Protection" {a[$6] += $10} END {for (i in a) print a[i]","i}' /home/syauqi/Downloads/WA_Sales_Products_2012-14.csv | sort -r -nk1 | head -n 3
  ```
  
  awk yang pertama untuk mengetahui negara mana yang memiliki penjualan terbanyak<br>
  awk yang kedua untuk mengetahui product line berdasarkan hasil awk yang pertama<br>
  awk yang ketiga sampai kelima untuk mengetaui product berdasarkan hasil awk yang kedua<br>
  
  ![soal2](/image_modul1/soal2.png)
  
## Soal 3
Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:
1. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
2. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
3. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
4. Password yang dihasilkan tidak boleh sama.

### Penyelesaian
- Membuat file .sh dengan isi seperti berikut
  ```
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
  ```
  
  Loop pertama untuk membuat password<br>
  Loop kedua untuk menentukan nama file yang harus diubah sebagai penyimpanan dari password yang digenerate<br>
  
  ![soal3_1](/image_modul1/soal3_1.png)
  ![soal3_2](/image_modul1/soal3_2.png)
  
## Soal 4
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-
bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string
manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai
berikut:
1. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
2. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.
3. setelah huruf z akan kembali ke huruf a
4. Backup file syslog setiap jam.
5. dan buatkan juga bash script untuk dekripsinya.

### Penyelesaian
- Membuat file .sh dengan isi seperti berikut
  ```
  #!/bin/bash

  kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
  kapital="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

  jam=`date +"%H"`
  nama=`date +"%H:%M %d-%m-%y"`

  awk '{print}' /var/log/syslog | tr "${kecil:0:26}${kapital:0:26}" "${kecil:$jam:26}${kapital:$jam:26}" > "/home/syauqi/Downloads/hasil_nomor_4/$nama.log"
  ```
  
  tr sebagai manipulasi text, setiap huruf alfabet ditambahkan dengan jam
  
  ![soal4](/image_modul1/soal4.png)
  
- Menambah crontab dengan format:
  ```
  0 * * * * /bin/bash /home/syauqi/Downloads/nomor4.sh
  ```
- Membuat file .sh yang berfungsi untuk melakukan decrypt
  ```
  #!/bin/bash

  kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
  kapital="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

  jam=`date +"%H"`
  nama=`date +"%H:%M %d-%m-%y"`

  awk '{print}' /home/syauqi/Downloads/hasil_nomor_4/"$jam"* | tr "${kecil:$jam:26}${kapital:$jam:26}" "${kecil:0:26}${kapital:0:26}" > /home/syauqi/Downloads/hasil_nomor_4/"$nama"dec.log
  ```
  

## Soal 5
Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:
1. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
2. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
3. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
4. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

## Penyelesaian
1. Syslog pada linux disimpan di direktori /var/log/syslog maka kita harus menampilkannya dengan command cat /var/log/syslog.
2. Untuk memfilter dimana syslog yang disimpan harus tidak memiliki string “sudo” dan memiliki string “cron” maka digunakan awk ‘~!/sudo/ && ~/cron/ {print $0}’
3. Syslog yang disimpan tidak bersifat case sensitif artinya tidak membedakan huruf kecil dan huruf besar, maka bisa menggunakan fungsi tolower(string_yang _akan_di lowercase) lalu stringnya dicocokkan dengan “sudo” dan “cron” tadi
4. Hasil dari pencarian tersebut dibatasi menjadi kurang dari 13 fields dengan cara memakai built-in variable NF < 13 kemudian dimasukkan ke file log dimana letaknya di /home/becak/modul1/syslog.txt
5. Secara keseluruhan maka commandnya menjadi:

![soal5_2](/image_modul1/soal5_2.png)

Hasil setelah di cat syslog.txt:
![soal5_1](/image_modul1/soal5_1.png)

Lalu untuk mengatur waktu eksekusi shell scriptnya digunakan crontab -e dengan format waktu:
2-30/6 * * * * /home/becak/modul1/soal5.sh<br><br>
Cara mengeceknya tinggal tunggu waktunya menunjukkan menit ke 2, 8, 4, 14, 20, 26
