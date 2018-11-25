---
title: tortoisegit/tortoisesvn 图标失效问题
author: admin
layout: post
date: 2015-10-03T14:11:02+00:00
url: /2015/10/03/tortoisegittortoisesvn-icon.html
duoshuo_thread_id:
  - 6205907737592234754
categories:
  - 未分类
  - 程序设计

---
作为一个开发者tortoisegit/tortoisesvn当然时少不了的；

最近发现tortoisegit/tortoisesvn不在显示了，文件修改后也不变红；

刚开始以为是被360有优化掉了；查看了一下启动项和进程；没问题

TSVNCache.exe进程就是负责决定在tortoise管理下的每个文件、文件夹应该显示哪个图标；

公司电脑和我自己的电脑都有这个问题；

搜索引擎上找了一下：

找到了<a href="http://blog.csdn.net/chaoyuan899/article/details/9128939" target="_blank">结论</a>

Windows Explorer Shell 支持的 Overlay Icon 最多 15 个，Windows 自身使用了 4 个，只剩 11 个可扩展使用。

360cloud（云盘）、百度云盘、OneDrive、skyDrive等软件都会占用；而每个软件都会尽量让自己的优先生效；

我最近装了微软的OneDrive所以就出问题了；

解决办法：

修改

<pre class="EnlighterJSRAW " data-enlighter-language="null">HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers</pre>

里注册的优先顺序；使得Tortoise尽量靠前；顺序是按照ascii码的顺序来的；

盗一个图

![解决][1]

**注意：有些软件再你修改后，下次启动时会再次修改顺序；你要想办法解决这个问题！**

&nbsp;

&nbsp;

详细可以参考：

<a href="http://blog.csdn.net/chaoyuan899/article/details/9128939" target="_blank">http://blog.csdn.net/chaoyuan899/article/details/9128939</a>

<a href="http://www.oschina.net/question/2297147_245156" target="_blank">http://www.oschina.net/question/2297147_245156</a>

 [1]: http://www.cfanz.cn/uploads/gif/2012/12/04/21/C4Y904C711.gif