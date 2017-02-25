#!/bin/bash
set -e
set -x

if [ $(grep -ci $CUPS_USER_ADMIN /etc/shadow) -eq 0 ]; then
    useradd $CUPS_USER_ADMIN --system -G lpadmin --no-create-home --password $(mkpasswd $CUPS_USER_PASSWORD)
fi

/etc/init.d/dbus restart
/etc/init.d/avahi-daemon restart
exec /usr/sbin/cupsd -f
