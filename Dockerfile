FROM php:8.1.2-apache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
    &&  apt-get install -y --no-install-recommends \
        locales apt-utils git libpng-dev libxml2-dev libzip-dev unzip \
        apt-transport-https ca-certificates

RUN docker-php-ext-configure \
            intl \
    &&  docker-php-ext-install \
            pdo pdo_mysql opcache intl zip dom mbstring gd xsl

CMD tail -f /dev/null

WORKDIR /var/www/html/