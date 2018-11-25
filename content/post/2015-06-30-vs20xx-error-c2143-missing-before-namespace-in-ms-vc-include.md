---
title: VS20XX 错误 Error C2143 (missing ; before namespace) in MS VC include
author: admin
layout: post
date: 2015-06-30T09:44:00+00:00
url: /2015/06/30/vs20xx-error-c2143-missing-before-namespace-in-ms-vc-include.html
duoshuo_thread_id:
  - 1314126401913225223
categories:
  - windows开发
tags:
  - visualstudio
  - windows 开发
  - 编译错误

---
## 错误信息：

VC\include\yvals.h(535): error C2143: syntax error : missing &#8216;;&#8217; before &#8216;namespace&#8217;

## 可能的原因：

<!--more-->

**你include文件头文件中有文件遗漏了分号。请仔细检查你的源代码！**

  * 参考：<a href="http://stackoverflow.com/questions/4309532/error-c2143-missing-before-namespace-in-ms-vc-include" target="_blank">http://stackoverflow.com/questions/4309532/error-c2143-missing-before-namespace-in-ms-vc-include</a>