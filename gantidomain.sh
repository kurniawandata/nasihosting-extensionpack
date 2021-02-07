echo -n "Masukkan nama domain lama : "
read domainlama
echo -n "Masukkan nama domain baru : "
read domainbaru
sed -i "s/$domainlama/$domainbaru/g" index.html
sed -i "s/$domainlama/$domainbaru/g" /var/www/html/index.html
sed -i "s/$domainlama/$domainbaru/g" /usr/lib/cgi-bin/index.sh
sed -i "s/$domainlama/$domainbaru/g" /usr/lib/cgi-bin/run.sh
sed -i "s/$domainlama/$domainbaru/g" /usr/lib/cgi-bin/aktivasi3.sh
sed -i "s/$domainlama/$domainbaru/g" index.sh
sed -i "s/$domainlama/$domainbaru/g" run.sh
sed -i "s/$domainlama/$domainbaru/g" support/subdomain.conf
service apache2 restart
