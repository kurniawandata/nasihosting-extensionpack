echo -n "Masukkan nama domain lama : "
read domainlama
echo -n "Masukkan nama domain baru : "
read domainbaru
sed -i "s/$domainlama/$domainbaru/g" index.html
sed -i "s/$domainlama/$domainbaru/g" index-httponly.sh
sed -i "s/$domainlama/$domainbaru/g" run-httponly.sh
sed -i "s/$domainlama/$domainbaru/g" support/subdomain2.conf
service apache2 restart
