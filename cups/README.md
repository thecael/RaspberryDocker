# cups docker image
customized docker image for cups to run on a raspberry pi host system.

## build
```
docker build -t cups .
```

## run

There are two variables to hand over:
* CUPS_USER_ADMIN
* CUPS_USER_PASSWORD

You need this account data to login to cups admin webinterface.

### using usb printers

You can run the image with the `--privileged` flag and use the usb layer from the host system. From security aspects it's a bit risky so I found this script that figures out the usb device of the printer and hands it to the docker image. You have to customize the script when you don't use samsung printers.

```
#!/bin/sh
# Get Printer location
echo "Getting printer info..."
BUS=$(lsusb|grep Samsung|awk '{print $2}')
DEV=$(lsusb|grep Samsung|awk '{print $4}')
DEV="${DEV%?}"
PRINTER="/dev/bus/usb/$BUS/$DEV"

docker run --net=host -p 631:631 -p 5353:5353 --device=$PRINTER -e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=your_password_here --name cups -i -t cups
```
