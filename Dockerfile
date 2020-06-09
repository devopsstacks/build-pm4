# Base Image
FROM circleci/php:7.2.8-fpm-node-browsers

# Maintainer
LABEL maintainer="devops@processmaker.com"

LABEL processmaker-stack="build-pm4"

RUN sudo apt-get update && sudo apt install -y libpng-dev libzip-dev default-libmysqlclient-dev curl apt-transport-https
RUN sudo docker-php-ext-install gd zip pdo_mysql mysqli
RUN sudo apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN sudo docker-php-ext-install -j$(nproc) iconv
RUN sudo docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN sudo docker-php-ext-install -j$(nproc) gd
RUN sudo docker-php-ext-install -j$(nproc) pcntl
RUN sudo docker-php-ext-install -j$(nproc) exif
RUN sudo docker-php-ext-install -j$(nproc) bcmath