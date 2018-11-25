+++
author = "admin"
date = "2016-10-08T13:56:17+08:00"
description = "linux mount NTFS"
keywords = ["linux", "mount", "ntfs"]
tags = ["linux", "centos"]
title = "mount NTFS on linux"
url = "/2016/10/08/linux-mount-ntfs.html"
topics = ["linux"]
type = "post"
+++


#how to mount a ntfs partition/drive on linux

1. linux may not integrate ntfs driver, so you need install ntfs-3g  
	`ntfs-3g` is an opensource ntfs driver for linux  


		#yum install ntfs-3g

2. detect your ntfs partition name

	`parted` is an gnu partition tool that can analize disk like `fdisk` which
	support `GPT`  


		#parted  
			>print all

	
	
	find you ntfs partition name. eg. /dev/sdb1


3. mount 

		#mkdir /mnt/ntfs
		#mount -t ntfs-3g /dev/sdb1 /mnt/ntfs
	
	now you can vist `/mnt/ntfs`

others:

		1. all operation need root privilege.
		2. if you want regular user vist the mounted ntfs partition. you need mount like this:
			
			mount -o umask=000 -t ntfs-3g /dev/sdb1 /mnt/ntfs1
