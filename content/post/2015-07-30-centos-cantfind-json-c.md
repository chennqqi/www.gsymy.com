---
title: centos 无法找到json-c
author: admin
layout: post
date: 2015-07-30T15:46:20+00:00
url: /2015/07/30/centos-cantfind-json-c.html
duoshuo_thread_id:
  - 1314126401913225222
categories:
  - linux开发
tags:
  - centos
  - json-c
  - linux

---
## 错误信息:

<div>
  <strong>package &#8216;json-c&#8217; not found</strong>
</div>

<div>
  <p>
    <strong>Did not find libjson</strong>
  </p>
  
  <div>
  </div>
  
  <h2>
    解决方案：
  </h2>
</div>

<!--more-->

### 1. 确保你已经安装了json组件

> <div>
>   <p>
>     sudo yum install -y json-c json-c-devel
>   </p>
>   
>   <div>
>
>   </div>
>   
>   <h3>
>     2. 建立符号链接
>   </h3>
> </div>
> 
> <div>
>   sudo ln -s /lib64/pkgconfig/json-c.pc /usr/lib64/pkgconfig/json-c.pc<br /> sudo ln -s /lib64/pkgconfig/json.pc /usr/lib64/pkgconfig/json.pc
> </div>

## 原因分析：

可能是64位环境，pc文件放错位置了