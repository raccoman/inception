FROM alpine:3.13

RUN apk add --update php7-fpm php7-pdo_mysql
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

# # default website
# RUN mkdir -p /var/www/html && touch /var/www/html/index.php
# RUN echo "<?php phpinfo(); ?>" >> /var/www/html/index.php
# COPY conf/index.html /var/www/html/index.html

# # wordpress
# # COPY tools/wordpress-5.7.2.tar.gz /tmp/latest.tar.gz
# # RUN wget -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz
# # RUN tar -xvzf /tmp/latest.tar.gz --directory /var/www/html
# # RUN rm -rf /tmp/latest.tar.gz

# # wordpress config
# #COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

# # start php
# ENTRYPOINT ["/usr/sbin/php-fpm7"]