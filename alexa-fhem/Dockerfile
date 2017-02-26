FROM resin/rpi-raspbian:jessie

MAINTAINER schafmeister <mail@slacktime.org>

# Setup base system
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget apt-transport-https ca-certificates sudo

RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

# Install nodejs for homebridge
RUN apt-get install -y build-essential libssl-dev curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs python g++

# Expose port
EXPOSE 3000

# Install alexa-fhem
RUN useradd -ms /bin/bash alexa
COPY alexa-fhem-0.1.8.tgz /opt/alexa-fhem-0.1.8.tgz
WORKDIR "/opt/alexa-fhem"
RUN tar -xvzf /opt/alexa-fhem-0.1.8.tgz \ 
    && mv /opt/alexa-fhem/package/* /opt/alexa-fhem \
    && npm install \
    && chown -R alexa /opt/alexa-fhem \
    && rm /opt/alexa-fhem-0.1.8.tgz 
COPY alexa-config/* /home/alexa/.alexa/

WORKDIR "/"

# Copy start script
COPY run_alexa.sh ./
RUN chmod +x ./run_alexa.sh
CMD ["/run_alexa.sh"]
