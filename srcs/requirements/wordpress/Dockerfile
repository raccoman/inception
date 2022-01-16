FROM alpine:3.13

RUN apk add --update php7-fpm php7-common php7-mysqli php7-pdo php7-pdo_mysql
RUN apk add --update wget tar
RUN rm -rf /var/cache/apk/*

# php config
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# default website
COPY conf/index.html /tmp/index.html
COPY conf/index.php /tmp/index.php
COPY conf/wp-config.php /tmp/wp-config.php

# wordpress
RUN wget -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz

COPY tools/configure.sh configure.sh
ENTRYPOINT [ "sh", "configure.sh" ]