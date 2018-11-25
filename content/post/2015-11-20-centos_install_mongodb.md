---
title: CentOS安装mongodb
author: admin
layout: post
date: 2015-11-20T07:31:11+00:00
url: /2015/11/20/centos_install_mongodb.html
duoshuo_thread_id:
  - 6219240505520161537
categories:
  - linux开发

---
<span style="color: black; font-size: 10pt;">yum源中添加mongodb下载地址<br /> </span>

<span style="color: black; font-size: 10pt;">具体步骤：<span style="font-family: 宋体;"><br /> </span></span>

<span style="color: black; font-size: 10pt;">Cd /etc/yum.repo.d/<br /> </span>

<span style="color: black; font-size: 10pt;">创建 mongodb.repo<br /> </span>

<span style="color: black; font-size: 10pt;">添加内容<span style="font-family: 宋体;"><br /> </span></span>

<pre class="EnlighterJSRAW " data-enlighter-language="shell">[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1</pre>

<span style="color: black; font-size: 10pt;"><br /> </span>

<span style="color: black; font-size: 10pt;"><span style="background-color: white;">执行sudo yum install -y mongodb-org </span><br /> </span>

<span style="color: #595959; font-size: 8pt;">来自 <<a href="http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece7631046893b4c4380146d96864968d4e414c42246101d27abfa3a715042889422301cf91e1ab9ab68332a0321b690c88e40d8afd7756fde28652740c01c53c419de941b79947dc60a&p=8b2a975986cc41ac5dbc8a3f465294&newp=8a6dc54ad6c044b509be9b7c7f05cf231610db2151d4d1106585&user=baidu&fm=sc&query=centos+mongodb&qid=ae2d9c2c0000752b&p1=4">http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece7631046893b4c4380146d96864968d4e414c42246101d27abfa3a715042889422301cf91e1ab9ab68332a0321b690c88e40d8afd7756fde28652740c01c53c419de941b79947dc60a&p=8b2a975986cc41ac5dbc8a3f465294&newp=8a6dc54ad6c044b509be9b7c7f05cf231610db2151d4d1106585&user=baidu&fm=sc&query=centos+mongodb&qid=ae2d9c2c0000752b&p1=4</a>></span><span style="color: black; font-size: 10pt;"><span style="font-family: 宋体;"><br /> </span></span>