---
title: Linux 命令行参数处理函数探究(转)
author: admin
layout: post
date: 2015-08-23T01:59:32+00:00
url: /2015/08/23/linux-getopt.html
duoshuo_thread_id:
  - 1314126401913225241
original_author:
  - chennqqi@163.com
categories:
  - linux开发
  - 程序设计
tags:
  - cmdline
  - getopt
  - getopt_long
  - linux

---
一、getopt函数

![][1]

<div>
  A.函数功能：处理命令行参数
</div>

<div>
</div>

<div>
  B.参数:
</div>

<div>
</div>

<div>
  argc代表命令行参数的个数，argv[i]存放命令行参数在内存存放的地址。这两个参数直接从mian(int argc,char *argv[])得到。
</div>

<div>
</div>

<div>
  如果argv的元素是以 &#8220;-“开头称为一个选项元素,紧跟在&#8221;-&#8220;后面的一个字符称为选项字符。
</div>

<div>
</div>

<div>
  eg:ls  -l
</div>

<div>
</div>

<div>
  其中ls是可执行程序名称，-l称为选项元素，&#8217;l&#8217;称为选项字符
</div>

<div>
</div>

<div>
  optstring:选项参数的集合
</div>

<div>
</div>

<div>
  注意:如果getopt()函数被循环调用，每次调用都会返回一个对应选元素的选项字符,如果所有选项字符都放回后，再次调用getopt()函数返回-1。
</div>

<div>
</div>

<div>
</div>

<div>
  <pre class="lang:c decode:true ">./a.out   -a  -n  -l
 
while(1)
{
    ch = getopt(argc,argv,"anl");
}</pre>
  
  <p>
    &nbsp;
  </p>
</div>

<!--more-->

<div>
  第一次调用ch : &#8216;a&#8217;
</div>

<div>
  第二次调用ch : &#8216;n&#8217;
</div>

<div>
  第三次调用ch : &#8216;l&#8217;
</div>

<div>
</div>

<div>
  <p>
    案例一、
  </p>
</div>

<a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526418yiyG.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=1f4be180-7e44-4e3f-9802-b2e7872c9dc2&n=26833883_1337526418yiyG.png&ext=png" alt="" /></a>

运行结果：

<a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526453JOOB.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=c9a8f641-7970-457e-8640-76c5eef14900&n=26833883_1337526453JOOB.png&ext=png" alt="" /></a>

<div>
  C.变量optind
</div>

<div>
</div>

<div>
  每次getopt函数调用的时候，optind总是当前处理argv[index]的下一个被处理选项元素的索引即optind = index + 1，如:当前处理的选项元素argv[1]，则optind的值为2,即argv[2]的索引。
</div>

<div>
</div>

<div>
  注意：其值默认初始化为1,如果。
</div>

<div>
</div>

<div>
  <p>
    案例二、
  </p>
  
  <div>
    <ol>
      <li>
        <pre class="lang:c decode:true ">#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
int main(int argc,char *argv[])
{
    int ch;
    while((ch = getopt(argc,argv,"cyg")) != -1)
    {
        switch(ch)
        {
        case 'c':
            printf("optind = %d\n",optind);
            printf("Option character \'c\'.\n");
            break;
        case 'y':
            printf("optind = %d\n",optind);
            printf("Option character \'y\'.\n");
            break;
        case 'g':
            printf("optind = %d\n",optind);
            printf("Option character \'g\'.\n");
            break;
        }
    }
    printf("Ending...\n");
    printf("optind = %d\n",optind);
    return 0;
}</pre>
        
        <p>
          &nbsp;</li> </ol> </div> 
          
          <p>
            运行结果:
          </p>
          
          <p>
            <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526516f9w5.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=e78c330d-84fb-4f42-9e4f-5799ac7a0a7d&n=26833883_1337526516f9w5.png&ext=png" alt="" /></a>
          </p>
          
          <div>
            D.变量optarg
          </div>
          
          <div>
          </div>
          
          <div>
            如果optstring选项字符后面紧跟一个&#8221;:&#8221;，则要求选项元素后面跟一个参数;
          </div>
          
          <div>
            如果optstring选项字符后面紧跟两个&#8221;::&#8221;，则选项元素后面可以跟一个可选的参数
          </div>
          
          <div>
          </div>
          
          <div>
            <p>
              案例三:
            </p>
            
            <div>
              <ol>
                <li>
                  <pre class="lang:c decode:true ">#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
