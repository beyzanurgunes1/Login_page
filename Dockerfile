FROM ubuntu:20.04

RUN apt-get update && \
       apt-get install -y --no-install-recommends apt-utils && \
       apt-get -y install sudo


## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

## preesed tzdata, update package index, upgrade packages and install needed software
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/Europe select Istanbul" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata
RUN sudo apt-get install apache2 -y
RUN sudo apt-get install mysql-server -y


RUN sudo apt-get install php libapache2-mod-php -y

EXPOSE 9000:80
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

WORKDIR /var/www/html

COPY  . .

CMD apachectl -D FOREGROUND


