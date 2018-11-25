---
title: linux 无法找到gengetopt
author: admin
layout: post
date: 2015-07-30T15:43:42+00:00
url: /2015/07/30/linux_not_found_gengetopt.html
duoshuo_thread_id:
  - 1314126401913225224
categories:
  - linux开发
tags:
  - centos
  - gengetopt
  - linux

---
## **系统没有安装gengetopt**

<div>
</div>

<div>
  去gnu下载gengetopt，推荐使用华中科技大学镜像
</div>

<div>
  <a href="http://mirror.hust.edu.cn/gnu/gengetopt/" target="_blank">http://mirror.hust.edu.cn/gnu/gengetopt/</a>
</div>

<div>
</div>

<div>
</div>

<!--more-->

<div>
  选择合适的版本
</div>

<div>
  wget <a href="http://mirror.hust.edu.cn/gnu/gengetopt/gengetopt-2.22.tar.g" target="_blank">http://mirror.hust.edu.cn/gnu/gengetopt/gengetopt-2.22.tar.g</a>z
</div>

<div>
  下载编译安装
</div>

> <div>
>
> </div>
> 
> <div>
>   tar xvf gengetopt-2.22.tar.gz
> </div>
> 
> <div>
>   cd gengetopt-2.22
> </div>
> 
> <div>
>   ./configure
> </div>
> 
> <div>
>   make
> </div>
> 
> <div>
>   sudo make install
> </div>

<div>
  补充说明：
</div>

<div>
  如果在编译过程中出现
</div>

<div>
  <strong>fileutils.cpp: In function ‘char* create_filename(char*, char*)’:</strong><br /> <strong>fileutils.cpp:23: 错误：‘strlen’在此作用域中尚未声明</strong></p> 
  
  <div>
  </div>
  
  <div>
    修改src/fileutils.cpp 源文件添加头文件
  </div>
  
  <div>
    #include <string.h>
  </div>
  
  <div>
    继续编译安装即可
  </div>
</div>