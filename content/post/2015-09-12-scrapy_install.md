---
title: 安装scrapy
author: admin
layout: post
date: 2015-09-12T13:07:56+00:00
url: /2015/09/12/scrapy_install.html
duoshuo_thread_id:
  - 1314126401913225259
categories:
  - linux开发
  - python
  - scrapy
tags:
  - install scrapy
  - python
  - scrapy

---
<div class="para">
  Scrapy，Python开发的一个快速,高层次的屏幕抓取和web抓取框架，用于抓取web站点并从页面中提取结构化的数据。Scrapy用途广泛，可以用于数据挖掘、监测和<a href="http://baike.baidu.com/view/1303916.htm" target="_blank">自动化测试</a>。
</div>

<div class="para">
  Scrapy吸引人的地方在于它是一个框架，任何人都可以根据需求方便的修改。它也提供了多种类型爬虫的基类，如BaseSpider、sitemap爬虫等，最新版本又提供了web2.0爬虫的支持。
</div>

<div class="para">
  Scrach，是抓取的意思，这个Python的爬虫框架叫Scrapy，大概也是这个意思吧，就叫它：小刮刮吧。[from<a href="http://baike.baidu.com/link?url=yii3mkb4Eg2hvwk4B20GgoikhScodSEBN1gP3vJMh1uxI8Ipzi9d5iopQNUsIjFib4pMglkbmEf6e23D9MR-lq" target="_blank">百度百科</a>]
</div>

&nbsp;

0x00. 准备环境

linux环境请首先升级python版本到python2.7.10

<a href="http://www.gsymy.com/2015/09/12/centos_python2-7.html" target="_blank">参考链接</a>

http://www.gsymy.com/2015/09/12/centos_python2-7.html

0x01. 开始安装

&nbsp;

<pre class="lang:default decode:true">sudo yum install libffi-devel -y
pip install Scrapy</pre>

0x02. 现在来解决第一个坑

<!--more-->

如果你没有遇到这个坑请跳过这一条

安装过程中下载lxml报错

手动安装之，在错误信息中找到下载链接

<pre class="lang:default decode:true">wget --no-check-certificate  https://pypi.python.org/packages/source/l/lxml/lxml-3.4.4.tar.gz

md5checksum
sudo pip install lxml-3.4.4.tar.gz</pre>

似乎可能是网速太慢导致下载超时了，也可能是官网给的MD5没更新

<a href="http://stackoverflow.com/questions/16025788/why-does-pip-fail-with-bad-md5-hash-for-package" target="_blank">参考来源</a>：

http://stackoverflow.com/questions/16025788/why-does-pip-fail-with-bad-md5-hash-for-package

安装完成之后继续pip install scrapy

如果遇到类似问题，请如法炮制

0x03.  安装

libffi-devel

为了加速你的安装过程0x01 步骤中给你写了！

<pre class="lang:default decode:true">sudo yum install libffi-devel -y</pre>