---
title: Project not selected to build for this solution configuration.
author: admin
layout: post
date: 2015-08-19T06:52:05+00:00
url: /2015/08/19/vsnotbuildbysolution.html
duoshuo_thread_id:
  - 1314126401913225234
categories:
  - windows开发
tags:
  - visualstudio
  - windows

---
# [Project not selected to build for this solution configuration.][1]{#cb_post_title_url.postTitle2} {.postTitle}

<div id="cnblogs_post_body">
  <h3 class="post-title entry-title">
    Project not selected to build for this solution configuration.
  </h3>
  
  <div class="post-header">
     
  </div>
  
  <div id="post-body-7943090463870159502" class="post-body entry-content">
    When you upgrade your older solution files to latest version of visual studio 2010 or 2012 you may get compilation output as &#8220;Project not selected to build for this solution configuration&#8221;, even though with the earlier version of visual studio these projects were building fine. In order to build required project you just have to modify the solution configuration. Steps below mention how to do it. 
    
    <ol>
      <li>
        Launch the Solution properties, by right clicking solution and select Properties.
      </li>
      <li>
        On solution properties dialog box, from configuration properties group select Configuration.
      </li>
      <li>
        For the projects which you are getting the error as above select the check box under Build column if not checked.
      </li>
      <li>
        Save configuration by pressing OK.
      </li>
    </ol>
    
    <p>
      Now your project being skipped should get built, while building the solution.
    </p>
  </div>
  
  <div class="post-body entry-content">
     
  </div>
  
  <div class="post-body entry-content">
     
  </div>
  
  <div class="post-body entry-content">
    visual studio 2012 can not build
  </div>
  
  <div class="post-body entry-content">
    not selected to build for this solution configuration
  </div>
  
  <div class="post-body entry-content">
    Project not selected to build for this solution
  </div>
  
  <div class="post-body entry-content">
    Project not selected to build for this
  </div>
  
  <div class="post-body entry-content">
    Project not selected to build for
  </div>
  
  <div class="post-body entry-content">
    Project not selected to build
  </div>
  
  <div class="post-body entry-content">
    build for this solution configuration
  </div>
  
  <div class="post-body entry-content">
    vs2012 can not build
  </div>
</div>

<!--more-->

  来源： _[Project not selected to build for this solution configuration. &#8211; 明月几时有25 &#8211; 博客园][1]_

 [1]: http://www.cnblogs.com/moonlight-zjb/p/3837762.html