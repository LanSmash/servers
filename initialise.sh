sudo apt-get install git-core
git config --global user.name "Webberist"
git config --global user.email me@webberist.com

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


