#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo '[i] MySQL directory already present, skipping creation'
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
	echo '[i] Database initialized'
fi

echo "[i] MySql root password: $MYSQL_ROOT_PWD"

tfile=`mktemp`
if [ ! -f "$tfile" ]; then
	return 1
fi

cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION;
EOF

# MySQL queries
# echo "[i] Updating root password"
# echo "USE mysql;" >> $tfile
# echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION;" >> $tfile

echo "[i] Creating database: $WP_DATABASE_NAME"
echo "CREATE DATABASE IF NOT EXISTS \`$WP_DATABASE_NAME\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile

echo "[i] Creating user: $WP_DATABASE_USR with password $WP_DATABASE_PWD"
echo "GRANT ALL ON \`$WP_DATABASE_NAME\`.* to '$WP_DATABASE_USR'@'%' IDENTIFIED BY '$WP_DATABASE_PWD';" >> $tfile

echo "FLUSH PRIVILEGES;" >> $tfile

# run sql in tempfile
echo "[i] Executing queries: $tfile"
/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < $tfile
rm -f $tfile


echo "[i] Sleeping 3 seconds..."
sleep 3

echo "[i] Starting mariadb server"
exec /usr/bin/mysqld --user=mysql --console