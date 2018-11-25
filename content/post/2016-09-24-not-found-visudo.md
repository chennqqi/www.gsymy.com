+++
author = "admin"
date = "2016-09-24T09:14:14+08:00"
description = "没有找到visudo - not found sudo"
keywords = ["centos7", "linux", "sudo", "visudo"]
tags = ["centos", "linux"]
categories = [ "centos", "linux" ]
title = "没有找到visudo - not found sudo"
topics = ["linux"]
type = "post"
url = "/2016/09/24/notfound-sudo.html"
+++

##没有找到sudo/visudo -- not found sudo/visudo

买了一个VPS，新建了一个普通用户，想给配置个sudo权限时发现既没有visudo
也没有/etc/sudoers


错误信息:
	
	-bash: sudo: command not found
	-bash: visudo: command not found

解决办法

	yum install sudo

注：
	未在ubuntu下进行测试