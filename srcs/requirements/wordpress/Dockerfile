FROM alpine:3.13

RUN apk add --update php7-fpm
RUN rm -rf /var/cache/apk/*

# php config
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# default website
RUN mkdir -p /var/www/raccoman && touch /var/www/raccoman/index.php
RUN echo "<?php phpinfo(); ?>" >> /var/www/raccoman/index.php

# Start php
ENTRYPOINT ["/usr/sbin/php-fpm7"]