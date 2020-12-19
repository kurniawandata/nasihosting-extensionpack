echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Instalasi Nasihosting-Extensionpack   "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo -n "Masukkan nama domain : "
read domain
sed -i "s/nasihosting.com/$domain/g" index.html
sudo a2enmod cgi
sudo service apache2 restart
sudo index.html /var/www/html
sudo cp index.sh /usr/lib/cgi-bin
sudo cp run.sh /usr/lib/cgi-bin
sudo chmod 777 /usr/lib/cgi-bin
sudo chmod 777 /usr/lib/cgi-bin/*
sudo chmod 777 /home
sudo chmod 777 /etc/apache2/sites-available
sudo nano /usr/lib/cgi-bin/run.sh
sudo sed -i "/more/i\www-data ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
sudo nano /etc/sudoers, isi : 
sudo a2enmod ssl
sudo mkdir /etc/apache2/ssl
sudo chmod 777 /etc/apache2/ssl
sudo service apache2 restart
