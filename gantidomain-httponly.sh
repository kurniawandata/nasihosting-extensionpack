echo -n "Masukkan nama domain lama : "
read domainlama
echo -n "Masukkan nama domain baru : "
read domainbaru
sed -i "s/$domainlama/$domainbaru/g" index2.html
sed -i "s/$domainlama/$domainbaru/g" /var/www/html/index.html
sed -i "s/$domainlama/$domainbaru/g" /usr/lib/cgi-bin/index.-httppnly.html
sed -i "s/$domainlama/$domainbaru/g" /usr/lib/cgi-bin/run-httponly.html
sed -i "s/$domainlama/$domainbaru/g" index-httponly.sh
sed -i "s/$domainlama/$domainbaru/g" run-httponly.sh
sed -i "s/$domainlama/$domainbaru/g" support/subdomain2.conf
service apache2 restart
