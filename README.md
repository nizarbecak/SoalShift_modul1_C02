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
