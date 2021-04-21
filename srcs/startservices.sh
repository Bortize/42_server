#!/bin/bash
/etc/init.d/php7.3-fpm start
ln -s /etc/nginx/sites-available/${autoindex} /etc/nginx/sites-enabled/
service nginx start
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
# Se queda el proceso corriendo en el background. Hace que no se cierre el contenedor
tail -f /var/log/nginx/*.log
