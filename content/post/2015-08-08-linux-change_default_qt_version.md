---
title: linux 修改默认Qt版本
author: admin
layout: post
date: 2015-08-08T03:03:59+00:00
url: /2015/08/08/linux-change_default_qt_version.html
duoshuo_thread_id:
  - 1314126401913225217
categories:
  - linux开发
tags:
  - centos
  - linux
  - qt
  - qt3
  - qt4

---
centos 5\6 下默认使用Qt3

可以通过sudo yum install qt-devel 安装qt4

安装后系统默认的还是qt3

解决办法：

<!--more-->

1. vim 编辑 /etc/profile.d/qt.sh 文件

<pre class="lang:sh decode:true " title="qt.sh 文件"># Qt initialization script (sh)

# In multilib environments there is a preferred architecture, 64 bit over 32 bit in x86_64,
# When a conflict is found between two packages corresponding with different arches,
# the installed file is the one from the preferred arch. This is very common for executables
# in /usr/bin, for example. If the file /usr/bin/foo is found in an x86_64 package and in an
# i386 package, the executable from x86_64 will be installe

if [ -z "${QTDIR}" ]; then

case `uname -m` in
   x86_64 | ia64 | s390x | ppc64 )
      QT_PREFIXES="/usr/lib64/qt4 /usr/lib/qt4" ;;
   * )
      QT_PREFIXES="/usr/lib/qt4 /usr/lib64/qt4" ;;
esac

for QTDIR in ${QT_PREFIXES} ; do
  test -d "${QTDIR}" && break
done
unset QT_PREFIXES

if ! echo ${PATH} | /bin/grep -q $QTDIR/bin ; then
   PATH=$QTDIR/bin:${PATH}
fi

QTINC="$QTDIR/include"
QTLIB="$QTDIR/lib"

export QTDIR QTINC QTLIB PATH

fi</pre>

<pre class="lang:sh decode:true " title="qt.sh 文件"># Qt initialization script (sh)

# In multilib environments there is a preferred architecture, 64 bit over 32 bit in x86_64,
# When a conflict is found between two packages corresponding with different arches,
# the installed file is the one from the preferred arch. This is very common for executables
# in /usr/bin, for example. If the file /usr/bin/foo is found in an x86_64 package and in an
# i386 package, the executable from x86_64 will be installe

if [ -z "${QTDIR}" ]; then

case `uname -m` in
   x86_64 | ia64 | s390x | ppc64 )
      QT_PREFIXES="/usr/lib64/qt4 /usr/lib/qt4" ;;
   * )
      QT_PREFIXES="/usr/lib/qt4 /usr/lib64/qt4" ;;
esac

for QTDIR in ${QT_PREFIXES} ; do
  test -d "${QTDIR}" && break
done
unset QT_PREFIXES

if ! echo ${PATH} | /bin/grep -q $QTDIR/bin ; then
   PATH=$QTDIR/bin:${PATH}
fi

QTINC="$QTDIR/include"
QTLIB="$QTDIR/lib"

export QTDIR QTINC QTLIB PATH

fi</pre>

2. 重启系统