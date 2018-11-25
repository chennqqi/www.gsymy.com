---
title: centos安装gitolite
author: admin
layout: post
date: 2016-01-11T14:48:49+00:00
url: /2016/01/11/centos_install_gitolite.html
duoshuo_thread_id:
  - 6238542266856637186
categories:
  - devops

---
<span style="color: black; font-family: 微软雅黑;"><strong>安装基础包</strong><span style="font-size: 12pt;"><br /> </span></span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">yum install perl openssh git<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">yum install perl-Time-HiRes<br /> </span>
</p>

<span style="color: black;"><strong><span style="font-family: 微软雅黑;">创建</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">用户</span></strong><span style="font-size: 12pt;"><br /> </span></span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">useradd -d /home/git git<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">passwd git<br /> </span>
</p>

<span style="color: black;"><strong><span style="font-family: 微软雅黑;">在</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">用户家目录下安装</span><span style="font-family: Verdana;">gitolite</span></strong><span style="font-size: 12pt;"><br /> </span></span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">切换到</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">用户</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;"># su </span><span style="font-family: 微软雅黑;">–</span><span style="font-family: Verdana;"> git</span><br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">创建文件夹</span><span style="font-family: Verdana;">bin</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ mkdir bin<br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">克隆</span><span style="font-family: Verdana;">gitolite</span><span style="font-family: 微软雅黑;">源码</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ git clone <a href="https://github.com/sitaramc/gitolite.git">https://github.com/sitaramc/gitolite.git</a><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ ls<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">bin</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> gitolite</span><br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">安装</span><span style="font-family: Verdana;">gitolite</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ ./gitolite/install -to /home/git/bin/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ cd bin/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ ls<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">commands</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> gitolite</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> gitolite-shell</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> lib</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> syntactic-sugar</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> triggers</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> VERSION</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> VREF</span><br /> </span>
</p>

<span style="color: black;"><strong><span style="font-family: 微软雅黑;">配置</span><span style="font-family: Verdana;">gitolite</span><span style="font-family: 微软雅黑;">管理员</span></strong><span style="font-size: 12pt;"><br /> </span></span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">生成管理员账户的公钥（此处指定本地</span><span style="font-family: Verdana;">root</span><span style="font-family: 微软雅黑;">用户为管理员，键入回车使用默认值） </span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># ssh-keygen<br /> </span>
</p>

<span style="color: #333333; font-family: 微软雅黑; font-size: 10pt;">复制管理的公钥<br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># cp .ssh/id_rsa.pub /tmp/admin.pub<br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">切换回</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">用户，为</span><span style="font-family: Verdana;">gitolite</span><span style="font-family: 微软雅黑;">配置管理员 </span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ /home/git/bin/gitolite setup -pk /tmp/admin.pub<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Initialized empty Git repository in /home/git/repositories/gitolite-admin.git/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Initialized empty Git repository in /home/git/repositories/testing.git/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">WARNING: /home/git/.ssh missing; creating a new one<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">WARNING: /home/git/.ssh/authorized_keys missing; creating a new one<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ ls<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">bin</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> gitolite</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> projects.list</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> repositories</span><br /> </span>
</p>

<span style="color: black; font-family: 微软雅黑;"><strong>管理员日常管理</strong><span style="font-size: 12pt;"><br /> </span></span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">管理员</span><span style="font-family: Verdana;">clone</span><span style="font-family: 微软雅黑;">管理库（此处为本地</span><span style="font-family: Verdana;">root</span><span style="font-family: 微软雅黑;">用户） </span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># git clone git@192.168.1.95:gitolite-admin<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Initialized empty Git repository <strong>in</strong> /root/gitolite-admin/.git/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">The authenticity of host </span><span style="font-family: 微软雅黑;">&#8216;</span><span style="font-family: Verdana;">192.168.213.130 (192.168.213.130)</span><span style="font-family: 微软雅黑;">&#8216;</span><span style="font-family: Verdana;"> can</span><span style="font-family: 微软雅黑;">&#8216;</span><span style="font-family: Verdana;">t be established. </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">RSA key fingerprint is d4:28:ca:66:58:b6:39:c1:aa:37:58:9a:5b:ed:50:05.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Are you sure you want to continue connecting (yes/no)? yes<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><em><span style="font-family: Verdana;"># </span><span style="font-family: 微软雅黑;">此处因为第一次</span><span style="font-family: Verdana;">ssh</span><span style="font-family: 微软雅黑;">连接，所以需要输入&#8217;</span><span style="font-family: Verdana;">yes</span></em><span style="font-family: 微软雅黑;"><em>&#8216;</em> </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">Warning: Permanently added </span><span style="font-family: 微软雅黑;">&#8216;</span><span style="font-family: Verdana;">192.168.213.130</span><span style="font-family: 微软雅黑;">′</span><span style="font-family: Verdana;"> (RSA) to the list of known hosts. </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">remote: Counting objects: 6, done.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">remote: Compressing objects: 100% (4/4), done.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Receiving objects: 100% (6/6), 748 bytes, done.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">remote: Total 6 (delta 0), reused 0 (delta 0)<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># pwd<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">/home/git/gitolite-admin<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># ls<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">conf</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> keydir</span><br /> </span>
</p>

