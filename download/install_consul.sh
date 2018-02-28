#!/bin/bash

#sudo yum install wget unzip

targetdir="/var/consul"
sudo rm -f /tmp/consul.zip
wget -P /tmp http://d.ipaddr.site/consul_1.0.6_linux_amd64.zip 
sudo mkdir -p /var/consul
sudo chown sre:sre -R /var/consul

if [ ! -d "$targetdir" ]; then
	sudo unzip /tmp/consul.zip -d /var
else
	echo "$targetdir already exist. remove first!"
	exit -1;
fi
  
