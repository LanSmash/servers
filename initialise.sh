sudo apt-get install git-core
git config --global user.name "Webberist"
git config --global user.email me@webberist.com

#app armor breaks bind due to symlinks to home directory
sudo /etc/init.d/apparmor stop && sudo update-rc.d -f apparmor remove

#use github with ssh
[ ! -f ~/.ssh/id_rsa ] && ssh-keygen -t rsa -C "server@webberist.com"
echo "#############################################"
cat ~/.ssh/id_rsa.pub
echo "#############################################"
echo copy paste this key into github:
echo https://github.com/settings/ssh
echo press enter to continue
read novariable
git clone git@github.com:webberist/servers.git ~/servers

#use github with https
#git clone https://github.com/webberist/servers.git servers

echo "###################"
echo "Reboot is recommended to ensure apparmor is unloaded"
echo "If bind named cannot start it is due to apparmor and the config paths"
echo "###################"