<span style="color: #333333; font-family: 微软雅黑; font-size: 10pt;">创建库、添加用户<br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">例如某</span><span style="font-family: Verdana;">lm</span><span style="font-family: 微软雅黑;">用户访问</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">服务器上的</span><span style="font-family: Verdana;">myFirstRepo</span><span style="font-family: 微软雅黑;">库</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: Verdana;">lm</span><span style="font-family: 微软雅黑;">用户向</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">服务器管理提交自己的</span><span style="font-family: Verdana;">ssh</span><span style="font-family: 微软雅黑;">无密码公钥</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">管理员将</span><span style="font-family: Verdana;">lm</span><span style="font-family: 微软雅黑;">的公钥复制到</span><span style="font-family: Verdana;"> gitolite-admin/keydir/ </span><span style="font-family: 微软雅黑;">下 </span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># cp lm.pub /home/git/gitolite-admin/keydir/<br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">这里的</span><span style="font-family: Verdana;">XX.pub</span><span style="font-family: 微软雅黑;">就是用户</span><span style="font-family: Verdana;">XX</span><span style="font-family: 微软雅黑;">，及</span><span style="font-family: Verdana;">conf</span><span style="font-family: 微软雅黑;">里的用户名，</span><span style="font-family: Verdana;">windows</span><span style="font-family: 微软雅黑;">下通过</span><span style="font-family: Verdana;">putty-keygen</span><span style="font-family: 微软雅黑;">生成</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">将蓝色的部分保存为</span><span style="font-family: Verdana;">XXX.pub</span><span style="font-family: 微软雅黑;">，放到</span><span style="font-family: Verdana;">gitolite-admin/keydir/</span><span style="font-family: 微软雅黑;">下，不是生成公钥的那个！私钥是通过生成私钥的按钮生成，之后在</span><span style="font-family: Verdana;">tortoiseGit</span><span style="font-family: 微软雅黑;">里</span><span style="font-family: Verdana;">load</span><span style="font-family: 微软雅黑;">这个私钥与</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">服务器通信。</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: Verdana;">windows</span><span style="font-family: 微软雅黑;">用户生成密钥</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">可以使用</span><span style="font-family: Verdana;">putty</span><span style="font-family: 微软雅黑;">的</span><span style="font-family: Verdana;">puttygen.exe</span><span style="font-family: 微软雅黑;">文件来直接生成公钥和</span><span style="font-family: Verdana;">ppk</span><span style="font-family: 微软雅黑;">，但是公钥是最上面显示出来的，而不是</span><span style="font-family: Verdana;">Save public key</span><span style="font-family: 微软雅黑;">产生的。</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">另一种方法是使用</span><span style="font-family: Verdana;">msysgit</span><span style="font-family: 微软雅黑;">中的</span><span style="font-family: Verdana;">ssh-keygen</span><span style="font-family: 微软雅黑;">来生成</span><span style="font-family: Verdana;">: ssh-keygen -t rsa</span><span style="font-family: 微软雅黑;">，然后在将密钥通过</span><span style="font-family: Verdana;">puttygen.exe</span><span style="font-family: 微软雅黑;">来</span><span style="font-family: Verdana;">load</span><span style="font-family: 微软雅黑;">，然后在</span><span style="font-family: Verdana;">Save private key</span><span style="font-family: 微软雅黑;">来生成</span><span style="font-family: Verdana;">ppk</span><span style="font-family: 微软雅黑;">文件</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">管理员创建</span><span style="font-family: Verdana;">myFirstRepo</span><span style="font-family: 微软雅黑;">库，并给</span><span style="font-family: Verdana;">lm</span><span style="font-family: 微软雅黑;">分配权限 </span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># cd gitolite-admin/conf/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># vi gitolite.conf<br /> </span>
</p>

