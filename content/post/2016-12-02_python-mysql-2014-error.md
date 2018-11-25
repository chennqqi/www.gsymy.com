+++
author = "admin"
date = "2016-12-01T21:20:40+08:00"
description = "Error 2014: Commands out of sync; you can't run this command now"
keywords = ["mysql error", "python", "mysql 2014 error"]
tags = ["python", "error", "mysql"]
title = "python mysql 2014 error"
topics = ["python"]
url = "/2016/12/02/python-mysql-2014-error.html"
type = "post"

+++


###python mysqlDB批量插入数据时报错

python MySQLdb module error code:
 
`Error 2014: Commands out of sync; you can't run this command now`


This happened when excute mysql batch operation.
Solution:

Every mysql option done, then call `commit()`

Using `executemany` funcion is recommand.

	list = []
	sql = 'INSERT INTO tablexxx(a,b,c) VALUES(%s,%s,%s)'
	for l in ll:
		list.append(l)
	db.executemany(sql, list)#db.fetchmany() ...
	db.commit()
 