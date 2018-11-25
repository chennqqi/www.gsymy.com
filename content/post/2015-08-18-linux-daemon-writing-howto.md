---
title: 怎么编写Linux守护程序
author: admin
layout: post
date: 2015-08-18T02:26:13+00:00
url: /2015/08/18/linux-daemon-writing-howto.html
duoshuo_thread_id:
  - 1314126401913225231
categories:
  - linux开发
  - 程序设计
tags:
  - deamon
  - linux
  - 守护程序

---
来源： _[Linux Daemon Writing HOWTO][1]_

# Linux Daemon Writing HOWTO

* * *

## _This document shows how to write a daemon in Linux using GCC. Knowledge of Linux and a familiarity with C are necessary to use this document. This HOWTO is Copyright by Devin Watson, under the terms of the BSD License._

<!--more-->

* * *

## <a name="toc1"></a>1. [Introduction: What is a Daemon?][2]

## <a name="toc2"></a>2. [Getting Started][3]

## <a name="toc3"></a>3. [Planning Your Daemon][4]

  * <a name="toc3.1"></a>3.1 [What Is It Going To Do?][5]
  * <a name="toc3.2"></a>3.2 [How Much Interaction?][6]

## <a name="toc4"></a>4. [Basic Daemon Structure][7]

  * <a name="toc4.1"></a>4.1 [Forking The Parent Process][8]
  * <a name="toc4.2"></a>4.2 [Changing The File Mode Mask (Umask)][9]
  * <a name="toc4.3"></a>4.3 [Opening Logs For Writing][10]
  * <a name="toc4.4"></a>4.4 [Creating a Unique Session ID (SID)][11]
  * <a name="toc4.5"></a>4.5 [Changing The Working Directory][12]
  * <a name="toc4.6"></a>4.6 [Closing Standard File Descriptors][13]

## <a name="toc5"></a>5. [Writing the Daemon Code][14]

  * <a name="toc5.1"></a>5.1 [Initialization][15]
  * <a name="toc5.2"></a>5.2 [The Big Loop][16]

## <a name="toc6"></a>6. [Putting It All Together][17]

  * <a name="toc6.1"></a>6.1 [Complete Sample][18]

* * *

## <a name="s1"></a>1. [Introduction: What is a Daemon?][19]

A daemon (or service) is a background process that is designed to run autonomously,with little or not user intervention. The Apache web server http daemon (httpd) is one such example of a daemon. It waits in the background listening on specific ports, and serves up pages or processes scripts, based on the type of request.

Creating a daemon in Linux uses a specific set of rules in a given order. Knowing how they work will help you understand how daemons operate in userland Linux, but can operate with calls to the kernel also. In fact, a few daemons interface with kernel modules that work with hardware devices, such as external controller boards, printers,and PDAs. They are one of the fundamental building blocks in Linux that give it incredible flexibility and power.

Throughout this HOWTO, a very simple daemon will be built in C. As we go along, more code will be added, showing the proper order of execution required to get a daemon up and running.

## <a name="s2"></a>2. [Getting Started][20]

First off, you&#8217;ll need the following packages installed on your Linux machine to develop daemons, specifically:

  * `GCC 3.2.2 or higher`
  * `Linux Development headers and libraries`

If your system does not already have these installed (not likely, but check anyway), you&#8217;ll need them to develop the examples in this HOWTO. To find out what version of GCC you have installed, use:

> <pre>gcc --version
</pre>

## <a name="s3"></a>3. [Planning Your Daemon][21]

## <a name="ss3.1"></a>3.1 [What Is It Going To Do?][22]

A daemon should do one thing, and do it well. That one thing may be as complex as managing hundreds of mailboxes on multiple domains, or as simple as writing a report and calling sendmail to mail it out to an admin.

In any case, you should have a good plan going in what the daemon should do. If it is going to interoperate with some other daemons that you may or may not be writing, this is something else to consider as well.

## <a name="ss3.2"></a>3.2 [How Much Interaction?][23]

Daemons should never have direct communication with a user through a terminal. In fact, a daemon shouldn&#8217;t communicate directly with a user at all. All communication should pass through some sort of interface (which you may or may not have to write), which can be as complex as a GTK+ GUI, or as simple as a signal set.

## <a name="s4"></a>4. [Basic Daemon Structure][24]

When a daemon starts up, it has to do some low-level housework to get itself ready for its real job. This involves a few steps:

  * Fork off the parent process
  * Change file mode mask (umask)
  * Open any logs for writing
  * Create a unique Session ID (SID)
  * Change the current working directory to a safe place
  * Close standard file descriptors
  * Enter actual daemon code

## <a name="ss4.1"></a>4.1 [Forking The Parent Process][25]

A daemon is started either by the system itself or a user in a terminal or script. When it does start, the process is just like any other executable on the system. To make it truly autonomous, a _child process_ must be created where the actual code is executed. This is known as forking, and it uses the _fork()_ function:

