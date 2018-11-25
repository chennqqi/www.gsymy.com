#!/bin/bash

#sudo yum install wget unzip

targetdir="/var/nsq"
sudo rm -f /tmp/nsq-tool.zip
wget -P /tmp http://www.gsymy.com/download/nsq-tool.zip 

if [ ! -d "$targetdir" ]; then
	sudo unzip /tmp/nsq-tool.zip -d /var
else
	echo "$targetdir already exist. remove first!"
	exit -1;
fi
  
