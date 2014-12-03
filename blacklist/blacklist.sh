#!/bin/bash

#find directory this script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# put temporary files in /tmp/blacklist
mkdir -p /tmp/blacklist
cd /tmp/blacklist

# download latest list if it is newer
wget http://www.shallalist.de/Downloads/shallalist.tar.gz -N

#untar it to the current directory, expects subdir in tar.gz to be BL
tar xzvf shallalist.tar.gz

#regenerate blocklist.txt
rm -f blocklist.txt
cat "./BL/adv/domains" >> blocklist.txt
cat "./BL/aggressive/domains" >> blocklist.txt
#cat "./BL/alcohol/domains" >> blocklist.txt
cat "./BL/anonvpn/domains" >> blocklist.txt
#cat "./BL/chat/domains" >> blocklist.txt
cat "./BL/costtraps/domains" >> blocklist.txt
#cat "./BL/dating/domains" >> blocklist.txt
#added downloads back in to block bittorrent... hopefully games can still update
cat "./BL/downloads/domains" >> blocklist.txt
cat "./BL/drugs/domains" >> blocklist.txt
#cat "./BL/dynamic/domains" >> blocklist.txt
cat "./BL/fortunetelling/domains" >> blocklist.txt
#cat "./BL/forum/domains" >> blocklist.txt
cat "./BL/gamble/domains" >> blocklist.txt
#cat "./BL/government/domains" >> blocklist.txt
cat "./BL/hacking/domains" >> blocklist.txt
#cat "./BL/homestyle/domains" >> blocklist.txt
#cat "./BL/hospitals/domains" >> blocklist.txt
#cat "./BL/imagehosting/domains" >> blocklist.txt
#cat "./BL/isp/domains" >> blocklist.txt
#cat "./BL/jobsearch/domains" >> blocklist.txt
#cat "./BL/library/domains" >> blocklist.txt
#cat "./BL/military/domains" >> blocklist.txt
#cat "./BL/models/domains" >> blocklist.txt
cat "./BL/movies/domains" >> blocklist.txt
cat "./BL/music/domains" >> blocklist.txt
#cat "./BL/news/domains" >> blocklist.txt
cat "./BL/podcasts/domains" >> blocklist.txt
#cat "./BL/politics/domains" >> blocklist.txt
cat "./BL/porn/domains" >> blocklist.txt
cat "./BL/radiotv/domains" >> blocklist.txt
cat "./BL/redirector/domains" >> blocklist.txt
#cat "./BL/religion/domains" >> blocklist.txt
#cat "./BL/remotecontrol/domains" >> blocklist.txt
#cat "./BL/ringtones/domains" >> blocklist.txt
#cat "./BL/searchengines/domains" >> blocklist.txt
#cat "./BL/shopping/domains" >> blocklist.txt
#cat "./BL/socialnet/domains" >> blocklist.txt
cat "./BL/spyware/domains" >> blocklist.txt
cat "./BL/tracker/domains" >> blocklist.txt
#cat "./BL/updatesites/domains" >> blocklist.txt
#cat "./BL/urlshortener/domains" >> blocklist.txt
#cat "./BL/violence/domains" >> blocklist.txt
cat "./BL/warez/domains" >> blocklist.txt
#cat "./BL/weapons/domains" >> blocklist.txt
#cat "./BL/webmail/domains" >> blocklist.txt
#cat "./BL/webphone/domains" >> blocklist.txt  #needed for skype chat
cat "./BL/webradio/domains" >> blocklist.txt
cat "./BL/webtv/domains" >> blocklist.txt

#convert the raw blocklist.txt list of domains to a rpz format
$DIR/convert2bindrpz.pl blocklist.txt > rpz.block.ls.db

echo rpz.block.ls.db created in /tmp/blocklist.
echo updating /etc/bind

sudo cp rpz.block.ls.db /etc/bind

echo "rpz.block.ls.db updated in /etc/bind"

echo applying whitelist.txt
$DIR/unblock.sh $DIR/whitelist.txt

echo reloading bind, this takes a few minutes
sudo rndc reload

