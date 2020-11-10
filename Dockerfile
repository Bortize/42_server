# imagen base
FROM debian:buster
# Name and email of the person who maintains the file
LABEL	Bortize	bgomez-r@student.42madrid.com
# Establece una ruta tempral en el contenedor
WORKDIR /tmp
# Updating ubuntu and installing other necessary software
RUN apt update

RUN apt install -y nginx
# PHP
RUN apt install php -y
#SSL
ADD https://github.com/FiloSottile/mkcert/releases/download/v1.4.2/mkcert-v1.4.2-darwin-amd64 .
RUN chmod +x mkcert-v1.4.2-darwin-amd64 \
	&& mkcert-v1.4.2-darwin-amd64 install \
	&& mkcert-v1.4.2-darwin-amd64 localhost
#WORDPRESS
#ADD https://wordpress.org/latest.tar.gz /tmp/
#MYSQL
#RUN apt-get install mariadb-server -y >> ./container.build.log
#PHPMYADMIN
#ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz /tmp/
# Set command to bash

CMD ["/bin/bash"]
# container_build.log
# localhost-key.pem
# localhost.pem
# mkcert-v1.4.1-linux-amd64
# phpMyAdmin-5.0.2-english.tar.gz
# startservices.sh
