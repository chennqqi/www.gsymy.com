---
title: 非root用户使用tcpdump
author: admin
layout: post
date: 2015-08-23T15:10:26+00:00
url: /2015/08/23/tcpdumpnoroot.html
duoshuo_thread_id:
  - 1314126401913225242
categories:
  - linux开发
tags:
  - centos
  - linux
  - tcpdump

---
  1.  centos/redhat下安装tcpdump <pre class="lang:default decode:true">sudo yum install -y tcpdump</pre>

  2.  在tcpdump所在目录下执行 <pre class="lang:sh decode:true">sudo chmod u+s tcpdump</pre>
    
    &nbsp;</li> </ol> 
    
    原理参考： _[tcpdump 安装和文件的s权限 &#8211; arkblue的专栏 &#8211; 博客频道 &#8211; CSDN.NET][1]_

 [1]: http://blog.csdn.net/arkblue/article/details/7704304