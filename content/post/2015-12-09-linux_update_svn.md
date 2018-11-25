---
title: linux更新svn客户端 | svn,subversion,更新svn
author: admin
layout: post
date: 2015-12-09T14:15:43+00:00
url: /2015/12/09/linux_update_svn.html
wsw-settings:
  - 'a:48:{s:13:"keyword_value";s:24:"svn,subversion,更新svn";s:15:"is_meta_keyword";s:1:"1";s:17:"meta_keyword_type";s:8:"keywords";s:13:"is_meta_title";s:1:"1";s:10:"meta_title";s:0:"";s:19:"is_meta_description";s:1:"1";s:21:"is_meta_robot_noindex";s:1:"1";s:22:"is_meta_robot_nofollow";s:1:"1";s:19:"is_meta_robot_noodp";s:0:"";s:20:"is_meta_robot_noydir";s:0:"";s:16:"meta_description";s:0:"";s:17:"is_over_sentences";s:0:"";s:20:"first_over_sentences";s:0:"";s:19:"last_over_sentences";s:0:"";s:16:"is_rich_snippets";s:0:"";s:18:"show_rich_snippets";s:0:"";s:12:"rating_value";s:1:"0";s:13:"review_author";s:0:"";s:14:"review_summary";s:0:"";s:18:"review_description";s:0:"";s:10:"event_name";s:0:"";s:10:"event_date";s:0:"";s:9:"event_url";s:0:"";s:19:"event_location_name";s:0:"";s:21:"event_location_street";s:0:"";s:23:"event_location_locality";s:0:"";s:21:"event_location_region";s:0:"";s:12:"people_fname";s:0:"";s:12:"people_lname";s:0:"";s:15:"people_locality";s:0:"";s:13:"people_region";s:0:"";s:12:"people_title";s:0:"";s:14:"people_homeurl";s:0:"";s:15:"people_photourl";s:0:"";s:12:"product_name";s:0:"";s:16:"product_imageurl";s:0:"";s:19:"product_description";s:0:"";s:14:"product_offers";s:0:"";s:18:"is_social_facebook";s:0:"";s:25:"social_facebook_publisher";s:0:"";s:22:"social_facebook_author";s:0:"";s:21:"social_facebook_title";s:0:"";s:27:"social_facebook_description";s:0:"";s:17:"is_social_twitter";s:0:"";s:20:"social_twitter_title";s:0:"";s:26:"social_twitter_description";s:0:"";s:15:"autolink_anchor";s:0:"";s:19:"is_disable_autolink";s:0:"";}'
duoshuo_thread_id:
  - 6226287608155079425
categories:
  - devops
  - linux开发
tags:
  - centos
  - subversion
  - svn
  - 更新svn

---
<span style="color: black; font-size: 10pt;">CentOS自带的svn版本是1.6.11<br /> </span>

![Subversion][1]

<span style="color: black; font-size: 10pt;">Svn1.6版本之前的设计是在每个文件夹下都存有.svn来保存svn信息和备份；<br /> </span>

<span style="color: black; font-size: 10pt;">这种设计对于手工回复文件有一定的好处。1.6之后的版本都是使用在根目录下保存.svn文件夹，<br /> </span>

<span style="color: black; font-size: 10pt;">这种新的设计大大增强了安全性。新的设计你拷贝一个文件夹时不再附带无用的版本信息，删除svn信息也更加方便<br /> </span>

<span style="color: black; font-size: 10pt;">将这种文件夹拷贝给别人时也不用担心svn泄露。<br /> </span>

<span style="color: black; font-size: 10pt;">从web安全的角度讲也是更加安全了。<br /> </span>

<span style="color: black; font-size: 10pt;">关于svn泄露漏洞这里贴一点资料，大家自己去看；此话题已经脱离了本问标题，不再讨论。<br /> </span>

<span style="color: black; font-size: 10pt;">升级过程<br /> </span>

<span style="color: black; font-size: 10pt;">subversion是apache旗下的一个软件官方页面<br /> </span>

[<span style="font-size: 10pt;">http://subversion.apache.org/download.cgi#installing</span>][2]<span style="color: black; font-size: 10pt;"><br /> </span>

<span style="color: black; font-size: 10pt;">里边有几种安装(升级)方式。<br /> </span>

<span style="color: black; font-size: 10pt;">我这里给出最方便的方式，直接使用wandisco.com公司编译出的稳定版本；<br /> </span>

<span style="color: black; font-size: 10pt;">点击此处打开http://www.wandisco.com/subversion/download<br /> </span>

<span style="color: black; font-size: 10pt;">在页面中选择适合你系统的版本，在跳转的页面中填写一个表单。<span style="font-family: 宋体;"><br /> </span></span>

<span style="color: black; font-size: 10pt;">其他信息无所谓关键是邮箱一定要写真实邮箱，稍后你邮箱中会接收到一个下载地址。<br /> </span>

<span style="color: black; font-size: 10pt;">下载并以sudo权限执行bash脚本就OK了。<br /> </span>

<span style="color: black; font-size: 10pt;">为了方便大伙使用，我这里贴一个我已经下载好了的CentOS6 X86_64的bash脚本。其他版本请自行下载！<br /> </span>

<span style="color: black; font-size: 10pt;">svn泄露相关资料：<br /> </span>

[<span style="font-size: 10pt;">http://www.aisec.cn/secinfo/info/?type=svn</span>][3]<span style="color: black; font-size: 10pt;"><br /> </span>

[<span style="font-size: 10pt;">http://www.secpulse.com/archives/tag/svn%E6%96%87%E4%BB%B6%E6%B3%84%E9%9C%B2</span>][4]<span style="color: black; font-size: 10pt;"><br /> </span>

 [1]: http://subversion.apache.org/images/svn-name-banner.jpg
 [2]: http://subversion.apache.org/download.cgi
 [3]: http://www.aisec.cn/secinfo/info/?type=svn
 [4]: http://www.secpulse.com/archives/tag/svn%E6%96%87%E4%BB%B6%E6%B3%84%E9%9C%B2