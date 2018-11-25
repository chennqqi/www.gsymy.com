---
title: centos安装python2.7
author: admin
layout: post
date: 2015-09-12T12:13:52+00:00
url: /2015/09/12/centos_python2-7.html
duoshuo_thread_id:
  - 1314126401913225258
categories:
  - linux开发
  - python

---
centos 系统默认带的python是2.6的，现在最新的一些程序很多要求python2.7，根据我的经验写一下整个过程

0x01. 下载python2.7.10源码

<pre class="lang:default decode:true">wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz</pre>

0x02. 解压缩&编译

<pre class="lang:default decode:true">tar xvf Python-2.7.10.tgz

cd Python-2.7.10

./configure

make

sudo make install</pre>

0x03. 修改系统默认python

<pre class="lang:default decode:true">sudo rm /usr/bin/python

sudo ln -s /usr/local/bin/python /usr/bin/python

sudo rm /usr/bin/python-config

sudo ln -s /usr/local/bin/python2.7-config /usr/bin/python-config</pre>

0x04. 恢复yum python版本

centos的yum 必须要使用python 2.6 否则可能会导致包管理不正常，修改方法：

<pre class="lang:default decode:true">sudo vim /usr/bin/yum

修改第一行内容
#!/usr/bin/python
为
#!/usr/bin/python2.6

sudo vim /usr/bin/easy_install-2.6
按照上面的方法恢复</pre>

0x05. 安装2.7的easy_install

<pre class="lang:default decode:true">wget http://peak.telecommunity.com/dist/ez_setup.py 
sudo python ez_setup.py</pre>

0x06. 安装pip(可选)

<pre class="lang:default decode:true ">到页面
https://pypi.python.org/pypi/pip#downloads
找到最新版本的pip
wget --no-check-certificate  https://pypi.python.org/packages/source/p/pip/pip-7.1.2.tar.gz#md5=3823d2343d9f3aaab21cf9c917710196 

tar xvf pip-7.1.2.tar.gz
cd pip-7.1.2
sudo python setup.py install
</pre>

&nbsp;