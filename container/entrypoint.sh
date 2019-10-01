#!/bin/sh
OPTIONS=$@
cp /etc/bind.keys /etc/bind/bind.keys
chown -R root:named /etc/bind /var/run/named /var/log/named
chown -R named:named /var/cache/bind
chmod -R 770 /var/cache/bind /var/run/named /var/log/named
chmod -R 750 /etc/bind
rndc-confgen -a
sync
# Run in foreground and log to STDERR (console):
/usr/sbin/named -c /etc/bind/named.conf -g -u named $OPTIONS
