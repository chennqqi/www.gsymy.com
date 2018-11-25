+++
author = "admin"
date = "2018-02-25T12:13:13+08:00"
description = "curl ssl error"
draft = false
keywords = ["curl", "ssl"]
tags = ["centos", "linux", "curl"]
title = "curl: (35) SSL connect error"
topics = ["linux"]
type = "post"
url = "/2018/02/25/curl_connect_error.html"

+++

# curl: (35) SSL connect error解决办法

原因nss和libcurl版本过低导致的，解决办法升级。
centos命令

	sudo yum update nss curl -y

	