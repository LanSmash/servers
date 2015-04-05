sudo apt-get install squid

ln -s -f /home/weby/servers/squid3/squid.conf /etc/squid3/squid.conf
mkdir -p /var/proxy
chown -R proxy:proxy /var/proxy

