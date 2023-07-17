#!/bin/sh
service mariadb start

sed -i 's/127.0.0.1/0.0.0.0/g' etc/mysql/mariadb.conf.d/50-server.cnf
echo "create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';" | mariadb
echo "create database wordpress;" | mariadb
echo "grant all privileges on wordpress.* to mabdelba;" | mariadb

service mariadb stop
mysqld