<span style="color: #333333; font-family: 微软雅黑; font-size: 10pt;">默认内容为：<br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">repo gitolite-admin<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> RW+ =</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> admin </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">repo testing<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> RW+ =</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> @all</span><br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">下边定义</span><span style="font-family: Verdana;">myFirstRepo</span><span style="font-family: 微软雅黑;">库，并且指定用户权限： </span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">repo gitolite-admin<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> RW+ =</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> admin </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">repo testing<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> RW+ =</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> @all </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">@myGroup=admin</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> lm</span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">repo myFirstRepo<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> RW+ =</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> @myGroup</span><br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">注：此处</span><span style="font-family: Verdana;">@myGroup</span><span style="font-family: 微软雅黑;">是一个组，给</span><span style="font-family: Verdana;">myGroup</span><span style="font-family: 微软雅黑;">组赋予对</span><span style="font-family: Verdana;">myFirstRepo</span><span style="font-family: 微软雅黑;">这个库的读、写、推送的权限（详细规则可参考</span><span style="font-family: Verdana;">gitolite</span><span style="font-family: 微软雅黑;">的</span><span style="font-family: Verdana;">readme.txt</span><span style="font-family: 微软雅黑;">）</span><br /> </span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">管理员将对</span><span style="font-family: Verdana;">gitolite-admin</span><span style="font-family: 微软雅黑;">的修改（建库、加用户）提交到</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">服务器</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># pwd<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">/root/gitolite-admin<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># git status<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># On branch master<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># Changed but not updated:<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">#</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> (use </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">git add <file>…&#8221; to update what will be committed) </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">#</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> (use </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">git checkout </span><span style="font-family: 微软雅黑;">—</span><span style="font-family: Verdana;"> <file>…&#8221; to discard changes in working directory) </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">#<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">#</span><span style="font-family: 微软雅黑;">      </span><span style="font-family: Verdana;"> modified:</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> conf/gitolite.conf </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">#<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># Untracked files:<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">#</span><span style="font-family: 微软雅黑;">  </span><span style="font-family: Verdana;"> (use </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">git add <file>…&#8221; to include in what will be committed) </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">#<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">#</span><span style="font-family: 微软雅黑;">      </span><span style="font-family: Verdana;"> keydir/test123.pub </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">no changes added to commit (use </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">git add</span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;"> and/or </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">git commit -a</span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">)</span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># git add *<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;"># git commit -m </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">AddRepo:myFirstRepo;AddUser:test123</span><span style="font-family: 微软雅黑;">″ </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">[master 4c5a5d0] AddRepo:myFirstRepo;AddUser:test123<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Committer: root <root@app-node-V-CC.(none)><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Your name and email address were configured automatically based<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">on your username and hostname. Please check that they are accurate.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">You can suppress this message by setting them explicitly:<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> git config </span><span style="font-family: 微软雅黑;">–</span><span style="font-family: Verdana;">global user.name </span><span style="font-family: 微软雅黑;">&#8220;</span><span style="font-family: Verdana;">Your Name</span><span style="font-family: 微软雅黑;">&#8221; </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> git config </span><span style="font-family: 微软雅黑;">–</span><span style="font-family: Verdana;">global user.email you@example.com </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">If the identity used for this commit is wrong, you can fix it with:<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: 微软雅黑;">   </span><span style="font-family: Verdana;"> git commit </span><span style="font-family: 微软雅黑;">–</span><span style="font-family: Verdana;">amend </span><span style="font-family: 微软雅黑;">–</span><span style="font-family: Verdana;">author=</span><span style="font-family: 微软雅黑;">&#8216;</span><span style="font-family: Verdana;">Your Name <you@example.com>&#8217; </span><br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">2 files changed, 6 insertions(+), 0 deletions(-)<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">create mode 100644 keydir/test123.pub<br /> </span>
</p>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: 微软雅黑;">注：提示是建议设置用户信息（便于多人协作时辨别），可参照提示命令操作（其实</span><span style="font-family: Verdana;">git</span><span style="font-family: 微软雅黑;">自动为你添加了）</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;"># git push origin master<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Counting objects: 10, done.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Delta compression using up to 2 threads.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Compressing objects: 100% (5/5), done.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Writing objects: 100% (6/6), 859 bytes, done.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Total 6 (delta 0), reused 0 (delta 0)<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">remote: Initialized empty Git repository in /home/git/repositories/myFirstRepo.git/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">To git@192.168.213.130:gitolite-admin<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-size: 10pt;"><span style="font-family: Verdana;">48a7307..4c5a5d0</span><span style="font-family: 微软雅黑;"> </span><span style="font-family: Verdana;"> master -> master</span><br /> </span>
</p>

<span style="color: black; font-family: 微软雅黑;"><strong>客户验证</strong><span style="font-size: 12pt;"><br /> </span></span>

<span style="color: #333333; font-size: 10pt;"><span style="font-family: Verdana;">lm</span><span style="font-family: 微软雅黑;">用户克隆</span><span style="font-family: Verdana;">myFirstRepo</span><span style="font-family: 微软雅黑;">库</span><br /> </span>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ git clone git@192.168.1.95:myFirstRepo<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">Initialized empty Git repository in /home/test123/myFirstRepo/.git/<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">warning: You appear to have cloned an empty repository.<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">$ ls<br /> </span>
</p>

<p style="margin-left: 27pt;">
  <span style="color: #5b5b5b; font-family: Verdana; font-size: 10pt;">myFirstRepo<br /> </span>
</p>

<span style="color: #595959; font-size: 9pt;">来自 <<a href="https://www.cnblogs.com/kudosharry/articles/3709418.html">https://www.cnblogs.com/kudosharry/articles/3709418.html</a>><br /> </span>