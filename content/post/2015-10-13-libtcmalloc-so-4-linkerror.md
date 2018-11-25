---
title: libtcmalloc.so.4 链接失败
author: admin
layout: post
date: 2015-10-13T12:58:38+00:00
url: /2015/10/13/libtcmalloc-so-4-linkerror.html
duoshuo_thread_id:
  - 6205115870178181890
categories:
  - linux开发
  - 建站

---
<span style="color: black; font-size: 10pt;">error while loading shared libraries: libtcmalloc.so.4: cannot open shared object file: No such file or directory<br /> </span>

<span style="color: black; font-size: 10pt;">楼主在安装lnmp时，开启了tmalloc优化，结果在安装过程中报了如上错误；<br /> </span>

<span style="color: black; font-size: 10pt;">解决办法：<br /> </span>

  1. <span style="color: black; font-size: 10pt;">用locate命令或者find命令查找确认该文件确实存在的路径；<br /> </span>
  2. <div>
      <span style="color: black; font-size: 10pt;">将路径加载到ld的配置中，命令就一句(root权限)<br /> </span>
    </div>
    
    <pre class="EnlighterJSRAW " data-enlighter-language="null">echo /usr/local/lib &gt; /etc/ld.so.conf.d/libtcmalloc.conf</pre>
    
    <span style="color: black; font-size: 10pt;"><span style="font-family: 宋体;"><br /> </span></span>
    
    <span style="color: black; font-size: 10pt;">楼主的文件位于/usr/local/lib<span style="font-family: 宋体;"><br /> </span></span></li> </ol> 
    
    <span style="color: #595959; font-size: 8pt;">来自 <<a href="http://www.th7.cn/Program/cp/201310/154663.shtml">http://www.th7.cn/Program/cp/201310/154663.shtml</a>><br /> </span>