apt-get install nginx
ln -s -f /home/weby/servers/nginx/nginx.conf /etc/nginx/nginx.conf
mkdir -p /var/proxy/nginx/steampipe/depot
mkdir -p /var/proxy/nginx/wargaming
chown -R www-data /var/proxy/nginx
ln -s -f /home/weby/servers/nginx/www /var/www

echo generating SSL certificate
cd /etc/nginx/
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -days 3650 -subj '/C=AU/ST=AU/L=Event/CN=Proxy.lansmash'
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
/etc/init.d/nginx restart

