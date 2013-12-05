apt-get install bind9 dnsutils
cd /etc/bind
ln -s -f /home/weby/servers/bind/* .
touch /etc/bind/named.conf.blocklist
/etc/init.d/bind9 restart
#cd ../blacklist
mkdir -p /tmp/blacklist
cd /tmp/blacklist
~/servers/blacklist/blacklist.sh
cp named.conf.blocklist /etc/bind

echo reloading bind, this takes a few minutes
rndc reload
