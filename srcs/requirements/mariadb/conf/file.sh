#!/bin/sh
service mariadb start

sed -i 's/127.0.0.1/0.0.0.0/g' etc/mysql/mariadb.conf.d/50-server.cnf
echo "create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';" | mariadb
echo "create database $MYSQL_DB;" | mariadb
echo "grant all privileges on $MYSQL_DB.* to $MYSQL_USER;" | mariadb

service mariadb stop
mysqld
