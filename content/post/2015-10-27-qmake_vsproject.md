---
title: qmake不能生成vs工程文件
author: admin
layout: post
date: 2015-10-27T10:33:30+00:00
url: /2015/10/27/qmake_vsproject.html
duoshuo_thread_id:
  - 6210274448023536385
categories:
  - qt
  - windows开发
tags:
  - qmake
  - qt
  - vs2010
  - 工程

---
<span style="color: black; font-size: 10pt;">报错信息如下：<br /> </span>

<span style="color: black; font-size: 10pt;">WARNING: Unable to generate output for: Makefile.Debug [TEMPLATE vcapp]<br /> </span>

<span style="color: black; font-size: 10pt;">正常情况下命令式:<br /> </span>

<pre class="EnlighterJSRAW" data-enlighter-language="shell">qmake -tp vc xxx.pro</pre>

<span style="color: black; font-size: 10pt;"><br /> </span>

<span style="color: black; font-size: 10pt;"><strong>解决办法</strong><span style="font-family: 宋体;"><br /> </span></span>

<span style="color: black; font-size: 10pt;">有些环境下装了多个Qt或者是环境变量有问题导致qmake没有找到正确的spec<br /> </span>

<span style="color: black; font-size: 10pt;">修改命令为:<br /> </span>

<pre class="lang:sh decode:true ">qmake -tp vc -spec win32-msvc2010 xxx.pro</pre>

&nbsp;

<span style="color: black; font-size: 10pt;">这里spec选择你需要的版本即可<br /> </span>