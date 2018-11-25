---
title: Configure,Makefile.am, Makefile.in, Makefile文件之间关系(转)
author: admin
layout: post
date: 2015-09-21T03:32:25+00:00
url: /2015/09/21/configuremakefile-am-makefile-in-makefile.html
duoshuo_thread_id:
  - 1314126401913225261
categories:
  - linux开发

---
<div class="tit">
  Configure，Makefile.am, Makefile.in, Makefile文件之间关系
</div>

<div class="date">
  2009-08-12 12:14
</div>

<table border="0">
  <tr>
    <td>
      <div id="blog_text" class="cnt">
        <div class="cnt">
          <p>
            <img src="http://p.blog.csdn.net/images/p_blog_csdn_net/dolphin98629/EntryImages/20091116/55a6d229122935d798250aa4.gif" alt="" />
          </p>
          
          <p>
            1.autoscan (autoconf): 扫描源代码以搜寻普通的可移植性问题，比如检查编译器，库，头文件等，生成文件configure.scan,它是configure.ac的一个雏形。
          </p>
          
          <p>
            your source files &#8211;> [autoscan*] &#8211;> [configure.scan] &#8211;> configure.ac
          </p>
          
          <p>
            2.aclocal (automake):根据已经安装的宏，用户定义宏和acinclude.m4文件中的宏将configure.ac文件所需要的宏集中定义到文件 aclocal.m4中。aclocal是一个perl 脚本程序，它的定义是：“aclocal &#8211; create aclocal.m4 by scanning configure.ac”
          </p>
          
          <pre class="example" name="code">user input files   optional input     process          output files
================   ==============     =======          ============

                    acinclude.m4 - - - - -.
                                          V
                                      .-------,
configure.ac ------------------------&gt;;|aclocal|
                 {user macro files} -&gt;;|       |------&gt;;; aclocal.m4
                                      `-------'
3.autoheader(autoconf): 根据configure.ac中的某些宏，比如cpp宏定义，运行m4，声称config.h.in

user input files    optional input     process          output files
================    ==============     =======          ============

                    aclocal.m4 - - - - - - - .
                                             |
                                             V
                                     .----------,
configure.ac -----------------------&gt;|autoheader|----&gt; autoconfig.h.in
                                     `----------'</pre>
          
          <p>
            4.automake: automake将Makefile.am中定义的结构建立Makefile.in，然后configure脚本将生成的Makefile.in文件转换 为Makefile。如果在configure.ac中定义了一些特殊的宏，比如AC_PROG_LIBTOOL，它会调用libtoolize，否则它 会自己产生config.guess和config.sub
          </p>
          
          <pre class="example" name="code">user input files   optional input   processes          output files
================   ==============   =========          ============

                                     .--------,
                                     |        | - - -&gt; COPYING
                                     |        | - - -&gt; INSTALL
                                     |        |------&gt; install-sh
                                     |        |------&gt; missing
                                     |automake|------&gt; mkinstalldirs
configure.ac -----------------------&gt;|        |
Makefile.am  -----------------------&gt;|        |------&gt; Makefile.in
                                     |        |------&gt; stamp-h.in
                                 .---+        | - - -&gt; config.guess
                                 |   |        | - - -&gt; config.sub
                                 |   `------+-'
                                 |          | - - - -&gt; config.guess
                                 |libtoolize| - - - -&gt; config.sub
                                 |          |--------&gt; ltmain.sh
                                 |          |--------&gt; ltconfig
                                 `----------'</pre>
          
          <p>
            5.autoconf:将configure.ac中的宏展开，生成configure脚本。这个过程可能要用到aclocal.m4中定义的宏。
          </p>
          
          <pre class="example" name="code">user input files   optional input   processes          output files
================   ==============   =========          ============

aclocal.m4 ,autoconfig.h.in - - - - - - -.
                                         V
                                     .--------,
