---
title: 使用nginx搭建https服务器
author: admin
layout: post
date: 2016-01-10T10:33:53+00:00
url: /2016/01/10/using_https_in_nginx.html
duoshuo_thread_id:
  - 6238105473933902593
categories:
  - 建站

---
<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">最近在研究</span><span style="font-family: Verdana;">nginx</span><span style="font-family: 微软雅黑;">，整好遇到一个需求就是希望服务器与客户端之间传输内容是加密的，防止中间监听泄露信息，但是去证书服务商那边申请证书又不合算，因为访问服务器的都是内部人士，所以自己给自己颁发证书，忽略掉浏览器的不信任警报即可。下面是颁发证书和配置过程。</span><br /> </span>

<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">首先确保机器上安装了</span><span style="font-family: Verdana;">openssl</span><span style="font-family: 微软雅黑;">和</span><span style="font-family: Verdana;">openssl-devel</span><br /> </span>

<pre class="lang:default decode:true ">#yum install openssl
#yum install openssl-devel</pre>

&nbsp;

<span style="color: black; font-family: 微软雅黑; font-size: 10pt;">然后就是自己颁发证书给自己<br /> </span>

<pre class="lang:default decode:true">#cd /usr/local/nginx/conf
#openssl genrsa -des3 -out server.key 1024
#openssl req -new -key server.key -out server.csr
#openssl rsa -in server.key -out server_nopwd.key
#openssl x509 -req -days 365 -in server.csr -signkey server_nopwd.key -out server.crt</pre>

<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">至此证书已经生成完毕，下面就是配置</span><span style="font-family: Verdana;">nginx</span><br /> </span>

<pre class="lang:default decode:true ">server {
listen 443;
ssl on;
ssl_certificate /usr/local/nginx/conf/server.crt;
ssl_certificate_key /usr/local/nginx/conf/server_nopwd.key;
}</pre>

&nbsp;

<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">然后重启</span><span style="font-family: Verdana;">nginx</span><span style="font-family: 微软雅黑;">即可。</span><br /> </span>

<span style="color: black; font-size: 10pt;"><span style="font-family: Verdana;">ps</span><span style="font-family: 微软雅黑;">： 如果出现&#8221;</span><span style="font-family: Verdana;">[emerg] 10464#0: unknown directive &#8220;ssl&#8221; in /usr/local/nginx-0.6.32/conf/nginx.conf:74</span><span style="font-family: 微软雅黑;">&#8220;则说明没有将</span><span style="font-family: Verdana;">ssl</span><span style="font-family: 微软雅黑;">模块编译进</span><span style="font-family: Verdana;">nginx</span><span style="font-family: 微软雅黑;">，在</span><span style="font-family: Verdana;">configure</span><span style="font-family: 微软雅黑;">的时候加上&#8221;</span><span style="font-family: Verdana;">&#8211;with-http_ssl_module</span><span style="font-family: 微软雅黑;">&#8220;即可</span><span style="font-family: Verdana;">^^</span><br /> </span>

<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">至此已经完成了</span><span style="font-family: Verdana;">https</span><span style="font-family: 微软雅黑;">服务器搭建，但如何让浏览器信任自己颁发的证书呢？</span><br /> </span>

<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">今天终于研究捣鼓出来了，只要将之前生成的</span><span style="font-family: Verdana;">server.crt</span><span style="font-family: 微软雅黑;">文件导入到系统的证书管理器就行了，具体方法：</span><br /> </span>

<span style="color: black; font-size: 10pt;"><span style="font-family: 微软雅黑;">控制面板</span><span style="font-family: Verdana;"> -> Internet</span><span style="font-family: 微软雅黑;">选项</span><span style="font-family: Verdana;"> -> </span><span style="font-family: 微软雅黑;">内容</span><span style="font-family: Verdana;"> -> </span><span style="font-family: 微软雅黑;">发行者 </span><span style="font-family: Verdana;">-> </span><span style="font-family: 微软雅黑;">受信任的根证书颁发机构</span><span style="font-family: Verdana;"> -> </span><span style="font-family: 微软雅黑;">导入</span><span style="font-family: Verdana;"> &#8211;</span><span style="font-family: 微软雅黑;">》选择</span><span style="font-family: Verdana;">server.crt</span><br /> </span>

<span style="color: #595959; font-size: 9pt;">来自 <<a href="https://www.cnblogs.com/tintin1926/archive/2012/07/12/2587311.html">https://www.cnblogs.com/tintin1926/archive/2012/07/12/2587311.html</a>><br /> </span>