int main(int argc,char *argv[])
{
    int ch;
    while((ch = getopt(argc,argv,"c:yg::")) != -1)
    {
        switch(ch)
        {
        case 'c':
            printf("optind = %d\n",optind);
            printf("optarg = %s\n",optarg);
            printf("Option character \'c\'.\n");
            break;
        case 'y':
            printf("optind = %d\n",optind);
            printf("Option character \'y\'.\n");
            break;
        case 'g':
            printf("optind = %d\n",optind);
            printf("optarg = %s\n",optarg);
            printf("Option character \'g\'.\n");
            break;
        }
    }
    printf("Ending...\n");
    printf("argv[%d] = %s\n",optind,argv[optind]);
    return 0;
}</pre>
                  
                  <p>
                    &nbsp;</li> </ol> </div> 
                    
                    <p>
                      <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526570jxAE.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=476757e3-8aa2-4d6b-b9f1-7c40b78d1225&n=26833883_1337526570jxAE.png&ext=png" alt="" /></a>
                    </p>
                    
                    <div>
                      注意：上面的最后一次运行结果，&#8221;xxx&#8221;在一开始在argv的的索引值为3,但是我们发现它实际的索引值是4。这是因为getopt函数，会把不拥有选项参数的选项字符后面的操作数，放在最后。
                    </div>
                    
                    <div>
                    </div>
                    
                    <div>
                      E.变量opterr和变量optopt
                    </div>
                    
                    <div>
                    </div>
                    
                    <div>
                      getopt()函数在搜索argv时，如果发现argv拥有optstring所没有的选项字符，则会提示立即返回&#8217;?&#8217;,并提示错误信息，所没有的选项字符会放在opt里。如果不想系统提示默认的错误信息，将opterr设为0即可。
                    </div>
                    
                    <div>
                    </div>
                    
                    <div>
                      <p>
                        案例四:
                      </p>
                      
                      <div>
                        <ol>
                          <li>
                            <pre class="lang:c decode:true ">#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
int main(int argc,char *argv[])
{
    int ch;
    while((ch = getopt(argc,argv,"c:yg::")) != -1)
    {
        switch(ch)
        {
        case 'c':
            printf("optind = %d\n",optind);
            printf("optarg = %s\n",optarg);
            printf("Option character \'c\'.\n");
            break;
        case 'y':
            printf("optind = %d\n",optind);
            printf("Option character \'y\'.\n");
            break;
        case 'g':
            printf("optind = %d\n",optind);
            printf("optarg = %s\n",optarg);
            printf("Option character \'g\'.\n");
            break;
        case '?':
            printf("Invalid Option character \'%c\'.\n",optopt);
            break;
        }
    }
    printf("Ending...\n");
    printf("argv[%d] = %s\n",optind,argv[optind]);
    return 0;
}</pre>
                            
                            <p>
                              &nbsp;</li> </ol> </div> 
                              
                              <p>
                                运行结果：
                              </p>
                              
                              <p>
                                <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526663lAlS.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=969fecda-458d-419b-b5b6-418ea7b2f6c9&n=26833883_1337526663lAlS.png&ext=png" alt="" /></a>
                              </p></div> 
                              
                              <div>
                                注意:如果optstring字符串一开始就是&#8221;:&#8221;，则后面要求有选项参数的选项字符，在argv中没有选项参数时，此时调用getopt函数返回&#8221;:&#8221;,optopt存放的是没有跟选项参数的选项字符。
                              </div>
                              
                              <div>
                              </div>
                              
                              <div>
                                <p>
                                  案例五:
                                </p>
                                
                                <div>
                                  <ol>
                                    <li>
                                      <pre class="lang:c decode:true ">#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
