FROM php:8.1.2-apache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    locales apt-utils git libicu-dev g++ unzip libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev ca-certificates apt-transport-https nano

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN docker-php-ext-configure \
        intl \
    &&  docker-php-ext-install \
        pdo pdo_mysql opcache intl zip dom mbstring gd xsl

# ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf



CMD tail -f /dev/null

WORKDIR /var/www/html/