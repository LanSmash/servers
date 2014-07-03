apt-get install bind9 dnsutils
cd /etc/bind
ln -s -f /home/weby/servers/bind/* .

touch /var/log/bind.log
chown bind /var/log/bind.log

# to allow bind to rotate logs, probably a better way of doing this, like a different directory
cd /var/log
sudo chgrp bind .
sudo chmod g+w .

/etc/init.d/bind9 restart
#cd ../blacklist
echo Bind installed successfully.
echo Blacklist generation will now commence, abort if there is no blacklist required
echo press enter to continue
read novariable
mkdir -p /tmp/blacklist
cd /tmp/blacklist
~/servers/blacklist/blacklist.sh
