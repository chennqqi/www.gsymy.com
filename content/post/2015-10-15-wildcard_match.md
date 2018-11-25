---
title: C语言通配符匹配
author: admin
layout: post
date: 2015-10-15T03:52:16+00:00
url: /2015/10/15/wildcard_match.html
duoshuo_thread_id:
  - 6205718948009624321
categories:
  - 程序设计

---
<span style="color: black; font-size: 10pt;">C语言通配符匹配<br /> </span>

<span style="color: black; font-size: 10pt;">工作中经常会遇到通配符，windows控制台程序，linux shell，还有web服务器配置路径，Makefile中。<br /> </span>

<span style="color: black; font-size: 10pt;">我来分享两个C语言通配符匹配程序和测试程序；我是抱着拿来主义的想法，年纪大了越越懒得动脑子了。<br /> </span>

<span style="color: black; font-size: 10pt;"><br /> </span>

<span style="color: black; font-size: 10pt;">通配符程序中用到的是*和?<br /> </span>

<span style="color: black; font-size: 10pt;">*表示任意多个任意字符<br /> </span>

<span style="color: black; font-size: 10pt;">?表示单个任意字符<br /> </span>

<span style="color: black; font-size: 10pt;">关于通配符的定义引用<a href="http://baike.baidu.com/link?url=Zm-Yxz0MNIZippSBAKlT6vPYOTjAjKo2NKBGDCODoVLcQ7KbJjHFThn9oEtoRItECCpcYiH99KMdPzlWNGVuK" target="_blank">百度百科</a>的一段话<br /> </span>

<span style="color: black; font-size: 10pt;">通配符是一种特殊语句，主要有星号(*)和问号(?)，用来模糊搜索文件。当查找文件夹时，可以使用它来代替一个或多个真正<a href="http://baike.baidu.com/view/263416.htm"><span style="background-color: white;">字符</span></a>；当不知道真正字符或者懒得输入完整名字时，常常使用通配符代替一个或多个真正的字符。 实际上用&#8221;*Not?paOd&#8221;可以对应Notpad\MyNotpad【*可以代表任何文字】;Notpad\Notepad【?仅代表单个字】;Notepad\Notepod【ao代表a与o里二选一】，其余以此类推。<br /> </span>

第一个程序是商业友好的license，请放心使用！

<span style="color: #f29100; font-family: Segoe UI; font-size: 22pt;"><span style="background-color: white;">License</span><br /> </span>

<span style="color: #111111; font-family: Segoe UI; font-size: 10pt;">This article has no explicit license attached to it but may contain usage terms in the article text or the download files themselves. If in doubt please contact the author via the discussion board below.<br /> </span>

<span style="color: #111111; font-family: Segoe UI; font-size: 10pt;">A list of licenses authors might use can be found <a href="http://www.codeproject.com/info/Licenses.aspx">here</a><span style="color: black;"><br /> </span></span>

第二个没有明确标明。

&nbsp;

<span style="color: black; font-size: 10pt;">两个程序是类似的，第一个程序用的是循环，第二个程序用的是递归。<span style="font-family: 宋体;"><br /> </span></span>

<pre class="EnlighterJSRAW" data-enlighter-language="null">static int wildcmp(const char* wild, const char* pattern)
{
  // Written by Jack Handy - &lt;A href="mailto:jakkhandy@hotmail.com"&gt;jakkhandy@hotmail.com&lt;/A&gt;
  const char *cp = NULL, *mp = NULL;

  while ((*pattern) && (*wild != '*')) 
  {
    if ((*wild != *pattern) && (*wild != '?')) 
    {
      return 0;
    }
    wild++;
    pattern++;
  }

  while (*pattern) 
  {
    if (*wild == '*') 
    {
      if (!*++wild) 
      {
        return 1;
      }
      mp = wild;
      cp = pattern + 1;
    }
    else if ((*wild == *pattern) || (*wild == '?')) 
    {
      wild++;
      pattern++;
    }
    else
    {
      wild = mp;
      pattern = cp++;
    }
  }

  while (*wild == '*') 
  {
    wild++;
  }
  return !*wild;
}


// The main function that checks if two given strings match. The first
// string may contain wildcard characters
static bool match(const char *first,  const char* second)
{
  // If we reach at the end of both strings, we are done
  if (*first == '\0' && *second == '\0')
    return true;

  // Make sure that the characters after '*' are present in second string.
  // This function assumes that the first string will not contain two
  // consecutive '*' 
  if (*first == '*' && *(first + 1) != '\0' && *second == '\0')
    return false;

  // If the first string contains '?', or current characters of both 
  // strings match
  if (*first == '?' || *first == *second)
    return match(first + 1, second + 1);

  // If there is *, then there are two possibilities
  // a) We consider current character of second string
  // b) We ignore current character of second string.
  if (*first == '*')
    return match(first + 1, second) || match(first, second + 1);
  return false;
}

// A function to run test cases
static void test(const char* first, const char* second)
{
  match(first, second) ? puts("Yes") : puts("No");
}

static void test2(const char* first, const char* second)
{
  wildcmp(first, second) ? puts("Yes") : puts("No");
}

int _tmain(int argc, _TCHAR* argv[])
{
  test("g*ks", "geeks"); // Yes
  test("ge?ks*", "geeksforgeeks"); // Yes
  test("g*k", "gee");  // No because 'k' is not in second
  test("*pqrs", "pqrst"); // No because 't' is not in first
  test("abc*bcd", "abcdhghgbcd"); // Yes
  test("abc*c?d", "abcd"); // No because second must have 2 instances of 'c'
  test("*c*d", "abcd"); // Yes
  test("*?c*d", "abcd"); // Yes

  puts("==================================\n");

  test2("g*ks", "geeks"); // Yes
  test2("ge?ks*", "geeksforgeeks"); // Yes
  test2("g*k", "gee");  // No because 'k' is not in second
  test2("*pqrs", "pqrst"); // No because 't' is not in first
  test2("abc*bcd", "abcdhghgbcd"); // Yes
  test2("abc*c?d", "abcd"); // No because second must have 2 instances of 'c'
  test2("*c*d", "abcd"); // Yes
  test2("*?c*d", "abcd"); // Yes

  return 0;
}
</pre>

测试结果:

<!--StartFragment -->

<div>
  <img src="file:///C:\Users\chenqi-s\AppData\Roaming\Tencent\Users\332911480\QQ\WinTemp\RichOle\H{USPRL8631(K1V8N@}9BZX.jpg" alt="" />
</div>

[<img class="alignnone size-full wp-image-472" src="http://www.gsymy.com/wp-content/uploads/2015/10/test.jpg" alt="test" width="843" height="551" />][1]

&nbsp;

<span style="color: black; font-size: 10pt;">参考链接：<span style="font-family: 宋体;"><br /> </span></span>

[<span style="font-size: 10pt;">http://www.codeproject.com/Articles/1088/Wildcard-string-compare-globbing</span>][2]<span style="color: black; font-size: 10pt;"><br /> </span>

[<span style="font-size: 10pt;">http://www.geeksforgeeks.org/wildcard-character-matching/#</span>][3]<span style="color: black; font-size: 10pt;"><br /> </span>

 [1]: http://www.gsymy.com/wp-content/uploads/2015/10/test.jpg
 [2]: http://www.codeproject.com/Articles/1088/Wildcard-string-compare-globbing
 [3]: http://www.geeksforgeeks.org/wildcard-character-matching/