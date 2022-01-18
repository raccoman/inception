#!/bin/sh

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html/wordpress

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd
    chown -R $FTP_USR:$FTP_USR /var/www/html/wordpress

    echo $FTP_USR | tee -a /etc/vsftpd.userlist

fi

echo "FTP listening on :20"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf