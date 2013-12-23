sudo apt-get install git-core
git config --global user.name "Webberist"
git config --global user.email me@webberist.com

#use github with ssh
ssh-keygen -t rsa -C "server@webberist.com"
cat ~/.ssh/id_rsa.pub
echo copy paste this key into github:
echo https://github.com/settings/ssh
echo press enter to continue
read
git clone webberist@github.com:webberist/servers.git ~/servers

#use github with https
#git clone https://github.com/webberist/servers.git servers


