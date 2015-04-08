
ln -s -f /home/weby/servers/squid3/if-post-down.d/iptables /etc/network/if-post-down.d/
ln -s -f /home/weby/servers/squid3/if-pre-up.d/iptables /etc/network/if-pre-up.d/
ln -s -f /home/weby/servers/squid3/iptables.rules /etc/

sh -c "echo iptable_mangle >> /etc/modules"
modprobe iptable_mangle
./if-pre-up.d/iptables

apt-get install squid

ln -s -f /home/weby/servers/squid3/squid.conf /etc/squid3/squid.conf
mkdir -p /var/proxy
chown -R proxy:proxy /var/proxy

