#!/bin/bash

#sudo yum install wget unzip

targetdir="/var/filebeat"
sudo rm -f "/tmp/filebeat-6.0.1-linux-x86_64.tar.gz"
sudo rm -f "/tmp/filebeat.nsq.zip"
wget -P /tmp https://github.com/chennqqi/filebeat.nsq.output/releases/download/1.0/filebeat-6.0.1-linux-x86_64.tar.gz
wget -P /tmp https://github.com/chennqqi/filebeat.nsq.output/releases/download/1.0/filebeat.nsq.zip

if [ ! -d "$targetdir" ]; then
	sudo tar xvf /tmp/filebeat-6.0.1-linux-x86_64.tar.gz -C /var
	sudo mv /var/filebeat-6.0.1-linux-x86_64 /var/filebeat
	sudo unzip /tmp/filebeat.nsq.zip -d /var/filebeat
else
	echo "$targetdir already exist. remove first!"
	exit -1;
fi
  
