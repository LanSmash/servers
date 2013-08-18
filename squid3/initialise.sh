ln -s -f /home/weby/servers/squid3/squid.conf /etc/squid3/squid.conf
mkdir -p /var/proxy/squid
chown -R proxy:proxy /var/proxy/squid

#add steamproxypeer to point to localhost
cp /etc/hosts /etc/hosts.backup
grep -v "steamproxypeer" /etc/hosts.backup > /etc/hosts
echo "127.0.0.1 steamproxypeer" >>/etc/hosts

