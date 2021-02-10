echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Instalasi Nasihosting-Extensionpack  "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo -n "Masukkan nama domain : "
read domain
echo -n "Masukkan password root MySQL : "
read passwordmysql
passwordmysql="-p$passwordmysql"
sed -i "s/-ppasswordmysql/$passwordmysql/g" run-httponly.sh
sed -i "s/nasihosting.com/$domain/g" index.html
sed -i "s/nasihosting.com/$domain/g" index.sh
sed -i "s/nasihosting.com/$domain/g" run.sh
sed -i "s/nasihosting.com/$domain/g" aktivasi3.sh
sed -i "s/nasihosting.com/$domain/g" support/subdomain.conf
sed -i "s/$domain.pem/nasihosting.com.pem" support/subdomain.conf
sed -i "s/$domain.key/nasihosting.com.key" support/subdomain.conf
sed -i "s/-ppasswordmysql/$passwordmysql/g" run.sh
sudo nano support/subdomain.conf
sudo mkdir /home/root
sudo touch /home/root/locked
sudo mkdir /home/datauser
sudo chmod 777 /home/datauser
sudo a2enmod cgi
sudo service apache2 restart
sudo mv /var/www/html/index.html /var/www/html/backup
sudo cp index.html /var/www/html/index.html
sudo chmod 777 /var/www/html/index.html
sudo cp index.sh /usr/lib/cgi-bin
sudo cp run.sh /usr/lib/cgi-bin
sudo cp aktivasi3.sh /usr/lib/cgi-bin
sudo chmod 777 /usr/lib/cgi-bin
sudo chmod 777 /usr/lib/cgi-bin/*
sudo chmod 777 /home
sudo chmod 777 /etc/apache2/sites-available
sudo sed -i "/more/i\www-data ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
sudo a2enmod ssl
sudo mkdir /etc/apache2/ssl
sudo chmod 777 /etc/apache2/ssl
sudo service apache2 restart
