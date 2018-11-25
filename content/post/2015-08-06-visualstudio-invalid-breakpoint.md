---
title: VisualStudio 断点不生效分析
author: admin
layout: post
date: 2015-08-06T08:08:18+00:00
url: /2015/08/06/visualstudio-invalid-breakpoint.html
duoshuo_thread_id:
  - 1314126401913225218
categories:
  - windows开发
tags:
  - vistualstudio

---
问题分析:

调试程序需要程序携带了调试信息。

widnows下调试信息为pdb文件。

无法调试或者断点不生效就是以下原因

<!--more-->

  1. 没有生成调试所需的pdb文件
  2. 调试文件路径不正确无法载入
  3. 调试文件生成的与源文件不匹配

解决办法：

1. 检查你的VS工程是否生成了调试信息

工程属性->Linker->Debugging->Generate Debug Info (Yes/Debug)

2. 检查你的VS工程生成的Debug文件名

工程属性->Linker->Debugging->Generate Program DataBase File

  1.  如果以上方法都正确，仍然无法断住；尝试在main函数入口加入Debugbreak();强行设置断点，运行，在Module窗口中查看你的pdb文件是否被加载，如果没有被加载则手动加载。

4. 如果加载时出现

# [PDB does not match image Error][1]{.question-hyperlink}

参考这里:

<a href="http://stackoverflow.com/questions/7749558/pdb-does-not-match-image-error" target="_blank">http://stackoverflow.com/questions/7749558/pdb-does-not-match-image-error</a>

windows程序关联pdb文件，依赖于pdb文件的GUID和行匹配。

吐槽一下现在网上大多数的解决方案，都是去掉“要求与原始文件完全匹配”。太坑爹了，这中做法就像是鸵鸟遇到危险时的处理办法。

 [1]: http://stackoverflow.com/questions/7749558/pdb-does-not-match-image-error