sudo sh -c 'echo deb http://ppa.launchpad.net/nginx/stable/ubuntu lucid main > /etc/apt/sources.list.d/nginx-stable-lucid.list'
#todo add lines to update and get keys for new ppa above
#todo - apt install nginx

mkdir -p /data/www/logs
chown -R nginx:nginx /data/www
echo 10.0.0.53	lancache-steam >> /etc/hosts
echo 10.0.0.54  lancache-riot >> /etc/hosts
echo 10.0.0.55  lancache-blizzard >> /etc/hosts
echo 10.0.0.56  lancache-hirez >> /etc/hosts
echo 10.0.0.57  lancache-origin >> /etc/hosts
echo 10.0.0.58  lancache-sony >> /etc/hosts
echo 10.0.0.59  lancache-origin >> /etc/hosts
cd /etc/nginx && ln -s -f /home/weby/servers/nginx/* .
useradd nginx

