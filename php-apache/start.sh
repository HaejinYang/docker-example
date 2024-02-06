if [ "$APP_ENV" = "production" ]; then
    rm -f /usr/local/etc/php/conf.d/development.ini
    rm -f /usr/local/etc/php/conf.d/release.ini
elif [ "$APP_ENV" = "release" ]; then
    rm -f /usr/local/etc/php/conf.d/development.ini
    rm -f /usr/local/etc/php/conf.d/production.ini
else
    rm -f /usr/local/etc/php/conf.d/release.ini
    rm -f /usr/local/etc/php/conf.d/production.ini
fi

# cron
service cron start