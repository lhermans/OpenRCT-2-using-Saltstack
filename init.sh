#!/bin/bash
#Installation script for salt-minions. 
#Designed for Ubuntu Xenial and Debian Stretch but should work for other distros too.
apt update && apt -y upgrade
echo $'Enter IP address of salt master:\n'
read SaltIP
#Edit hosts file.
echo ''$SaltIP ' salt' >> /etc/hosts
#Needed for debian to be able to download docker properly.
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

sudo apt-get -y install salt-minion
sudo apt-get -y install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
sudo pip install docker
sudo pip install docker-py
echo $'Enter minion name:\n'
read minionname
echo "id: "$minionname >> /etc/salt/minion
sudo systemctl restart salt-minion
echo $'Done, remember to accept the key of this minion on your salt master.\n'