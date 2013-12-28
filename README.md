servers
=======
```
sudo apt-get update && sudo apt-get install vim open-vm-tools openssh-server
wget https://raw.github.com/webberist/servers/master/initialise.sh && sh ./initialise.sh
```
usage
=====
```
git add filename
git commit -m "updated filename for a good reason"
git push origin master
```

IP Address
==========
```
iface eth0 inet static
        address 10.0.0.2
        netmask 255.255.254.0
        gateway 10.0.0.1
        dns-search ls
        dns-nameservers 10.0.0.2

#auto eth0:0
#iface eth0:0 inet static
        #address 192.168.0.2
        #netmask 255.255.255.0
        #gateway 192.168.0.1
```
