# nasihosting-extensionpack


Nasihosting Extension Pack 5.2 Full version
--------------------
![alt text](http://xcode.or.id/04_small-logo.png)

Versi 5.0 sudah mendukung keamanan captcha gambar yang algoritma dan pemrogramannya dibuat sendiri oleh Kurniawan

Hanya mendukung Ubuntu Server 16.04 dan 18.04, untuk untuk Ubuntu 20.04 tidak didukung, jika dipaksakan, maka user tidak bisa login ke phpmyadmin tapi bisa untuk file manager. 

Script untuk membangun hosting yang berjalan otomatis dari sisi client, subdomain langsung aktif dan bisa langsung dipakai. 

Cara menggunakan Nasihosting-ExtensionPack
------------------------------------------
ExtensionPack hanya boleh dijalankan jika Nasihosting minimal v3.2 sudah aktif dan berjalan normal di server
1. cd /home (harus di /home)
2. git clone https://github.com/kurniawandata/nasihosting-extensionpack
3. cd nasihosting-extensionpack
4. chmod -R 777 *
5. ./install-httponly.sh (tanpa https)
6. ./install.sh (pakai https, pastikan sertifikat untuk SSL sudah punya)
7. Edit aktivasi3.sh, sesuaikan dengan setting di akun cloudflare

Untuk point 7, jika ingin aktivasi manual, tidak otomatis maka hapus kode sumber di bawah ini :

Kode sumber yang dihapus pada file aktivasi3.sh, jika tidak ingin aktivasi otomatis (Aktivasi manual)
-------------
sudo cp /usr/lib/cgi-bin/aktivasi3.sh aktivasi4.sh

sed -i "s/unik/$name/g" /usr/lib/cgi-bin/aktivasi4.sh

chmod 777 aktivasi4.sh

./aktivasi4.sh

rm aktivasi4.sh

Ganti domain utama
------------
./gantidomain.sh (mendukung https)

./gantidomain-httponly.sh (hanya mendukung http)

Penemu bug
----------
Versi 1.x : Pak Josua RCE bug - PHP 7.2 & others (Sudah dipatch sejak di nasihosting core versi 2.x)

Versi 1.x - 2.x : Anon7 RCE bug - PHP 7.4.12 (Sudah dipatch sejak di nasihosting core versi 3.3)

Versi 1.x - 3.1 : Anon7 Directory Traversal bug (Sudah dipatch dipatch di nasihosting-extension pack sejak versi 3.2)

Versi 1.x - 3.3 : Serangan spam pada input registrasi secara otomatis, patch sementara minimalisir memanfaatkan pengecekan waktu menit di index.sh dan run.sh di versi 3.2.

Mulai versi 5.0 sudah menggunakan Captcha gambar yang sudah stabil untuk menggantikan keamanan yang memanfaatkan pengecekan waktu yang masih bisa dispam otomatis, seiring perkembangan captcha gambar lebih dipersulit untuk membaca huruf.

Licensi
-------
GNU General Public License v3

Program ini dibuat oleh :
--------------------------------------------
Kurniawan. E-mail : kurniawanajazenfone@gmail.com
xcode.or.id


Donasi :
--------
Donasi untuk Kurniawan telah berkontribusi sebagai pengembang free software & open source dalam bentuk gopay<br />

 <img src="https://xcode.co.id/qrcodex2.png" alt="gopay"> <br />
 Gopay (Customer)
