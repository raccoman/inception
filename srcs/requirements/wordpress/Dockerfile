FROM alpine:3.13

RUN apk add --update php7-fpm \
                    php7-pdo_mysql
RUN apk add --update wget
RUN apk add --update tar
RUN rm -rf /var/cache/apk/*

# php config
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# default website
RUN mkdir -p /var/www/raccoman && touch /var/www/raccoman/index.php
RUN echo "<?php phpinfo(); ?>" >> /var/www/raccoman/index.php

# wordpress
COPY tools/wordpress-5.7.2.tar.gz /tmp/latest.tar.gz
#RUN wget -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -xvzf /tmp/latest.tar.gz --directory /var/www/raccoman
RUN rm -rf /tmp/latest.tar.gz

# wordpress config
COPY conf/wp-config.php /var/www/raccoman/wordpress/wp-config.php

# start php
ENTRYPOINT ["/usr/sbin/php-fpm7"]