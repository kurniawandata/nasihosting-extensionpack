#!/bin/bash
echo "Content-type: text/html"
echo ""
name=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[1]}' | awk '{split($0,array,"=")} END{print array[2]}' | tr [:upper:] [:lower:]`
password=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[2]}' | awk '{split($0,array,"=")} END{print array[2]}'`
wa=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[3]}' | awk '{split($0,array,"=")} END{print array[2]}'`
cek=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[4]}' | awk '{split($0,array,"=")} END{print array[2]}'`
line=$(head -n 1 key.txt)
tanggal=$(date +%d-%m-%Y)
random=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
if [[ "${name}" =~ [^a-z0-9] ]]; then
echo "Username hanya boleh huruf dan angka"
else
if [[ "${password}" =~ [^a-z0-9] ]]; then
echo "Password hanya boleh huruf dan angka"
else
if [[ "$cek" != "$line" ]]; then 
echo "Kode keamanan berubah, silahkan refresh dan daftar kembali"
else
acak=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5 ; echo '')
echo $acak > key.txt
convert \
    -size 225x100 \
    xc:lightblue \
    -font Bookman-DemiItalic \
    -pointsize 18 \
    -fill blue \
    -gravity center \
    -draw "text 0,0 $acak" \
    image.png
convert image.png -background white -wave 4x55 image.png
sudo cp /usr/lib/cgi-bin/image.png /var/www/htm;
if [[ "${wa}" =~ [^a-z0-9] ]]; then
echo "Nomor WA hanya boleh angka"
else
if [ -z "$(ls -A /home/$name)" ]; then
cp /usr/lib/cgi-bin/image.png /var/www/html/
echo $name, $password, $wa, $tanggal. > /home/rambutan/$name.$tanggal
echo $name, $password, $wa, $tanggal. > /home/recovery/$name.$random
sudo mcrypt /home/recovery/$name.$random -k $wa
rm /home/recovery/$name.$random
sudo chmod 777 /home/recovery/*
sudo mkdir /home/$name
sudo mkdir /home/$name/recovery
sudo cp /home/nasihosting-extensionpack/filemanager/* /home/$name
sudo cp /home/nasihosting-extensionpack/filemanager/* /home/$name/recovery
sudo chmod 777 /home/$name
sudo chmod 777 /home/$name/*
sudo chmod 777 /home/$name/recovery
sudo chmod 777 /home/$name/recovery/*
sed -i "s/unik/$password/g" /home/$name/config.php
sed -i "s/unik/$password/g" /home/$name/recovery/config.php
cp /home/nasihosting-extensionpack/support/subdomain.conf /etc/apache2/sites-available/$name.conf
sed -i "s/sample/$name/g" /etc/apache2/sites-available/$name.conf
sudo a2ensite $name.conf
sudo systemctl reload apache2
sudo cp /usr/lib/cgi-bin/aktivasi3.sh /usr/lib/cgi-bin/aktivasi4.sh
sed -i "s/unik/$name/g" /usr/lib/cgi-bin/aktivasi4.sh
chmod 777 aktivasi4.sh
./aktivasi4.sh
rm aktivasi4.sh
mysql -uroot -p(passwordmysql) -e "CREATE DATABASE "$name""
mysql -uroot -p(passwordmysql) -e "GRANT ALL PRIVILEGES ON "$name".* TO "$name"@localhost IDENTIFIED BY '"$password"'"
cat <<EOT
<!DOCTYPE html>
<html>
<head>
<title>Nasihosting</title>
</head>
<body>
<h2>Welcome $name </h1>
Alamat website anda : https://$name.nasihosting.com <br />
Login : https://$name.nasihosting.com/login.php<br />
Username : admin<br />
Password : $password<br />
Cara ganti password edit pada bagian config.php, cari password anda dan ganti dengan password yang baru<br />
<br />
Login phpmyadmin<br />
Login : https://$name.nasihosting.com/phpmyadmin<br />
Username : $name <br />
Password : $password <br />
<br />
Jika file config.php atau login.php terhapus<br />
Login : https://$name.nasihosting.com/recovery/login.php<br />
Username : admin <br />
Password : $password <br />
<br />
Jika lupa password<br />
Download file yang terenkripsi yang berisi password :<a href="https://recovery.nasihosting.com/$name.$random.nc">https://recovery.nasihosting.com/$name.$random.nc</a></br>
Password enkripsi: $wa <br />
Untuk Decrypt menggunakan mcrypt di linux dengan perintah : mcrypt  -d $name.$random.nc<br />
<br />
Saat ini subdomain anda sudah aktif
<br />
File login.php dan config.php tidak boleh dihapus. 
<br>
<br>
<center>https://nasihosting.com</center>
<br>
</body>
</html>
EOT
else
echo "Subdomain yang anda masukkan sudah ada pemiliknya"
fi
fi
fi
fi
fi
