---
title: Visualstudio 编译不能打开pch文件 | vs2010,visualstudio,pch,预处理
author: admin
layout: post
date: 2015-12-30T10:38:43+00:00
url: /2015/12/30/visualstudio-pch.html
duoshuo_thread_id:
  - 6234024673139491585
wsw-settings:
  - 'a:48:{s:13:"keyword_value";s:33:"vs2010,visualstudio,pch,预处理";s:15:"is_meta_keyword";s:1:"1";s:17:"meta_keyword_type";s:8:"keywords";s:13:"is_meta_title";s:0:"";s:10:"meta_title";s:0:"";s:19:"is_meta_description";s:0:"";s:21:"is_meta_robot_noindex";s:0:"";s:22:"is_meta_robot_nofollow";s:0:"";s:19:"is_meta_robot_noodp";s:0:"";s:20:"is_meta_robot_noydir";s:0:"";s:16:"meta_description";s:0:"";s:17:"is_over_sentences";s:0:"";s:20:"first_over_sentences";s:0:"";s:19:"last_over_sentences";s:0:"";s:16:"is_rich_snippets";s:0:"";s:18:"show_rich_snippets";s:0:"";s:12:"rating_value";s:1:"0";s:13:"review_author";s:0:"";s:14:"review_summary";s:0:"";s:18:"review_description";s:0:"";s:10:"event_name";s:0:"";s:10:"event_date";s:0:"";s:9:"event_url";s:0:"";s:19:"event_location_name";s:0:"";s:21:"event_location_street";s:0:"";s:23:"event_location_locality";s:0:"";s:21:"event_location_region";s:0:"";s:12:"people_fname";s:0:"";s:12:"people_lname";s:0:"";s:15:"people_locality";s:0:"";s:13:"people_region";s:0:"";s:12:"people_title";s:0:"";s:14:"people_homeurl";s:0:"";s:15:"people_photourl";s:0:"";s:12:"product_name";s:0:"";s:16:"product_imageurl";s:0:"";s:19:"product_description";s:0:"";s:14:"product_offers";s:0:"";s:18:"is_social_facebook";s:0:"";s:25:"social_facebook_publisher";s:0:"";s:22:"social_facebook_author";s:0:"";s:21:"social_facebook_title";s:0:"";s:27:"social_facebook_description";s:0:"";s:17:"is_social_twitter";s:0:"";s:20:"social_twitter_title";s:0:"";s:26:"social_twitter_description";s:0:"";s:15:"autolink_anchor";s:0:"";s:19:"is_disable_autolink";s:0:"";}'
categories:
  - windows开发

---
<a href="http://www.gsymy.com/wp-content/uploads/2015/12/a8773912b31bb051b9d04542307adab44bede0e0.jpg" rel="attachment wp-att-539"><img class="alignnone size-full wp-image-539" src="http://www.gsymy.com/wp-content/uploads/2015/12/a8773912b31bb051b9d04542307adab44bede0e0.jpg" alt="a8773912b31bb051b9d04542307adab44bede0e0" width="600" height="300" /></a>

pch<span style="font-family: 微软雅黑;">文件是</span>vs<span style="font-family: 微软雅黑;">生成的预编译文件，用来加速编译的。</span>pch<span style="font-family: 微软雅黑;">文件通常是由</span>std<span style="font-family: 微软雅黑;">afx.cpp文件生成的。</span>

<span style="font-family: 微软雅黑;">如果你删除了这个文件而又实用了预编译选项则会报标题中的错误<br /> </span>

Can&#8217;t open xxxx.pch

<span style="font-family: 微软雅黑;">解决步骤</span>:

<div style="margin-left: 24pt;">
  <table style="border-collapse: collapse;" border="0">
    <colgroup> <col style="width: 529px;" /> <col style="width: 131px;" /></colgroup> <tr>
      <td style="border: solid #a3a3a3 1.0pt; padding: 7px;">
        <ul>
          <li>
            <span style="font-family: 微软雅黑;">工程属性</span>->C/C++<span style="font-family: 微软雅黑;">预处理</span>-><span style="font-family: 微软雅黑;">预处理头</span><br /> <span style="font-family: 微软雅黑;">选择</span>
          </li>
        </ul>
      </td>
      
      <td style="border-top: solid #a3a3a3 1.0pt; border-left: none; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <span style="font-family: 微软雅黑;">使用</span> Use/Yu
      </td>
    </tr>
    
    <tr>
      <td style="border-top: none; border-left: solid #a3a3a3 1.0pt; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <ul>
          <li>
            <span style="font-family: 微软雅黑;">右键工程中的</span>stdafx.cpp<span style="font-family: 微软雅黑;">属性</span>->C/C++<span style="font-family: 微软雅黑;">预处理</span>-><span style="font-family: 微软雅黑;">预处理头</span>
          </li>
        </ul>
      </td>
      
      <td style="border-top: none; border-left: none; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <span style="font-family: 微软雅黑;">创建</span> Create/Yc
      </td>
    </tr>
    
    <tr>
      <td style="border-top: none; border-left: solid #a3a3a3 1.0pt; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <ul>
          <li>
            <span style="font-family: 微软雅黑;">右键编译stdafx.cpp</span>
          </li>
        </ul>
      </td>
      
      <td style="border-top: none; border-left: none; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <span style="font-family: 微软雅黑;"> </span>
      </td>
    </tr>
    
    <tr>
      <td style="border-top: none; border-left: solid #a3a3a3 1.0pt; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <ul>
          <li>
            <span style="font-family: 微软雅黑;">此时再编译工程就OK了。</span>
          </li>
        </ul>
      </td>
      
      <td style="border-top: none; border-left: none; border-bottom: solid #a3a3a3 1.0pt; border-right: solid #a3a3a3 1.0pt; padding: 7px;">
        <span style="font-family: 微软雅黑;"> </span>
      </td>
    </tr>
  </table>
</div>

<span style="font-family: 微软雅黑;"><br /> </span>