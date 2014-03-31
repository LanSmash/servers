apt-get install nginx
ln -s -f /home/weby/servers/nginx-www/nginx.conf /etc/nginx/nginx.conf
mv /var/www /var/www-disabled
ln -s -f /home/weby/servers/nginx-www/www /var/www

echo generating SSL certificate
cd /etc/nginx/
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -days 3650 -subj '/C=AU/ST=AU/L=Event/CN=Proxy.lansmash'
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
/etc/init.d/nginx restart

