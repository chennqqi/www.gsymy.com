---
title: Visualstudio C语言包含C++头文件编译不通过
author: admin
layout: post
date: 2015-09-07T10:29:39+00:00
url: /2015/09/07/vs_error_include_cpp.html
duoshuo_thread_id:
  - 1314126401913225254
categories:
  - windows开发
  - 程序设计
tags:
  - C包含C++头文件
  - visualstudio
  - vs
  - vs2010

---
<pre class=""><code>error C2054: expected '(' to follow 'using'</code></pre>

    error C2061: syntax error : identifier 'using'
    

    c:\program files\microsoft visual studio 10.0\vc\include\cstdio(38): error C2054: expected '(' to follow 'using'
    c:\program files\microsoft visual studio 10.0\vc\include\cstdio(40): error C2061: syntax error : identifier 'using'
    c:\program files\microsoft visual studio 10.0\vc\include\cstdio(40): error C2054: expected '(' to follow 'using'
    c:\program files\microsoft visual studio 10.0\vc\include\cstdio(40): error C2061: syntax error : identifier 'using'
    c:\program files\microsoft visual studio 10.0\vc\include\cstdio(41): error C2061: syntax error : identifier 'clearerr'

     

VS 编译代码时，如果里边既包含C又包含C++，在公共头文件中有C++头文件（如stl系列<string><set>）时会报这个错误

解决办法一:

修改工程，将所有的C代码编译成C++代码

工程属性(Configuration Properties -> C/C++ -> Advanced -> Compile As C++ code)

解决办法二:

将所有的.c扩展名改为.cpp，修改代码编译通过即可

参考：

<a href="http://stackoverflow.com/questions/6086656/build-failed-with-cstdio-and-cstdlib-files-errors-in-visual-studio-2010" target="_blank">http://stackoverflow.com/questions/6086656/build-failed-with-cstdio-and-cstdlib-files-errors-in-visual-studio-2010</a>

&nbsp;