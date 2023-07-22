#!/bin/sh
service mysql start

sed -i 's/127.0.0.1/0.0.0.0/g' etc/mysql/mariadb.conf.d/50-server.cnf
echo "create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';" | mysql
echo "create database $MYSQL_DB;" | mysql
echo "grant all privileges on $MYSQL_DB.* to $MYSQL_USER;" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
kill `cat /var/run/mysqld/mysqld.pid`
service mysql stop
mysqld
