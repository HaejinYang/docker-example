## app
FROM php:8.2-fpm-alpine as app

# 기본 WORKDIR: /var/www/html

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions pdo pdo_mysql

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./app/composer.* ./

# Composer로 모듈 설치시, --no-dev 옵션에 의하여 dev 의존성을 지닌 모듈이 설치되지 않는다.
# 이때, Laravel의 env가 production이 아니라면, dev 의존성을 필요로 하기에, 필요한 모듈이 설치되지 않을 수 있다.
ENV APP_ENV=local
RUN composer install --prefer-dist \
    $(if [ "$APP_ENV" = "production" ]; then echo "--no-dev"; fi) \
    --no-scripts --no-progress --no-interaction

COPY ./app .

RUN composer dump-autoload --optimize

## app_dev
FROM app as app_dev

RUN install-php-extensions xdebug 

COPY ./php/conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini