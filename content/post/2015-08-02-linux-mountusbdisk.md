---
title: linux 挂载U盘
author: admin
layout: post
date: 2015-08-02T02:59:29+00:00
url: /2015/08/02/linux-mountusbdisk.html
duoshuo_thread_id:
  - 1314126401913225220
categories:
  - linux开发
tags:
  - linux
  - u盘挂载
  - u盘权限

---
U盘插入后，用fdisk -l(需要管理员权限，否则为空) 查看U是否已经被识别

1. 如果没有识别

>          [linxux]#modprobe usb-storage

2. 识别之后

再用fdisk -l 查看usb分区名字

通常为/dev/sdb 开头的一个名字

3. 挂载<!--more-->

> [linxux]#mkdir -p /mnt/usb
> 
> [linxux]#mount -t vfat /dev/sdb6 /mnt/usb
> 
> \***常见问题，root身份挂载之后USB分区是普通用户只读的，可以在挂载时加入参数
> 
> <pre id="best-content-1722697460" class="best-text mb-10">-o umask=000</pre>

4. 卸载

> [linxux]#umount /mnt/usb

&nbsp;