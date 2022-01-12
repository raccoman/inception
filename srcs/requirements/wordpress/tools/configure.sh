#!/bin/sh

mkdir -p /var/www/html

mv /tmp/index.html /var/www/html/index.html
mv /tmp/index.php /var/www/html/index.php

echo "[i] Unzipping wordpress..."
tar -xvzf /tmp/latest.tar.gz --directory /var/www/html > /dev/null
rm -rf /tmp/latest.tar.gz

echo "[i] Configuring wordpress..."
mv /tmp/wp-config.php /var/www/html/wordpress/wp-config.php

echo "[i] Starting wordpress..."
/usr/sbin/php-fpm7