int main(int argc,char *argv[])
{
    int ch;
    while((ch = getopt(argc,argv,":c:yg::")) != -1)
    {
        switch(ch)
        {
        case 'c':
            printf("optind = %d\n",optind);
            printf("optarg = %s\n",optarg);
            printf("Option character \'c\'.\n");
            break;
        case 'y':
            printf("optind = %d\n",optind);
            printf("Option character \'y\'.\n");
            break;
        case 'g':
            printf("optarg = %s\n",optarg);
            printf("optind = %d\n",optind);
            printf("Option character \'g\'.\n");
            break;
        case ':':
            printf("Option character \'%c\',forget argument.\n",optopt);
            break;
        case '?':
            printf("optind = %d\n",optind);
            printf("Invalid Option character \'%c\'.\n",optopt);
            break;
        }
    }
    printf("Ending...\n");
    printf("argv[%d] = %s\n",optind,argv[optind]);
    return 0;
}</pre>
                                      
                                      <p>
                                        &nbsp;</li> </ol> </div> 
                                        
                                        <p>
                                          运行结果:
                                        </p>
                                        
                                        <p>
                                          <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526728MXSY.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=1ea510f3-b09d-4baf-a471-6ef043040479&n=26833883_1337526728MXSY.png&ext=png" alt="" /></a>
                                        </p>
                                        
                                        <div>
                                          二、getopt_long函数
                                        </div>
                                        
                                        <div>
                                        </div>
                                        
                                        <div>
                                           getopt_long函数也是处理命令行参数,我们会发现它多了一个long,这个long的意思是它支持长选项。
                                        </div>
                                        
                                        <div>
                                          前面我们讨论都是含有一个&#8221;-&#8220;的选项，常我们会看到&#8221;&#8211;help&#8221;这样的造型，其实这就是命令行参数中的长选项。一般短选项是选项名的缩写,长选项是选项名的全名。<br /> <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526761a12B.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=0250a467-60da-482d-8a3a-8c8d40b85c22&n=26833883_1337526761a12B.png&ext=png" alt="" /></a><br /> <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526779136u.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=9ee72e9f-4d2b-4f82-9568-6c97ed9d5f9b&n=26833883_1337526779136u.png&ext=png" alt="" /></a></p> 
                                          
                                          <div>
                                            这个函数前三个参数和getopt一样，不解释了。我们来看看后面两个参数。
                                          </div>
                                          
                                          <div>
                                            getopt_long的长选项是一个结构体，定义如下:
                                          </div>
                                          
                                          <p>
                                            <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526826Y0Ny.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=4788c644-deda-402c-9d54-c8b50537979d&n=26833883_1337526826Y0Ny.png&ext=png" alt="" /></a><br /> <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526848iHkr.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=bddbf760-90e4-4313-b9c4-f8749ad19fbe&n=26833883_1337526848iHkr.png&ext=png" alt="" /></a>
                                          </p>
                                          
                                          <div>
                                            参数longindex不为空时，存放的是getopt_long处理当前长选项的索引值。
                                          </div>
                                          
                                          <div>
                                          </div>
                                          
                                          <div>
                                            <p>
                                              案例六:
                                            </p>
                                            
                                            <div>
                                              <ol>
                                                <li>
                                                  <pre class="lang:c decode:true ">#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
