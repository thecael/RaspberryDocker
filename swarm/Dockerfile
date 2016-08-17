FROM resin/rpi-raspbian:jessie

# Install dependencies
RUN apt-get -y update && \
    apt-get install -y git openjdk-8-jre libtravel-routing-de-vrr-perl

# Set Timezone
RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-armhf

ADD wildfly-swarm.jar /opt/wildfly-swarm.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/wildfly-swarm.jar"]
