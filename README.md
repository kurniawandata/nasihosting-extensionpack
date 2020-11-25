# nasihosting-extensionpack


Nasihosting Extension Pack v1.0 Beta 9
--------------------
![alt text](http://xcode.or.id/04_small-logo.png)

Script untuk membangun hosting otomatis dari sisi client, pemilik hosting cukup tugasnya mengarahkan subdomain dari cloudflare

Cara menggunakan Nasihosting-ExtensionPack
------------------------------------------
ExtensionPack hanya boleh dijalankan jika Nasihosting v1.1 sudah aktif dan berjalan normal di server
1. cd /home
2. git clone https://github.com/kurniawandata/nasihosting-extensionpack
3. cd nasihosting-extensionpack
4. chmod -R 777 *
5. a2enmod cgi 
6. service apache2 restart
7. cp index.sh /usr/lib/cgi-bin
8. cp run.sh /usr/lib/cgi-bin
9. chmod 777 /usr/lib/cgi-bin
10. chmod 777 /usr/lib/cgi-bin/*
11. chmod 777 /home
12. chmod 777 /etc/apache2/sites-available
13. nano /usr/lib/cgi-bin/run.sh
14. Ganti password : passwordmysql setelah itu keluar lalu simpan
15. nano /etc/sudoers, isi : www-data ALL=(ALL) NOPASSWD: ALL
16. a2enmod ssl
17. Buat nasihosting.com.key dan nasihosting.com.pem dengan isi yang didapat dari cloudflare
18. mkdir /etc/apache2/ssl
19. chmod 777 /etc/apache2/ssl
20. service apache2 restart lalu enter
21. Untuk membuat akun http://ipserver/cgi-bin/index.sh
22. Untuk keamanan pastikan akun root dibuat terlebih dahulu agar password root tidak tertimpa atau dibypass, jika ada akun lain database lain punya akses seperti root pastikan juga dibuat terlebih dahulu akunnya.

Licensi
-------
GNU General Public License v3

Program ini dibuat oleh :
--------------------------------------------
Kurniawan. kurniawan@xcodetraining.com.
xcode.or.id


Donasi :
--------
Jika ingin donasi untuk Kurniawan

Gopay :

![alt text](http://xcodeserver.my.id/gofood.png)

![alt text](http://xcodeserver.my.id/gopay.png)

Ovo :

![alt text](http://xcodeserver.my.id/ovo3.png)

![alt text](http://xcodeserver.my.id/ovo2.png)
