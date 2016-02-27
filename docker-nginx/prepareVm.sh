#!/bin/bash

apt-get -y update \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install openjdk-8-jre -y \
	&& apt-get install mongodb-server -y

# Copy default cofiguration for nginx
cp ./nginx-scampiRest /etc/nginx/sites-available/default

# copy the API jar to usr
cp ./scampiREST-1.0-SNAPSHOT.jar /usr/scampiREST-1.0-SNAPSHOT.jar
chown www-data:root /usr/scampiREST-1.0-SNAPSHOT.jar

# copy the startupskript for the rest api
cp ./scampiRest.sh /usr/scampiRest.sh
chmod 700 /usr/scampiRest.sh

# copy the startupskript for the scampi server
cp ./scampi.sh /usr/scampi.sh
chmod 700 /usr/scampi.sh

# copy the scampy server
cp ./default_settings.txt /usr/scampi/default_settings.txt
cp ./SCAMPI.jar /usr/scampi/SCAMPI.jar
chmod 700 /usr/scampi/SCAMPI.jar

# create necessary files and folders
mkdir /var/tmp/scampiRest
mkdir /var/tmp/nginxFiles
cp -R ./static /var/tmp/nginxFiles/

# copy the scampy server
mkdir /usr/scampi/
mkdir /var/log/scampi
cp ./default_settings.txt /usr/scampi/default_settings.txt
cp ./SCAMPI.jar /usr/scampi/SCAMPI.jar
chmod 700 /usr/scampi/SCAMPI.jar

touch /var/log/scampi/scampiService.log
chmod 222 /var/log/scampi/scampiService.log

touch /var/log/scampi/scampiRest.log
chmod 222 /var/log/scampi/scampiRest.log


