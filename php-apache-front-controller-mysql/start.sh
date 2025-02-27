#!/bin/bash
env_file="./.env"
if [ -r "$env_file" ]; then
    source "$env_file"
    echo "$env_file file was sourced successfully."
else
    echo "$env_file file does not exist."
fi

# php ini 파일을 실행 모드에 맞게 관리한다.
if [ "$APP_MODE" = "production" ]; then
    echo "run production"
    rm -f /usr/local/etc/php/conf.d/development.ini
    rm -f /usr/local/etc/php/conf.d/release.ini
elif [ "$APP_MODE" = "release" ]; then
    echo "run release"
    rm -f /usr/local/etc/php/conf.d/development.ini
    rm -f /usr/local/etc/php/conf.d/production.ini
elif [ "$APP_MODE" = "development" ]; then
    echo "run development"
    rm -f /usr/local/etc/php/conf.d/release.ini
    rm -f /usr/local/etc/php/conf.d/production.ini
else
    echo "invalid case : $APP_MODE"
fi

# cron
service cron start