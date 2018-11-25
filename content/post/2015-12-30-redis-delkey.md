---
title: Redis 删除所有键值 | redis,删除key,key
author: admin
layout: post
date: 2015-12-30T13:16:53+00:00
url: /2015/12/30/redis-delkey.html
wsw-settings:
  - 'a:48:{s:13:"keyword_value";s:19:"redis,删除key,key";s:15:"is_meta_keyword";s:1:"1";s:17:"meta_keyword_type";s:8:"keywords";s:13:"is_meta_title";s:1:"1";s:10:"meta_title";s:0:"";s:19:"is_meta_description";s:1:"1";s:21:"is_meta_robot_noindex";s:0:"";s:22:"is_meta_robot_nofollow";s:0:"";s:19:"is_meta_robot_noodp";s:0:"";s:20:"is_meta_robot_noydir";s:0:"";s:16:"meta_description";s:0:"";s:17:"is_over_sentences";s:0:"";s:20:"first_over_sentences";s:0:"";s:19:"last_over_sentences";s:0:"";s:16:"is_rich_snippets";s:0:"";s:18:"show_rich_snippets";s:0:"";s:12:"rating_value";s:1:"0";s:13:"review_author";s:0:"";s:14:"review_summary";s:0:"";s:18:"review_description";s:0:"";s:10:"event_name";s:0:"";s:10:"event_date";s:0:"";s:9:"event_url";s:0:"";s:19:"event_location_name";s:0:"";s:21:"event_location_street";s:0:"";s:23:"event_location_locality";s:0:"";s:21:"event_location_region";s:0:"";s:12:"people_fname";s:0:"";s:12:"people_lname";s:0:"";s:15:"people_locality";s:0:"";s:13:"people_region";s:0:"";s:12:"people_title";s:0:"";s:14:"people_homeurl";s:0:"";s:15:"people_photourl";s:0:"";s:12:"product_name";s:0:"";s:16:"product_imageurl";s:0:"";s:19:"product_description";s:0:"";s:14:"product_offers";s:0:"";s:18:"is_social_facebook";s:0:"";s:25:"social_facebook_publisher";s:0:"";s:22:"social_facebook_author";s:0:"";s:21:"social_facebook_title";s:0:"";s:27:"social_facebook_description";s:0:"";s:17:"is_social_twitter";s:0:"";s:20:"social_twitter_title";s:0:"";s:26:"social_twitter_description";s:0:"";s:15:"autolink_anchor";s:0:"";s:19:"is_disable_autolink";s:0:"";}'
duoshuo_thread_id:
  - 6234065434719552257
categories:
  - linux开发

---
![][1]

<span style="font-family: 微软雅黑;">使用命令方式删除所有</span>

<p style="margin-left: 27pt;">
  redis-cli KEYS &#8220;126.com*&#8221; | xargs redis-cli DEL
</p>

<span style="font-family: 微软雅黑;">使用</span>lua<span style="font-family: 微软雅黑;">方式</span>

<p style="margin-left: 27pt;">
  EVAL &#8220;return redis.call(&#8216;del&#8217;, unpack(redis.call(&#8216;keys&#8217;, ARGV[1])))&#8221; 0 *
</p>

 [1]: http://www.gsymy.com/wp-content/uploads/2015/12/123015_1045_Redis1.jpg