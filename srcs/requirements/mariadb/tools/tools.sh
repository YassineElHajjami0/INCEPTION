#!/bin/bash

mysqld_safe &

while ! mysqladmin ping --silent; do
    sleep 1
    echo "Waiting for MySQL to be ready..."
done

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > /tmp/queries.sql
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> /tmp/queries.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> /tmp/queries.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> /tmp/queries.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' with grant option;" >> /tmp/queries.sql
echo "FLUSH PRIVILEGES;" >> /tmp/queries.sql

cat /tmp/queries.sql

mysql -u root -p"$SQL_ROOT_PASSWORD" < /tmp/queries.sql

mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

mysqld_safe
