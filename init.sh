#!/bin/bash
#Installation script for salt-minions. 
#Designed for Ubuntu Xenial but should work for other distros too.
apt update && apt -y upgrade
echo $'Enter IP address of salt master:\n'
read SaltIP
#Edit hosts file.
echo ''$SaltIP ' salt' >> /etc/hosts
#Needed for debian to be able to download docker properly.
sudo apt-get -y install salt-minion
sudo apt-get -y install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
sudo pip install docker
sudo pip install docker-py
#Install some OpenRCT2 dependancies
sudo apt-get install --no-install-recommends -y cmake libsdl2-dev \
    gcc pkg-config libjansson-dev libspeex-dev libspeexdsp-dev libcurl4-openssl-dev \
    libcrypto++-dev libfontconfig1-dev libfreetype6-dev libpng-dev libssl-dev libzip-dev
sudo add-apt-repository ppa:openrct2/master
sudo apt-get update
########################
echo $'Enter minion name:\n'
read minionname
echo "id: "$minionname >> /etc/salt/minion
sudo systemctl restart salt-minion
echo 'Done, remember to accept the key of this minion on your salt master.\n'