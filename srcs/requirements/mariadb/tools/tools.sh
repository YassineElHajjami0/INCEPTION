#!/bin/sh
/etc/init.d/mariadb start
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"
mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Update root user password
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

# Shutdown MariaDB gracefully
# mysql -u root -p"$SQL_ROOT_PASSWORD" --socket=/run/mysqld/mysqld.sock
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

# Start mysqld in the foreground to keep the container running
exec mysqld
#mariadb % docker run -it --env-file=.env mariadb bash