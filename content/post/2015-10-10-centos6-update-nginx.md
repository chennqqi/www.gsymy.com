---
title: centos6 升级nginx
author: admin
layout: post
date: 2015-10-10T05:35:53+00:00
url: /2015/10/10/centos6-update-nginx.html
duoshuo_thread_id:
  - 6205109900172247809
categories:
  - 建站

---
centos6 默认源的nginx版本很低，网上给出的大部分方法下载源码编译安装；

这种方法比较麻烦，其实最简单的方法是使用nginx官网的源进行安装；

  1. 进入 /etc/yum.repos.d/ 目录下生成nginx的源配置

<pre class="EnlighterJSRAW" data-enlighter-language="null">cd /etc/yum.repos.d/
</pre>

用vi/vim/cat 工具生成nginx.repo填入以下内容

<pre class="EnlighterJSRAW" style="padding-left: 60px;">[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
</pre>

<pre class="lang:default decode:true ">安装 yum install -y nginx 更新 yum update nginx</pre>

参考:<a href="http://my.oschina.net/VincentJiang/blog/224993" target="_blank">http://my.oschina.net/VincentJiang/blog/224993</a>

<a href="https://www.nginx.com/resources/wiki/start/topics/tutorials/install/" target="_blank">https://www.nginx.com/resources/wiki/start/topics/tutorials/install/</a>