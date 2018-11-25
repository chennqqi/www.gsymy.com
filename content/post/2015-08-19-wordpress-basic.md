---
title: wordpress基础操作
author: admin
layout: post
date: 2015-08-19T07:18:47+00:00
url: /2015/08/19/wordpress-basic.html
duoshuo_thread_id:
  - 1314126401913225235
categories:
  - 建站

---
  1. 添加favoriteicon

在wp-content/themes/YOURTHEM/header.php  <head>中添加下面语句，然后把favicon.ico文件放置到网站根目录

<pre class="lang:xhtml decode:true">&lt;link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /&gt;</pre>

&nbsp;

2. 添加统计代码

在wp-content/themes/YOURTHEM/footer.php <body>中添加对应的网站js代码即可

&nbsp;

3. 在wp-content/themes/YOURTHEM/footer.php 允许友链操作功能

<pre class="lang:default decode:true ">add_filter('pre_option_link_manager_enabled','__return_true');</pre>

&nbsp;

4.  网站居中对齐

在wp-content/themes/YOURTHEM/style.css 最后添加一行

<pre class="lang:default decode:true ">#page {margin:0 auto;}</pre>

&nbsp;

&nbsp;