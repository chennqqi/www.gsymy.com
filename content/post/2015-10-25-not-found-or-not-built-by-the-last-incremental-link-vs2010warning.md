---
title: not found or not built by the last incremental link VS2010编译警告
author: admin
layout: post
date: 2015-10-25T11:54:56+00:00
url: /2015/10/25/not-found-or-not-built-by-the-last-incremental-link-vs2010warning.html
duoshuo_thread_id:
  - 6209552781848412929
categories:
  - windows开发
tags:
  - visualstudio
  - vs2010
  - warning

---
<span style="color: black; font-size: 10pt;">not found or not built by the last incremental link; performing full link<br /> </span>

<span style="color: gray; font-size: 9pt;">2015年10月25日<br /> </span>

<span style="color: gray; font-size: 9pt;">19:53<br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">VS的一个编译警告，不算错误。原因和解决办法如下：</span><span style="font-size: 12pt;"><br /> </span></span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">用visualstudio创建一个Win32 Console Application，编译后生成两个Debug目录，一个在项目所属的Solution下，这个Debug中会生成.exe等类型程序结果文件。另外 的一个在Project的目录中，这个Debug中包含pdb等文件，但是没有生成.exe等程序结果文件。</span><br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">Condition：</span><br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">当再次重新编译项目时，出现如题的问题。</span><br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">Cause:</span><br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">引起这个错误的根源在于Microsoft的VS的两个配置项配置冲突造成的： 配置1：Configuration Properties->General->Output Directory默认配置是$(SolutionDir)$(ConfigurationName) 配置2：Configuration Properties->Linker->General->Output Directory默认配置是$(OutDir)/$(ProjectName).exe 上述的两项配置是冲突的。所以在你重新编译的时候这个错误就出现了</span><br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">Solution:</span><br /> </span>

<span style="color: #6e645b;"><span style="background-color: #ccced0;">在project的property配置窗口中：Configuration Properties->General：把Output Directory从$(SolutionDir)$(ConfigurationName)改 成$(ProjectDir)$(ConfigurationName)</span><br /> </span>