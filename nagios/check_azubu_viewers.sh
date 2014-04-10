#!/bin/bash

e=$(which echo) 
channel="$@" 

viewers=`curl "http://www.azubu.tv/stat/audience.do?cn_name=$channel" | xml2  | grep -m 1 metric= | sed 's/.*=//'`
#echo $viewers

#if [ "$a" -lt "$b" ]
if [ "$viewers" -le 10 ]; then 
${e} "Parameters CRITICAL - "$viewers" on channel "$channel""
exit 2 
elif [ "$viewers" -ge 10 ] && [ "$viewers" -le 100 ]; then 
${e} "Parameters WARNING - "$viewers" on channel "$channel""
exit 1 
elif [ "$viewers" -ge 100 ]; then 
${e} "Parameters OK - "$viewers" on channel "$channel"" 
exit 0 
else 
${e} "Script problem, no viewers? count="$viewers" | data to display under Performance Data: of the service view" 
exit 2
fi


