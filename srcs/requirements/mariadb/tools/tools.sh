#!/bin/sh
/etc/init.d/mariadb start
sleep 5

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > /tmp/file.sql
echo "CREATE USER IF NOT EXISTS $SQL_USER@localhost IDENTIFIED BY $SQL_PASSWORD;" >> /tmp/file.sql
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > /tmp/file.sql
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > tmp/file.sql
echo "CREATE USER IF NOT EXISTS $SQL_USER@localhost IDENTIFIED BY $SQL_PASSWORD;"
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USE@% IDENTIFIED BY $SQL_PASSWORD;"
mysql -e "FLUSH PRIVILEGES;"

# Update root user password
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

# Shutdown MariaDB gracefully
# mysql -u root -p"$SQL_ROOT_PASSWORD" --socket=/run/mysqld/mysqld.sock
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

# Start mysqld in the foreground to keep the container running
exec mysqld
#mariadb % docker run -it --env-file=.env mariadb bash