#include &lt;getopt.h&gt;
int main(int argc,char *argv[])
{
    int flag_value = 100;
    while(1)
    {
        int option_index = 0;
        int rvalue = 0;
        static struct option long_option[] = {
            {"help0",no_argument,0,0},
            {"help1",required_argument,0,0},
            {"help2",optional_argument,0,0},
            {"help3",no_argument,0,10},
            {0,0,0,0},
        };
        long_option[3].flag = &flag_value;
        rvalue = getopt_long(argc,argv,"a:bc::",long_option,&option_index);
        if(rvalue == -1)
        {
            printf("No more argument.\n");
            return -1;
        }
        switch(option_index)
        {
        case 0:
            printf("Long option is : %s\n",long_option[option_index].name);
            break;
        case 1:
            printf("Long option is : %s ",long_option[option_index].name);
            if(optarg)
            {
                printf("with parm '%s'",optarg);
            }
            printf("\n");
            break;
        case 2:
            printf("Long option is : %s ",long_option[option_index].name);
            if(optarg)
            {
                printf("with parm '%s'",optarg);
            }
            printf("\n");
            break;
        case 3:
            printf("Long option is : %s\n",long_option[option_index].name);
            break;
        }
        printf("flag_value = %d\n",flag_value);
    }
    return 0;
}</pre>
                                                  
                                                  <p>
                                                    &nbsp;</li> </ol> </div> 
                                                    
                                                    <p>
                                                      运行结果：
                                                    </p>
                                                    
                                                    <p>
                                                      <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526922IiY2.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=eeed00f5-f0fe-4441-8cae-196af0abe73d&n=26833883_1337526922IiY2.png&ext=png" alt="" /></a>
                                                    </p>
                                                    
                                                    <p>
                                                      三、getopt_long_only函数
                                                    </p>
                                                    
                                                    <p>
                                                      <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_13375269502qqp.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=aa5692ae-dfa9-4ffb-9feb-d74c50616a73&n=26833883_13375269502qqp.png&ext=png" alt="" /></a><br /> <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337526976l7vv.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=577129ce-6c34-4f6b-b3b9-e960116757f5&n=26833883_1337526976l7vv.png&ext=png" alt="" /></a>
                                                    </p>
                                                    
                                                    <p>
                                                      案例:
                                                    </p>
                                                    
                                                    <div>
                                                      <ol>
                                                        <li>
                                                          <pre class="lang:c decode:true">#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
#include &lt;getopt.h&gt;
int main(int argc,char *argv[])
{
    int flag_value = 100;
    while(1)
    {
        int option_index = 0;
        int rvalue = 0;
        static struct option long_option[] = {
            {"help0",no_argument,0,0},
            {"help1",required_argument,0,0},
            {"help2",optional_argument,0,0},
            {"help3",no_argument,0,10},
            {0,0,0,0},
        };
        long_option[3].flag = &flag_value;
        rvalue = getopt_long_only(argc,argv,"a:bc::",long_option,&option_index);
        if(rvalue == -1)
        {
            printf("No more argument.\n");
            return -1;
        }
        switch(option_index)
        {
        case 0:
            printf("Long option is : %s\n",long_option[option_index].name);
            break;
        case 1:
            printf("Long option is : %s ",long_option[option_index].name);
            if(optarg)
            {
                printf("with parm '%s'",optarg);
            }
            printf("\n");
            break;
        case 2:
            printf("Long option is : %s ",long_option[option_index].name);
            if(optarg)
            {
                printf("with parm '%s'",optarg);
            }
            printf("\n");
            break;
        case 3:
            printf("Long option is : %s\n",long_option[option_index].name);
            break;
        }
        printf("flag_value = %d\n",flag_value);
    }
    return 0;
}</pre>
                                                          
                                                          <p>
                                                            &nbsp;</li> </ol> </div> 
                                                            
                                                            <p>
                                                              运行结果：
                                                            </p>
                                                            
                                                            <p>
                                                              <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337527059HQkS.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=779d825e-bea2-4de1-9563-d18e6671053b&n=26833883_1337527059HQkS.png&ext=png" alt="" /></a>
                                                            </p>
                                                            
                                                            <p>
                                                              注意：getopt_long和getopt_long_only的返回值
                                                            </p>
                                                            
                                                            <p>
                                                              <a class="evt" href="http://blog.chinaunix.net/attachment/201205/20/26833883_1337527087i1XX.png" target="_blank"><img src="http://mail.gsymy.com/attachment/downloadex?e=wordpress%40gsymy.com&o=1&et=normal&m=2_0%3ADzzzzye7hPs%24----3XZGQex&f=19c38a3c-d577-4086-8152-542a97093e78&n=26833883_1337527087i1XX.png&ext=png" alt="" /></a>
                                                            </p></div> </div> </div> </div> </div> 
                                                            
                                                            <p>
                                                              原文链接:<a href="http://blog.chinaunix.net/uid-26833883-id-3215592.html#" target="_blank">http://blog.chinaunix.net/uid-26833883-id-3215592.html#</a>
                                                            </p>

 [1]: http://blog.chinaunix.net/attachment/201205/20/26833883_1337526381qRMV.png