---
title: scrapycmdline
author: admin
layout: post
date: 2015-09-04T06:42:20+00:00
url: /2015/09/04/scrapycmdline.html
duoshuo_thread_id:
  - 1314126401913225252
categories:
  - scrapy

---
scrapy没有找到包

<pre class="lang:default decode:true ">Traceback (most recent call last):
  File "/usr/local/bin/scrapy", line 7, in &lt;module&gt;
    from scrapy.cmdline import execute
ImportError: No module named scrapy.cmdline
</pre>

  1. 如果没有正确安装scrapy，请重新安装scrapy
  2. 如果正确安装了scrapy,那么就可能是你系统上有多个python 
      1. 如果是windows，使用正确的环境变量
      2. 如果是linux，多半是因为有多个python导致的。 
          1. 修改yum里的python