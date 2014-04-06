#!/bin/bash

e=$(which echo) 
key="$1" 

http://gdata.youtube.com/feeds/api/users/live/broadcasts/hfTgIclEGi0/states?v=2

viewers=`curl http://gdata.youtube.com/feeds/api/users/live/broadcasts/"$key"/states?v=2 | xml2  | grep status= | sed 's/.*=//'`

if [ ${viewers} == "inactive" ]; then 
${e} "Parameters CRITICAL - ${viewers} | data to display under Performance Data: of the service view" 
exit 2 
#elif [ ${viewers} -ge 100 && ${viewers} -le 1000 ]; then 
#${e} "Parameters WARNING - ${viewers} | data to display under Performance Data: of the service view" 
#exit 1 
#elif [ ${viewers} -ge 1000 ]; then 
elif [ ${viewers} == "active" ]; then
${e} "Parameters OK - ${viewers} | data to display under Performance Data: of the service view" 
exit 0 
else 
${e} "Script problem, possibly up,returned text=${viewers} | data to display under Performance Data: of the service view" 
exit 1
fi


