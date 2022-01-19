FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
		php7				\
        php7-pdo_dblib		\	
        php7-pdo_mysql		\
        php7-pdo_odbc		\
        php7-pdo_sqlite		\
        php7-session		\
        php7-simplexml		\
        php7-sqlite3		\
		php7-fpm			\
		php7-phar			\
		php7-json			\
		php7-mysqli			\
		php7-curl			\
		php7-iconv			\
		php7-mbstring		\
		php7-pecl-mailparse	\
		wget				\
        tar                 \
		mariadb-client		\
		redis		

# php config
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# adminer
COPY conf/adminer-4.8.1.php /tmp/adminer.php
COPY conf/adminer.css /tmp/adminer.css

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html

COPY tools/configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]