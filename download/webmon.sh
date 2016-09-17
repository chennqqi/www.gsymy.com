#!/bin/bash
#author:Pomelo Lee
#website:http://www.111cn.net
CheckUrl="http://www.gsymy.com/200test.php"
STATUS_CODE=`curl -o /dev/null -m 10 --connect-timeout 10 -s -w %{http_code} $CheckUrl`
#echo "$CheckURL Status Code:t$STATUS_CODE"
#echo "Status Code:$STATUS_CODE"
if [ "$STATUS_CODE" != "200" ]; then
/usr/sbin/php-fpm stop
sleep 1
/usr/sbin/php-fpm start
sleep 1
pkill -9 nginx
sleep 1
/usr/sbin/nginx
#sleep 1
#/usr/local/tomcat7/bin/shutdown.sh
#sleep 2
#/usr/local/tomcat7/bin/startup.sh
fi 
