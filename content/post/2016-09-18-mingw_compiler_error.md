+++

author = "admin"
date = "2016-09-18T16:30:17+08:00"
description = "使用mingw32 移植项目时遇到的一些问题"

keywords = ["windows", "mingw32", "typeof", "error", "unamed union", "c99"]
tags = ["windows", "mingw32", "mingw"]
categories = [ "windows", "mingw32" ]
title = "mingw32 编译器遇到的一些问题"
topics = ["windows"]
type = "post"
url = "/2016/09/18/mingw32_errors.html"

+++


#使用mingw32 移植项目时遇到的一些问题

**原创文章转载请注明出处！**


1. mingw32  'typeof' 
	
		typeof 是GCC扩展的特性，所以要求编译器支持GCC特性，在GCC编译选项中加入`-std=gnu99`

		-std=c99 -> -std=gnu99

2. mingw 'unamed union'

		无名联合体，例如

			struct sss{
				union{
					int a;
					char b;
				}
				double c;
			};
		gcc支持无名联合体需要开启以下选项
		
		`-fms-extensions`

		注：有些高版本的GCC编译器可能默认自带了此选项，也有可能去掉；详细可能需要自己研究gcc标准；

 
3. mingw 'for'

		sample code:
		`for (int i=0; i<10; i++) {}`
		
		以上代码在C++编译器下无任何问题，在C编译中需要C99以上特性	

		在编译选项中加入`-std=c99`	或者`-std=gnu99`

		前者兼容标准C99，后者支持gnu扩展C99

		-std=c99 / -std=gnu99

4. mingw 'GetFileSizeEx'
 
		这个函数是windows函数要求 windows>=XP(windows>=Server2003)
		通常链接是加入kernel.lib即可
		

