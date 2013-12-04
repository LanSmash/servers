apt-get install bind9 dnsutils
cd /etc/bind
ln -s -f /home/weby/servers/bind/* .
/etc/init.d/bind9 restart
