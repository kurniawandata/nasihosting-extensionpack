echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Instalasi Nasihosting-Extensionpack - httponly  "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo -n "Masukkan nama domain : "
read domain
echo -n "Masukkan password root MySQL : "
read passwordmysql
passwordmysql="-p$passwordmysql"
sed -i "s/nasihosting.com/$domain/g" index2.html
sed -i "s/nasihosting.com/$domain/g" index-httponly.sh
sed -i "s/nasihosting.com/$domain/g" run-httponly.sh
sed -i "s/nasihosting.com/$domain/g" support/subdomain2.conf
sed -i "s/-ppasswordmysql/$passwordmysql/g" run-httponly.sh
sudo mkdir /home/root
sudo touch /home/root/locked
sudo a2enmod cgi
sudo service apache2 restart
sudo mv /var/www/html/index.html /var/www/html/backup
sudo cp index2.html /var/www/html/index.html
sudo cp index2.html /var/www/html/index.html
sudo chmod 777 /var/www/html/index.html
sudo cp index-httponly.sh /usr/lib/cgi-bin
sudo cp run-httponly.sh /usr/lib/cgi-bin
sudo chmod 777 /usr/lib/cgi-bin
sudo chmod 777 /usr/lib/cgi-bin/*
sudo chmod 777 /home
sudo chmod 777 /etc/apache2/sites-available
sudo sed -i "/more/i\www-data ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
sudo a2enmod ssl
sudo mkdir /etc/apache2/ssl
sudo chmod 777 /etc/apache2/ssl
sudo service apache2 restart
