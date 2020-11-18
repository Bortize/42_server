rm /etc/nginx/sites-enabled/localhost.conf
ln -s /etc/nginx/sites-available/autoindex_localhost.conf /etc/nginx/sites-enabled/
mv /var/www/html/index.html /tmp
service nginx restart
