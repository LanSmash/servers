#!/bin/bash
set -e

echo "preparing $1 input file (removing # and blank lines)"
grep -v \# "$1" | egrep -v "^$" > /tmp/whitelist.txt

#^\**\.*youtube.com IN
# matches youtube.com IN
# and *.youtube.com IN

prefix='^\**\.*'
while read -r line
do
 echo "$prefix$line IN"
done </tmp/whitelist.txt > /tmp/whitelist2.txt
#mv newfile $file

echo parsing /etc/bind/rpz.block.ls.db
grep -vif /tmp/whitelist2.txt /etc/bind/rpz.block.ls.db > /tmp/test.db


set +e

echo ...Differences:
diff /etc/bind/rpz.block.ls.db /tmp/test.db
#echo ..Changes are listed above, press enter to apply changes
#read

sudo cp /tmp/test.db /etc/bind/rpz.block.ls.db
#sudo /etc/init.d/bind reload
