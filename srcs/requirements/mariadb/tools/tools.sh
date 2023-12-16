#!/bin/bash

# Start MySQL in the background
mysqld_safe &

# Wait for MySQL to be ready
while ! mysqladmin ping --silent; do
    sleep 1
    echo "Waiting for MySQL to be ready..."
done

# Create SQL script file
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > /tmp/file.sql
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> /tmp/file.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> /tmp/file.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> /tmp/file.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' with grant option;" >> /tmp/file.sql
echo "FLUSH PRIVILEGES;" >> /tmp/file.sql

# Print the content of the SQL script for debugging
echo "SQL Script:"
cat /tmp/file.sql

# Execute the SQL script
echo "Executing SQL script..."
mysql -u root -p"$SQL_ROOT_PASSWORD" < /tmp/file.sql

# Shutdown MySQL
echo "Shutting down MySQL..."
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

# Start MySQL again
echo "Starting MySQL again..."
mysqld_safe
