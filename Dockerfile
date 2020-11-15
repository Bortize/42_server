# Base image
FROM debian:buster
# Sets a specific path for the prompt
WORKDIR /tmp
# Updating ubuntu and installing other necessary software
RUN apt update
# Instal VIM
RUN apt install vim -y
# Install NGINX
RUN apt install nginx -y
RUN rm /etc/nginx/sites-enabled/default
ADD ./srcs/localhost.conf /etc/nginx/sites-enabled/
# Install php and the extensions that wordpress needs
RUN apt install php7.3 \
	php7.3-cli \
	php7.3-common \
	php7.3-curl \
	php7.3-gd \
	php7.3-json \
	php7.3-mbstring \
	php7.3-mysql \
	php7.3-xml \
	php7.3-fpm -y
ADD ./srcs/php.ini /etc/php/7.3/cli/
ADD ./srcs/phpinfo.php /var/www/html/
ADD ./srcs/index.html /var/www/html/
# Install SSL
ADD https://github.com/FiloSottile/mkcert/releases/download/v1.4.2/mkcert-v1.4.2-linux-amd64 .
RUN chmod +x mkcert-v1.4.2-linux-amd64 \
	&& ./mkcert-v1.4.2-linux-amd64 -install \
	&& ./mkcert-v1.4.2-linux-amd64 localhost
#WORDPRESS
ADD https://wordpress.org/latest.tar.gz .
RUN tar xfp ./latest.tar.gz
RUN mv wordpress /var/www/html/
RUN rm ./latest.tar.gz
COPY ./srcs/wp-config.php /var/www/html/wordpress/
#MYSQL
RUN apt-get install mariadb-server -y
#PHPMYADMIN
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz .
RUN tar xfp phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english /var/www/html/phpmyadmin/
ADD ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
# Finis
RUN chown -R

EXPOSE 80

CMD service nginx start \
	&& service php7.3-fpm start \
	&& mysql start
#	&& sleep infinity
