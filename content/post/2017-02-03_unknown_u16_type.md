+++
author = "admin"
date = "2017-02-03T10:01:17+08:00"
description = "unknown type error"
keywords = ["gcc", "u16"]
tags = ["linux", "gcc"]
title = "unknown_u16_type"
topics = ["linux"]
type = "post"
url = "/2017/02/03/unknown_u16_type.html"

+++


issue:
	
	gcc build error

	error: unknown type name ‘u16’

solution:

	install kernel-headers

	sudo yum install kernel-headers -y 

referer:
	<https://bugzilla.redhat.com/show_bug.cgi?format=multiple&id=689756>