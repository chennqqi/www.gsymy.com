---
type: "post"
draft: false
author: "admin"
date: "2020-04-05T11:31:30+08:00"
title: "acid"
description: "description"
keywords: ["acid", "distributed", "database" ]
topics: ["database"]
tags: [ "acid" ]
url: "/2020/04/04/distributed-acid.html"
description: "老骥伏枥，从头学起"
---


## ACID

ACID原则是数据库事务正常执行的四个，分别指原子性、一致性、独立性及持久性

- 原子性(Atomicity):
	原子性是指事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生
- 一致性(Consistency):
	事务的运行不改变数据库中的一致性。
- 隔离性(Isolation):
	是指两个以上的事务不会出现交错执行的状态。因为这样可能会导致数据不一致。
- 持久性(Durability): 
	事物提交执行后不会丢失，对数据库的修改是永久的，不受故障影响