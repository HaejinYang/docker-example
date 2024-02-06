FROM php:8.2.8-apache
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip \
    curl \
    libcurl4-openssl-dev \
    cron \
    logrotate

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install mysqli pdo pdo_mysql zip curl pcntl
RUN docker-php-ext-enable mysqli pdo pdo_mysql zip curl pcntl

# 컨테이너 안에서 사용할 설정 복사
COPY ./docker/cron.d /etc/cron.d
COPY ./docker/logrotate.d /etc/logrotate.d
COPY ./docker/php/conf.d /usr/local/etc/php/conf.d

# 퍼미션 변경
RUN chmod -R 644 /etc/cron.d
RUN chmod -R 644 /etc/logrotate.d

# 아파치 도큐먼트 루트 변경
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html

#docker-compose에서 apache를 포어그라운드로 실행함