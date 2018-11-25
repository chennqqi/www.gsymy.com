---
title: nginx 搭建带验证的HTTP代理
author: admin
layout: post
date: 2015-08-26T15:06:46+00:00
url: /2015/08/26/nginx_auth_proxy.html
duoshuo_thread_id:
  - 1314126401913225246
categories:
  - linux开发
  - 建站

---
核心配置代码

<pre class="">server {
     listen       8080;#监听端口
             client_body_timeout 60000;#超时
             client_max_body_size 1024m;
             send_timeout       60000;
             client_header_buffer_size 16k;
             large_client_header_buffers 4 64k;

             proxy_headers_hash_bucket_size 1024;
             proxy_headers_hash_max_size 4096;
             proxy_read_timeout 60000;
             proxy_send_timeout 60000;

     location / {
         auth_basic "Please input your password:";
         auth_basic_user_file /usr/share/nginx/htpasswd;
         resolver 8.8.8.8;
         proxy_pass http://$http_host$request_uri;
     }
 }</pre>

说明auth\_basic\_user_file指向你生成的密码文件，这个文件是由apache的htpasswd生成的。

用法如下:

<pre class="lang:sh decode:true ">htpasswd -c /usr/share/nginx/authdb liming</pre>

实际路径根据实际情况，如果没有htpasswd，可以先行安装apache。或者参考<a href="http://blog.csdn.net/stevenprime/article/details/7776713" target="_blank">http://blog.csdn.net/stevenprime/article/details/7776713</a>

他是写了一个perl脚本