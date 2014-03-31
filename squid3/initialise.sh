ln -s -f /home/weby/servers/squid3/squid.conf /etc/squid3/squid.conf
mkdir -p /var/proxy/squid
chown -R proxy:proxy /var/proxy/squid

## Use DNS for steamcache
#add steamcache to point to localhost
#cp /etc/hosts /etc/hosts.backup
#grep -v "steamcache" /etc/hosts.backup > /etc/hosts
#echo "127.0.0.1 steamcache" >>/etc/hosts

