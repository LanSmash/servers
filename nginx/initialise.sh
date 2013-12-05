ln -s -f /home/weby/servers/nginx/nginx.conf /etc/nginx/nginx.conf
mkdir -p /var/proxy/nginx/steampipe/depot
mkdir -p /var/proxy/nginx/wargaming
chown -R www-data /var/proxy/nginx
ln -s -f /home/weby/servers/nginx/www/* /var/www
