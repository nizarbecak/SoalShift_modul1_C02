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
  i sebagai increament nama file yang akan disimpan nantinya
  base64 untuk melakukan decode
  xxd -r untuk merubah isi dari hex menjadi binary

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

