# imagen base
FROM debian:buster
# Name and email of the person who maintains the file
MAINTAINER	Bortize	bgomez-r@student.42madrid.com
# Establece una ruta tempral en el contenedor
#WORKDIR /tmp
# Updating ubuntu and installing other necessary software
RUN apt-get update -y \
	&& apt-get upgrade -y nginx
# PHP
RUN apt install php7.3 -y
#SSL
#WORDPRESS
#ADD https://wordpress.org/latest.tar.gz /tmp/
#MYSQL
#RUN apt-get install mariadb-server -y >> ./container.build.log
#PHPMYADMIN
#ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz /tmp/
# Set command to bash

CMD ["/bin/bash"]
