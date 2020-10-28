# imagen base
FROM debian:buster
# Name and email of the person who maintains the file
MAINTAINER	Bortize	bgomez-r@student.42madrid.com
# Set working directory as "/"
WORKDIR /tmp
# Updating ubuntu and installing other necessary software
RUN apt-get update --yes \
	&& apt-get upgrade --yes nginx
# Set command to bash
CMD ["/bin/bash"]
