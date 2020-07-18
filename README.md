# nasihosting-extensionpack


Nasihosting Extension Pack v1.0 Beta 1
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
9. nano /usr/lib/cgi-bin/run.sh
10. Ganti password : passwordmysql setelah itu keluar lalu simpan
11. sudo nano /etc/apache2/sites-available/000-default.conf
12. Tambahkan baris di bawah ini dalam tag <VirtualHost></VirtualHost>. 

ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/

<Directory "/usr/lib/cgi-bin"> 

AllowOverride None

Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch 

Order allow,deny 

Allow from all

</Directory>

Setelah itu simpan dengan perintah ctrl+x lalu y lalu enter.

13. service apache2 restart lalu enter
14. Untuk membuat akun http://ipserver/cgi-bin/index.sh

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
