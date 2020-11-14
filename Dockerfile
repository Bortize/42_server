# Base image
FROM debian:buster
# Sets a specific path for the prompt
WORKDIR /tmp
# Updating ubuntu and installing other necessary software
RUN apt update
RUN apt upgrade -y
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
#SSL
ADD https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 .
RUN chmod +x mkcert-v1.4.1-linux-amd64 && ./mkcert-v1.4.1-linux-amd64 -install && ./mkcert-v1.4.1-linux-amd64 localhost
#WORDPRESS
#ADD https://wordpress.org/latest.tar.gz /tmp/
#MYSQL
#RUN apt-get install mariadb-server -y >> ./container.build.log
#PHPMYADMIN
#ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz /tmp/
# Set command to bash
EXPOSE 80

CMD service nginx start \
	&& service php7.3-fpm start \
	&& sleep infinity
# container_build.log
# localhost-key.pem
# localhost.pem
# mkcert-v1.4.1-linux-amd64
# phpMyAdmin-5.0.2-english.tar.gz
# startservices.sh
