---
title: centos关闭cups打印服务
author: admin
layout: post
date: 2015-08-31T00:54:59+00:00
url: /2015/08/31/centos_stop_cups.html
duoshuo_thread_id:
  - 1314126401913225249
categories:
  - linux开发
  - 程序设计

---
centos/redhat 等关闭cups打印服务

linux的cups打印服务占用了631端口，大多数人用不到这个服务，建议关闭

关闭服务和自启动：

<pre class="lang:default decode:true">sudo service cups stop
sudo chkconfig --level 2345 cups off</pre>

&nbsp;