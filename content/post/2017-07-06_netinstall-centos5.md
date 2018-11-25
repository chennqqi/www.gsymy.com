+++
author = "admin"
date = "2017-07-06T22:56:21+08:00"
description = "netinstall centos5"
draft = false
keywords = ["centos5", "netinstall"]
tags = ["centos5", "netinstall"]
title = "netinstall centos5"
topics = ["linux"]
type = "post"
url = "/2017/07/06/netinstall_centos5.html"
+++

# 网络安装CentOs5

目前CentOs官方已经停止支持CentOS5了，最新的版本是5.11。 为了快速安装系统，使用了 netinstall.iso。 CentOS的安装URL与网上的教程不匹配了。 我这里简单记录一下


1. 用netinstall.iso 做boot启动系统

	![](http://img1.51cto.com/attachment/201008/162309384.jpg)
	原图无效请戳这里<http://img1.51cto.com/attachment/201008/162309384.jpg>


2. 选择HTTP方式, 并按照您的实际情况配置网络

	建议使用NAT方式和自动分配IP方式


3. 旧版教程中

	![](http://img1.51cto.com/attachment/201008/162920106.jpg)

	
	**Web Site name** 要填入 vault.centos.org  
	**CentOS directory** 要填入 5.11/os/x86_64
	
	**如果你要装的是32位请把x86_64替换为i386**




参考:
	<http://zh888.blog.51cto.com/1684752/380118>