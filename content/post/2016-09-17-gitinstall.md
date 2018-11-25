+++
author = "admin"
date = "2016-09-17T22:28:22+08:00"
description = "linux 安装最新版本的git"

keywords = ["linux", "git"]
tags = ["git", "linux"]
categories = [ "git", "linux" ]
title = "linux 安装最新版本的git"
topics = ["linux"]
type = "post"
url = "/2016/09/17/install_git.html"

+++


#linux 安装最新版本的git

1. 下载源代码

		https://www.kernel.org/pub/software/scm/git/

	最新版本为2.10.0

		wget https://www.kernel.org/pub/software/scm/git/git-2.10.0.tar.gz

2. 安装依赖环境(以CentOS为例)

		sudo yum install -y openssl-devel libpcre-devel perl-ExtUtils-Embed libcurl-devel

3. 配置安装

		tar xvf git-2.10.0.tar.gz
		cd git-2.10.0
		./configure --with-openssl --with-libpcre --with-expat --with-curl
		make
		sudo make install
	
	说明：  
		`--with-openssl --with-libpcre --with-expat --with-curl`选项开启支持https  
		如果不安装`perl-ExtUtils-Embed`可能导致编译失败 

	
	
	