configure.ac -----------------------&gt;|autoconf|------&gt; configure</pre>
          
          <pre class="example" name="code"></pre>
          
          <p>
            &nbsp;
          </p>
          
          <pre class="example" name="code">6. ./configure的过程</pre>
          
          <pre class="example" name="code">                                           .-------------&gt; [config.cache]
     configure* --------------------------+-------------&gt; config.log
                                          |
              [config.h.in] -.            v            .--&gt; [autoconfig.h]
                             +-------&gt; config.status* -+                   
              Makefile.in ---'                         `--&gt;   Makefile</pre>
          
          <pre class="example" name="code"></pre>
          
          <p>
            &nbsp;
          </p>
          
          <pre class="example" name="code">7. make过程</pre>
          
          <pre class="example" name="code"></pre>
          
          <p>
            &nbsp;
          </p>
          
          <pre class="example" name="code">[autoconfig.h] -.
                     +--&gt; make* ---&gt;  程序
        Makefile   ---'</pre>
          
          <pre class="example" name="code"></pre>
          
          <p>
            &nbsp;
          </p>
          
          <pre class="example" name="code">.---------,
                   config.site - - -&gt;|         |
                  config.cache - - -&gt;|<strong>configure</strong>| - - -&gt; config.cache
                                     |         +-,
                                     `-+-------' |
                                       |         |----&gt; config.status
                   config.h.in -------&gt;|config-  |----&gt; config.h
                   Makefile.in -------&gt;|  .status|----&gt; Makefile
                                       |         |----&gt; stamp-h
                                       |         +--,
                                     .-+         |  |
                                     | `------+--'  |
                   ltmain.sh -------&gt;|ltconfig|-------&gt; libtool
                                     |        |     |
                                     `-+------'     |
                                       |config.guess|
                                       | config.sub |
                                       `------------'</pre>
          
          <p>
            &nbsp;
          </p>
          
          <pre class="">.--------,
                   Makefile ------&gt;|        |
                   config.h ------&gt;|  <strong>make</strong>  |
{project sources} ----------------&gt;|        |--------&gt; {project targets}
                                 .-+        +--,
                                 | `--------'  |
                                 |   libtool   |
                                 |   missing   |
                                 |  install-sh |
                                 |mkinstalldirs|
                                 `-------------'</pre>
        </div>
      </div>
      
      <p>
        实例：<br /> 在/hello/目录下创建一个hello.c文件，并编译运行它：#cd /hello/
      </p>
      
      <p>
        (1) 编写源文件hello.c：
      </p>
      
      <p>
        #include<stdio.h><br /> int main(int argc, char** argv)<br /> {<br /> printf(&#8220;Hello, GNU!n&#8221;);<br /> return 0;<br /> }
      </p>
      
      <p>
        [litao@vm0000131 hello]$ ll<br /> total 4<br /> -rw-rw-r&#8211; 1 litao litao 68 Aug 12 12:02 hello.c
      </p>
      
      <p>
        一、autoscan
      </p>
      
      <p>
        [litao@vm0000131 hello]$ autoscan<br /> autom4te: configure.ac: no such file or directory<br /> autoscan: /usr/bin/autom4te failed with exit status: 1<br /> [litao@vm0000131 hello]$ ll<br /> total 8<br /> -rw-rw-r&#8211; 1 litao litao   0 Aug 12 12:03 autoscan.log<br /> -rw-rw-r&#8211; 1 litao litao 457 Aug 12 12:03 configure.scan<br /> -rw-rw-r&#8211; 1 litao litao  68 Aug 12 12:02 hello.c
      </p>
      
      <p>
        已经生成了configure.scan，autoscan.log文件
      </p>
      
      <p>
        将configure.scan 修改为 <span class="IL_SPAN">configure</span>.in，最后修改的内容如下：
      </p>
      
      <p>
        [litao@vm0000131 hello]$ mv configure.scan configure.in<br /> [litao@vm0000131 hello]$ vim configure.in
      </p>
      
      <p>
        #                                               -*- Autoconf -*-<br /> # Process this file with autoconf to produce a configure script.
      </p>
      
      <p>
        AC_PREREQ(2.59)<br /> AC_INIT(FULL-PACKAGE-NAME, VERSION, BUG-REPORT-ADDRESS)<br /> AC_CONFIG_SRCDIR([hello.c])<br /> #AC_CONFIG_HEADER([config.h])<br /> AM_INIT_AUTOMAKE(hello, 1.0)<br /> # Checks for programs.<br /> AC_PROG_CC
      </p>
      
      <p>
        # Checks for libraries.
      </p>
      
      <p>
        # Checks for header files.
      </p>
      
      <p>
        # Checks for typedefs, structures, and compiler characteristics.
      </p>
      
      <p>
        # Checks for library functions.<br /> AC_OUTPUT(Makefile)
      </p>
      
      <p>
        二、acloacl
      </p>
      
      <p>
        [litao@vm0000131 hello]$ aclocal
      </p>
      
      <p>
        生成 aclocal.m4 和 autom4te.cache (生成aclocal.m4的过程中涉及到configure.in)
      </p>
      
      <p>
        [litao@vm0000131 hello]$ ll<br /> total 44<br /> -rw-rw-r&#8211; 1 litao litao 31120 Aug 12 12:08 aclocal.m4<br /> drwxr-xr-x 2 litao litao  4096 Aug 12 12:08 autom4te.cache<br /> -rw-rw-r&#8211; 1 litao litao     0 Aug 12 12:03 autoscan.log<br /> -rw-rw-r&#8211; 1 litao litao   496 Aug 12 12:08 configure.in<br /> -rw-rw-r&#8211; 1 litao litao    68 Aug 12 12:02 hello.c
      </p>
      
      <p>
        三、antoconf
      </p>
      
      <p>
        [litao@vm0000131 hello]$ autoconf<br /> 生成 <span class="IL_SPAN">configure</span> (根据 <span class="IL_SPAN">configure</span>.in, 和 aclocal.m4)<br /> [litao@vm0000131 hello]$ ll<br /> total 168<br /> -rw-rw-r&#8211; 1 litao litao  31120 Aug 12 12:08 aclocal.m4<br /> drwxr-xr-x 2 litao litao   4096 Aug 12 12:11 autom4te.cache<br /> -rw-rw-r&#8211; 1 litao litao      0 Aug 12 12:03 autoscan.log<br /> -rwxrwxr-x 1 litao litao 122297 Aug 12 12:11 configure<br /> -rw-rw-r&#8211; 1 litao litao    496 Aug 12 12:08 configure.in<br /> -rw-rw-r&#8211; 1 litao litao     68 Aug 12 12:02 hello.c
      </p>
      
      <p>
        四、编写Makefile.am：AUTOMAKE_OPTIONS= foreign<br /> bin_PROGRAMS= hello<br /> hello_SOURCES= hello.c
      </p>
      
      <p>
        五、automake生成 Makefile.in， depcomp， install-sh， 和 missing (根据 Makefile.am, 和 aclocal.m4)
      </p>
      
      <p>
        [litao@vm0000131 hello]$ automake<br /> configure.in: required file `./install-sh&#8217; not found<br /> configure.in: required file `./missing&#8217; not found<br /> Makefile.am: required file `./depcomp&#8217; not found<br /> [litao@vm0000131 hello]$ automake &#8211;add-missing<br /> configure.in: installing `./install-sh&#8217;<br /> configure.in: installing `./missing&#8217;<br /> Makefile.am: installing `./depcomp&#8217;<br /> [litao@vm0000131 hello]$ ll<br /> total 192<br /> -rw-rw-r&#8211; 1 litao litao  31120 Aug 12 12:08 aclocal.m4<br /> drwxr-xr-x 2 litao litao   4096 Aug 12 12:14 autom4te.cache<br /> -rw-rw-r&#8211; 1 litao litao      0 Aug 12 12:03 autoscan.log<br /> -rwxrwxr-x 1 litao litao 122297 Aug 12 12:11 configure<br /> -rw-rw-r&#8211; 1 litao litao    496 Aug 12 12:08 configure.in<br /> lrwxrwxrwx 1 litao litao     31 Aug 12 12:16 depcomp -> /usr/share/automake-1.9/depcomp<br /> -rw-rw-r&#8211; 1 litao litao     68 Aug 12 12:02 hello.c<br /> lrwxrwxrwx 1 litao litao     34 Aug 12 12:16 install-sh -> /usr/share/automake-1.9/install-sh<br /> -rw-rw-r&#8211; 1 litao litao     69 Aug 12 12:15 Makefile.am<br /> -rw-rw-r&#8211; 1 litao litao  16561 Aug 12 12:16 Makefile.in<br /> lrwxrwxrwx 1 litao litao     31 Aug 12 12:16 missing -> /usr/share/automake-1.9/missing
      </p>
      
      <p>
        六、configure<br /> 生成 Makefile， config.log， 和 config.status</td> </tr> </tbody> </table> 
        
        <p>
          转自:
        </p>
        
        <p>
          <a href="http://blog.csdn.net/dolphin98629/article/details/4815835" target="_blank">http://blog.csdn.net/dolphin98629/article/details/4815835</a>
        </p>
        
        <p>
          转载请保留原作者链接
        </p>