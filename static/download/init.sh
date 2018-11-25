#!/bin/bash
sudo yum install -y wget
wget http://mirrors.ustc.edu.cn/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -ivh epel-release*
sudo yum install -y vim lrzsz mlocate
wget http://www.gsymy.com/my/vimrc
cat vimrc>> ~/.vimrc
wget http://www.gsymy.com/my/bashrc
cat bashrc>> ~/.bashrc
#sudo yum install -y php-fpm php
sudo yum groupinstall "Development Tools"









