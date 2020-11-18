rm /etc/nginx/sites-enabled/autoindex_localhost.conf
ln -s /etc/nginx/sites-available/localhost.conf /etc/nginx/sites-enabled/
mv /tmp/index.html /var/www/html/
service nginx restart
