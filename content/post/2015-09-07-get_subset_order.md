---
title: 集合算法题
author: admin
layout: post
date: 2015-09-07T12:27:05+00:00
url: /2015/09/07/get_subset_order.html
duoshuo_thread_id:
  - 1314126401913225255
categories:
  - 程序设计
  - 算法

---
有点意思的集合算法题；不是特别简单，也不是特别复杂，想做好还得好好想想。

<pre class="lang:default decode:true  ">已知现在有若干组集合,集合的元素由字符串构成

set1 = {"abc","bcd",...};

...

setn = {...}

1. 求所有集合的并集UnionSet
2. 将集合UnionSet中元素顺序进行编号，求出每个子集中元素的编号；
3. 选取Unionset中任意个元素，组成新的集合，求原有子集中哪些是新集合的子集(2015-09-08补充)

编程对于给定的集合以最小的时间代价完成1和2
</pre>

我先说一下我的想法

我说一下我的想法；

1. 用map来做并集是思路是可行的。但是用std::map效率不高，还有很大空间。

数据量稍微一大，std::map的插入会变慢；据说std::map是基于平衡树的，效率是O( log(N) )

的，所以用hashmap的话效率会高于std::map，那么这里就要用一个效率比较高的

hashmap 。关于hash算法的探究也算是一个话题；

2. 将std::string放入map之后效率也会降低，直接用char*

3. 题目2中没有要求集合元素是有序的，而用std::map完成之后是有序的；这不是重点。

重点是集合中顺序，如果已经有序了，可以将每个子集里的元素指针做二分查找(如果用char*的话）算是比较快的一种方法；如果是无序的需要做循环遍历；这都不是很好的方法。

我能想到更好的方法是在题目1，插入数据时，将数据所在子集的指针作为最终并集中元素的一个成员变量（链表），这样最终产生并集后:

<pre class="lang:default decode:true">idx = 0
for (element in unionset)
{
   for (setPtr in element.setPtrsList)
    {     
          setPtr.subsetPtr[setPtr.elementIdx].idx = idx
     }
     idx++
}

setPtr.subsetPtr 子集指针；
subsetPtr[element].idx 是题目要求的结果;是子集中元素在UnionSet中的索引顺序
setPtr.elementIdx 是元素在子集中的索引，可以保存在setPtrsList中
IndexOf(element) = setPtr.
</pre>

就是利用数据元素下标来处理；

&nbsp;