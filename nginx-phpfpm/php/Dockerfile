FROM php:8.1-fpm-alpine as app

# 자주쓰이는 php extension installer,
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# exit on errors, unset variabes, print every command as it is exectued
RUN set -eux; \
  install-php-extensions pdo pdo_mysql;

#RUN docker-php-ext-install pdo pdo_mysql


ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer:2.4 /usr/bin/composer /usr/bin/composer

COPY ./app/composer.* ./

RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction

COPY ./app .

RUN composer dump-autoload --optimize

# dev image
# target-built를 위한 분리된 이미지 기반 스테이지
FROM app as app_dev

ENV XDEBUG_MODE=debug

COPY ./php/conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN set -eux; \
    install-php-extensions xdebug