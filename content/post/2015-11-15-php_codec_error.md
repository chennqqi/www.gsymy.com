---
title: PHP字符集错误
author: admin
layout: post
date: 2015-11-15T06:46:03+00:00
url: /2015/11/15/php_codec_error.html
duoshuo_thread_id:
  - 6217265656937579266
categories:
  - devops
  - PHP
tags:
  - devops
  - mbstring
  - PHP
  - PHP编码
  - 编码错误

---
安装最新版本的phpymyadmin无法打开网站，查看日志显示如下：

<pre class="lang:default decode:true ">PHP message: PHP Fatal error:  Call to undefined function mb_detect_encoding()</pre>

原因排查，没有安装php的mbstring扩展

解决办法:

linux.

<pre class="lang:default decode:true">sudo yum install -y php-mbstring
</pre>

&nbsp;

<pre class="lang:default decode:true ">用locate查找一下你的mbstring.so路径

加入扩展

sudo vim /etc/php.ini

加入一行

extension=mbstring.so路径

重启php前端(php-fpm等)

php-fpm

sudo service php-fpm restart</pre>

windows.

同理

下载mbstring.dll

session

<img class="alignnone" src="http://i3.tietuku.com/03c934852d26233a.png" alt="" width="1426" height="106" />

http://www.phperz.com/article/14/1222/42451.html

&nbsp;

&nbsp;

&nbsp;

&nbsp;