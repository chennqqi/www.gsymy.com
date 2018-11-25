---
title: VS编译出错，工程文件不存在
author: admin
layout: post
date: 2015-08-19T09:25:52+00:00
url: /2015/08/19/vserrornoprjfile.html
duoshuo_thread_id:
  - 1314126401913225236
categories:
  - windows开发
  - 程序设计
tags:
  - visualstudio

---
### VS编译出错信息: {.title.pre.fs1}

### <span class="tcnt">&#8220;The project file &#8221; has been renamed or is no longer in the solution&#8221;</span> {.title.pre.fs1}

看一下 .sln 和 .vcxproj 文件中的 GUID 是否匹配。 <wbr />

<div>
  可能原因1:
</div>

<div>
  出这个提示，一般是 .vcxproj 中 <ProjectGuid> 中的 GUID 和 .sln 中的 Project GUID 不一致了。（Project Depedencies）
</div>

<div>
   
</div>

<div>
  可能原因2:
</div>

<div>
  也有可能是 .sln 引用了 A.vcxproj，而 A.vcxproj 依赖了 B.vcxproj，而 B.vcxproj 未被加入到 .sln 中。查看 A.vcxproj 中的 <ProjectReference>，看看引用了哪个未加入 .sln 的工程，加一下就好。
</div>

<div>
   
</div>

<div>
  说明：
</div>

<div>
  打开.sln工程文件，检查
</div>

<div>
  <strong>Project(&#8220;&#8230;</strong>
</div>

<div>
  <strong> EndProject</strong>
</div>

<div>
  节和每个*.vcxproj工程里的GUID匹配不，不匹配改正，
</div>

<div>
  如果有重复的，利用VS生成新的，替换掉。
</div>

<div>
   
</div>

<!--more-->参考: http://stackoverflow.com/questions/14573411/visual-studio-2012-the-project-file-has-been-renamed-or-is-no-longer-in-the-s

<div>
   
</div>

<div>
  原文链接:<a href="http://kasicass.blog.163.com/blog/static/395619201441694625312/" target="_blank">http://kasicass.blog.163.com/blog/static/395619201441694625312/</a>
</div>