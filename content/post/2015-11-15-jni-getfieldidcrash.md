---
title: jni GetFieldID崩溃的一个可能原因
author: admin
layout: post
date: 2015-11-15T06:46:37+00:00
url: /2015/11/15/jni-getfieldidcrash.html
duoshuo_thread_id:
  - 6217265799401308929
categories:
  - Java
tags:
  - JAVA
  - JNI
  - JNI崩溃
  - 崩溃

---
<span style="color: black; font-size: 10pt;">错误信息如下：<span style="font-family: 宋体;"><br /> </span></span>

<span style="color: black; font-size: 10pt;"># Problematic frame:<br /> </span>

<span style="color: black; font-size: 10pt;"># V [libjvm.so+0x5338c6] jni_GetFieldID+0xf6<br /> </span>

<span style="color: black; font-size: 10pt;">java版本JDK 1.7.0 X64<br /> </span>

<span style="color: black; font-size: 10pt;">分析GetFieldID第一个参数是通过FindClass来获得的，如果获取失败这里就崩溃了。<br /> </span>

<span style="color: black; font-size: 10pt;">检查你FindClass里的参数是否正确；包路径是否正确；<br /> </span>

<span style="color: black; font-size: 10pt;">注意：在低版本的java里FindClass包路径写&#8221;com.XXX.XXX.XXX&#8221;是可以的，<br /> </span>

<span style="color: black; font-size: 10pt;">而java1.7里要求写&#8221;com/XXX/XXX/XXX&#8221;的路径方式<br /> </span>