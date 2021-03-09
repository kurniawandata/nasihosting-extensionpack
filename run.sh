#!/bin/bash
echo "Content-type: text/html"
echo ""
name=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[1]}' | awk '{split($0,array,"=")} END{print array[2]}' | tr [:upper] [:lower:]`
password=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[2]}' | awk '{split($0,array,"=")} END{print array[2]}'`
wa=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[3]}' | awk '{split($0,array,"=")} END{print array[2]}'`
tanggal=$(date +%d-%m-%Y)
if [ -z "$(ls -A /home/$name)" ]; then
echo $name, $password, $wa, $tanggal. > /home/datauser/$name.$tanggal
sudo mkdir /home/$name
sudo cp /home/nasihosting-extensionpack/filemanager/* /home/$name
sudo chmod 777 /home/$name
sudo chmod 777 /home/$name/*
sed -i "s/unik/$password/g" /home/$name/config.php
cp /home/nasihosting-extensionpack/support/subdomain.conf /etc/apache2/sites-available/$name.conf
sed -i "s/sample/$name/g" /etc/apache2/sites-available/$name.conf
sudo a2ensite $name.conf
sudo systemctl reload apache2
sudo cp /usr/lib/cgi-bin/aktivasi3.sh aktivasi4.sh
sed -i "s/unik/$name/g" /usr/lib/cgi-bin/aktivasi4.sh
chmod 777 aktivasi4.sh
./aktivasi4.sh
rm aktivasi4.sh
mysql -uroot -ppasswordmysql -e "CREATE DATABASE "$name""
mysql -uroot -ppasswordmysql -e "GRANT ALL PRIVILEGES ON "$name".* TO "$name"@localhost IDENTIFIED BY '"$password"'"
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
Saat ini subdomain anda sudah aktif
<br />
File login.php dan config.php tidak boleh dihapus. 
</body>
</html>
EOT
else
echo "Subdomain yang anda masukkan sudah ada pemiliknya"
fi
