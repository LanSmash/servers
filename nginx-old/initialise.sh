apt-get install nginx
ln -s -f /home/weby/servers/nginx/nginx.conf /etc/nginx/nginx.conf
chown -R www-data /var/proxy


/etc/init.d/nginx restart