> <pre>pid_t pid;

        /* Fork off the parent process */       
        pid = fork();
        if (pid &lt; 0) {
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }
</pre>

Notice the error check right after the call to _fork()_. When writing a daemon, you will have to code as defensively as possible. In fact, a good percentage of the total code in a daemon consists of nothing but error checking.

The _fork()_ function returns either the process id (PID) of the child process (not equal to zero), or -1 on failure. If the process cannot fork a child, then the daemon should terminate right here.

If the PID returned from _fork()_ did succeed, the parent process must exit gracefully. This may seem strange to anyone who hasn&#8217;t seen it, but by forking, the child process continues the execution from here on out in the code.

## <a name="ss4.2"></a>4.2 [Changing The File Mode Mask (Umask)][26]

In order to write to any files (including logs) created by the daemon, the file mode mask (umask) must be changed to ensure that they can be written to or read from properly. This is similar to running umask from the command line, but we do it programmatically here. We can use the _umask()_ function to accomplish this:

> <pre>pid_t pid, sid;
        
        /* Fork off the parent process */
        pid = fork();
        if (pid &lt; 0) {
                /* Log failure (use syslog if possible) */
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }

        /* Change the file mode mask */
        umask(0);
        
</pre>

By setting the umask to 0, we will have full access to the files generated by the daemon. Even if you aren&#8217;t planning on using any files, it is a good idea to set the umask here anyway, just in case you will be accessing files on the filesystem.

## <a name="ss4.3"></a>4.3 [Opening Logs For Writing][27]

This part is optional, but it is recommended that you open a log file somewhere in the system for writing. This may be the only place you can look for debug information about your daemon.

## <a name="ss4.4"></a>4.4 [Creating a Unique Session ID (SID)][28]

From here, the child process must get a unique SID from the kernel in order to operate. Otherwise, the child process becomes an orphan in the system. The pid_t type, declared in the previous section, is also used to create a new SID for the child process:

> <pre>pid_t pid, sid;
        
        /* Fork off the parent process */
        pid = fork();
        if (pid &lt; 0) {
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }
        
        /* Change the file mode mask */
        umask(0);
        
        /* Open any logs here */
        
        /* Create a new SID for the child process */
        sid = setsid();
        if (sid &lt; 0) {
                /* Log any failure */
                exit(EXIT_FAILURE);
        }
</pre>

Again, the _setsid()_ function has the same return type as _fork()_. We can apply the same error-checking routine here to see if the function created the SID for the child process.

## <a name="ss4.5"></a>4.5 [Changing The Working Directory][29]

The current working directory should be changed to some place that is guaranteed to always be there. Since many Linux distributions do not completely follow the Linux Filesystem Hierarchy standard, the only directory that is guaranteed to be there is the root (/). We can do this using the _chdir()_ function:

> <pre>pid_t pid, sid;
        
        /* Fork off the parent process */
        pid = fork();
        if (pid &lt; 0) {
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }

        /* Change the file mode mask */
        umask(0);       
        
        /* Open any logs here */        
                
        /* Create a new SID for the child process */
        sid = setsid();
        if (sid &lt; 0) {
                /* Log any failure here */
                exit(EXIT_FAILURE);
        }
        
        /* Change the current working directory */
        if ((chdir("/")) &lt; 0) {
                /* Log any failure here */
                exit(EXIT_FAILURE);
        }
        
</pre>

Once again, you can see the defensive coding taking place. The _chdir()_ function returns -1 on failure, so be sure to check for that after changing to the root directory within the daemon.

## <a name="ss4.6"></a>4.6 [Closing Standard File Descriptors][30]

One of the last steps in setting up a daemon is closing out the standard file descriptors (STDIN, STDOUT, STDERR). Since a daemon cannot use the terminal, these file descriptors are redundant and a potential security hazard.

The _close()_ function can handle this for us:

> <pre>pid_t pid, sid;
        
        /* Fork off the parent process */
        pid = fork();
        if (pid &lt; 0) {
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }
        
        /* Change the file mode mask */
        umask(0);       
        
        /* Open any logs here */
        
        /* Create a new SID for the child process */
        sid = setsid();
        if (sid &lt; 0) {
                /* Log any failure here */
                exit(EXIT_FAILURE);
        }
        
        /* Change the current working directory */
        if ((chdir("/")) &lt; 0) {
                /* Log any failure here */
                exit(EXIT_FAILURE);
        }
        
        
        /* Close out the standard file descriptors */
        close(STDIN_FILENO);
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
</pre>

It&#8217;s a good idea to stick with the constants defined for the file descriptors, for the greatest portability between system versions.

## <a name="s5"></a>5. [Writing the Daemon Code][31]

## <a name="ss5.1"></a>5.1 [Initialization][32]

