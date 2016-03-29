apt-get install software-properties-common python-software-properties -y
apt-add-repository ppa:nginx/stable -y
apt-get update
apt-get install nginx -y
apt-get install bind9 -y

#todo add lines to update and get keys for new ppa above
#todo - apt install nginx

mkdir -p /data/www/logs
mkdir -p /data/www/cache
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

service nginx restart
ln /data/www/logs/* /var/log/nginx/
