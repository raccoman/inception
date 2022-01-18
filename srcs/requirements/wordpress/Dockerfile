FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
		php7				\
		php7-fpm			\
		php7-phar			\
		php7-json			\
		php7-mysqli			\
		php7-curl			\
		php7-iconv			\
		php7-pecl-mailparse	\
		wget				\
        tar                 \
		mariadb-client		\
		redis		

# php config
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/wordpress

COPY tools/configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]