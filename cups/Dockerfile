FROM resin/rpi-raspbian:jessie

MAINTAINER schafmeister <mail@slacktime.org>

# Setup base system
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get update && apt-get upgrade

# Cups and Drivers for Samsung printers
RUN apt-get install -y avahi-daemon cups printer-driver-splix whois && rm -rf /var/lib/apt/lists/*

RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

# Samba ports
EXPOSE 631/tcp
EXPOSE 5353/udp

COPY cupsd.conf /etc/cups/cupsd.conf
COPY cups-files.conf /etc/cups/cups-files.conf
COPY snmp.conf /etc/cups/snmp.conf

# patch avahi daemon setting that prevents running the daemon in multiple containers
RUN sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf
RUN sed -i -e'/AVAHI_DAEMON_DETECT_LOCAL/s/1/0/' /etc/default/avahi-daemon

# copy start script
COPY run_cups.sh ./
RUN chmod +x ./run_cups.sh

CMD ["/run_cups.sh"]