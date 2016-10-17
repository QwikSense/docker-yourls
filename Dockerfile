FROM mitcdh/caddy-php:php7
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    php7-pdo_mysql && \
    rm -rf /var/cache/apk/*

COPY files/yourls-vol.sh /caddy-bootstrap/pre-run/01_yourls-vol
COPY files/yourls-config.sh /caddy-bootstrap/pre-run/02_yourls-config

COPY files/Caddyfile /caddy-bootstrap/Caddyfile
COPY files/yourls-install.sh /www/yourls-install.sh

RUN chmod 500 /caddy-bootstrap/pre-run/* \
 && chown www-data:www-data /www/public

VOLUME /www/public/user
EXPOSE 2015
