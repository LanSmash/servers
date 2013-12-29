apt-get install bind9 dnsutils
cd /etc/bind
ln -s -f /home/weby/servers/bind/* .

touch /var/log/bind.log
chown bind /var/log/bind.log

/etc/init.d/bind9 restart
#cd ../blacklist
echo Bind installed successfully.
echo Blacklist generation will now commence, abort if there is no blacklist required
echo press enter to continue
read novariable
mkdir -p /tmp/blacklist
cd /tmp/blacklist
~/servers/blacklist/blacklist.sh
