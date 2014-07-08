

apt-get install nginx

#webby only
ln -s -f /home/weby/servers/nginx/nginx.conf /etc/nginx/nginx.conf

#better hope /var/proxy has some diskspace 
mkdir -p /var/proxy/nginx/cs.steampowered.com-proxy
mkdir -p /var/proxy/nginx/l3cdn.riotgames.com
mkdir -p /var/proxy/nginx/blizzard.com
chown -R www-data:www-data /var/proxy


/etc/init.d/nginx restart

