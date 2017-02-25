#!/bin/bash

echo "Getting printer info..."
BUS=$(lsusb|grep Samsung|awk '{print $2}')
DEV=$(lsusb|grep Samsung|awk '{print $4}')
DEV="${DEV%?}"
PRINTER="/dev/bus/usb/$BUS/$DEV"

docker run --net=host -p 631:631 -p 5353:5353 --device=$PRINTER -e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=your_pw_here --name cups -i -t cups
