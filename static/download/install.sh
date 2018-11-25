#!/bin/bash
sudo rpm -ivh http://mirrors.ustc.edu.cn/epel/epel-release-latest-6.noarch.rpm
sudo rpm -ivh http://repo.mysql.com/mysql57-community-release-el6-7.noarch.rpm
sudo yum clean all
sudo yum makecache
rm redis-3.0.7.tar.gz
wget http://download.redis.io/releases/redis-3.0.7.tar.gz
tar xvf redis-3.0.7.tar.gz
cd redis-3.0.7.tar.gz
make && sudo make install
sudo bash utils/install_server.sh