At this point, you have basically told Linux that you&#8217;re a daemon, so now it&#8217;s time to write the actual daemon code. Initialization is the first step here. Since there can be a multitude of different functions that can be called here to set up your daemon&#8217;s task, I won&#8217;t go too deep into here.

The big point here is that, when initializing anything in a daemon, the same defensive coding guidelines apply here. Be as verbose as possible when writing either to the syslog or your own logs. Debugging a daemon can be quite difficult when there isn&#8217;t enough information available as to the status of the daemon.

## <a name="ss5.2"></a>5.2 [The Big Loop][33]

A daemon&#8217;s main code is typically inside of an infinite loop. Technically, it isn&#8217;t an infinite loop, but it is structured as one:

> <pre>pid_t pid, sid;
        
        /* Fork off the parent process */
        pid = fork();
        if (pid &lt; 0) {
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }

        /* Change the file mode mask */
        umask(0);       
        
        /* Open any logs here */
        
        /* Create a new SID for the child process */
        sid = setsid();
        if (sid &lt; 0) {
                /* Log any failures here */
                exit(EXIT_FAILURE);
        }
        
        
        /* Change the current working directory */
        if ((chdir("/")) &lt; 0) {
                /* Log any failures here */
                exit(EXIT_FAILURE);
        }
        
        /* Close out the standard file descriptors */
        close(STDIN_FILENO);
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        
        /* Daemon-specific initialization goes here */
        
        /* The Big Loop */
        while (1) {
           /* Do some task here ... */
           sleep(30); /* wait 30 seconds */
        }
</pre>

This typical loop is usually a _while_ loop that has an infinite terminating condition, with a call to _sleep_ in there to make it run at specified intervals.

Think of it like a heartbeat: when your heart beats, it performs a few tasks, then waits until the next beat takes place. Many daemons follow this same methodology.

## <a name="s6"></a>6. [Putting It All Together][34]

## <a name="ss6.1"></a>6.1 [Complete Sample][35]

Listed below is a complete sample daemon that shows all of the steps necessary for setup and execution. To run this, simply compile using gcc, and start execution from the command line. To terminate, use the _kill_ command after finding its PID.

I&#8217;ve also put in the correct include statements for interfacing with the syslog, which is recommended at the very least for sending start/stop/pause/die log statements, in addition to using your own logs with the_fopen()_/_fwrite()_/_fclose()_ function calls.

> <pre>#include &lt;sys/types.h&gt;
#include &lt;sys/stat.h&gt;
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;fcntl.h&gt;
#include &lt;errno.h&gt;
#include &lt;unistd.h&gt;
#include &lt;syslog.h&gt;
#include &lt;string.h&gt;

int main(void) {
        
        /* Our process ID and Session ID */
        pid_t pid, sid;
        
        /* Fork off the parent process */
        pid = fork();
        if (pid &lt; 0) {
                exit(EXIT_FAILURE);
        }
        /* If we got a good PID, then
           we can exit the parent process. */
        if (pid &gt; 0) {
                exit(EXIT_SUCCESS);
        }

        /* Change the file mode mask */
        umask(0);
                
        /* Open any logs here */        
                
        /* Create a new SID for the child process */
        sid = setsid();
        if (sid &lt; 0) {
                /* Log the failure */
                exit(EXIT_FAILURE);
        }
        

        
        /* Change the current working directory */
        if ((chdir("/")) &lt; 0) {
                /* Log the failure */
                exit(EXIT_FAILURE);
        }
        
        /* Close out the standard file descriptors */
        close(STDIN_FILENO);
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        
        /* Daemon-specific initialization goes here */
        
        /* The Big Loop */
        while (1) {
           /* Do some task here ... */
           
           sleep(30); /* wait 30 seconds */
        }
   exit(EXIT_SUCCESS);
}
</pre>

From here, you can use this [nude body][36] to write your own daemons. Be sure to add in your own logging (or use the syslog facility), and code defensively, code defensively, code defensively!

 [1]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#
 [2]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#s1
 [3]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#s2
 [4]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#s3
 [5]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss3.1
 [6]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss3.2
 [7]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#s4
 [8]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss4.1
 [9]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss4.2
 [10]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss4.3
 [11]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss4.4
 [12]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss4.5
 [13]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss4.6
 [14]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#s5
 [15]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss5.1
 [16]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss5.2
 [17]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#s6
 [18]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#ss6.1
 [19]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc1
 [20]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc2
 [21]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc3
 [22]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc3.1
 [23]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc3.2
 [24]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4
 [25]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4.1
 [26]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4.2
 [27]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4.3
 [28]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4.4
 [29]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4.5
 [30]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc4.6
 [31]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc5
 [32]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc5.1
 [33]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc5.2
 [34]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc6
 [35]: http://www.linuxprofilm.com/articles/linux-daemon-howto.html#toc6.1
 [36]: http://slashnude.com/t/?elsa-pataky-nude-body-of-work-in-ninette-8703