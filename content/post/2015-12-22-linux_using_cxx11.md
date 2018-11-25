---
title: Linux使用C++11
author: admin
layout: post
date: 2015-12-22T09:30:10+00:00
url: /2015/12/22/linux_using_cxx11.html
duoshuo_thread_id:
  - 6231037441327760130
categories:
  - devops
  - linux开发

---
<a href="http://www.gsymy.com/wp-content/uploads/2015/12/centos.jpg" rel="attachment wp-att-530"><img class="alignnone size-full wp-image-530" src="http://www.gsymy.com/wp-content/uploads/2015/12/centos.jpg" alt="centos" width="486" height="307" /></a>

CentOS<span style="font-family: 微软雅黑;">中默认使用的</span>GCC<span style="font-family: 微软雅黑;">是</span>4.4<span style="font-family: 微软雅黑;">的，所以不支持</span>C++11

gcc<span style="font-family: 微软雅黑;">选项</span> -std=c++11 <span style="font-family: 微软雅黑;">需要</span>GCC<span style="font-family: 微软雅黑;">4.7以上的版本</span>

<span style="font-family: 微软雅黑;">这里提供一个简单简单的方法<br /> </span>

Centos<span style="font-family: 微软雅黑;">使用</span>

<pre class="lang:default decode:true">cd /etc/yum.repos.d

sudo wget http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo

sudo yum --enablerepo=testing-1.1-devtools-6 install 
devtoolset-1.1-gcc devtoolset-1.1-binutils devtoolset-1.1-gcc-c++</pre>

<span style="font-family: 微软雅黑;">安装后</span>gcc<span style="font-family: 微软雅黑;">版本是</span>4.7.2

<span style="font-family: 微软雅黑;">你也可以激进一点安装更高版本的<br /> </span>

<pre class="lang:default decode:true ">sudo wget http://people.centos.org/tru/devtools-2/devtools-2.repo

sudo yum install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++</pre>

<span style="font-family: 微软雅黑;">安装之后</span>gcc<span style="font-family: 微软雅黑;">版本是</span>4.8.2

<span style="font-family: 微软雅黑;">切换</span>4.7.2

<pre class="lang:default decode:true ">scl enable devtoolset-1.1 bash</pre>

<span style="font-family: 微软雅黑;">切换</span>4.8.2

<pre class="lang:default decode:true">scl enable devtoolset-2 bash</pre>

<span style="font-family: 微软雅黑;">参考资料：<br /> </span>

<http://braaten-family.org/ed/blog/2014-05-28-devtools-for-centos/>

<http://preilly.me/2013/05/28/redhat-developer-toolset-1-1/>

ubuntu<span style="font-family: 微软雅黑;">使用</span>

<span style="font-family: 微软雅黑;">参考这里</span>:

<https://stackoverflow.com/questions/7832892/how-to-change-the-default-gcc-compiler-in-ubuntu>