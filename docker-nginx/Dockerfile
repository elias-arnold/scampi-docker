FROM ubuntu:15.10
RUN apt-get -y update \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install openjdk-8-jre -y \
	&& apt-get install mongodb-server -y
RUN apt-get install supervisor -y
ADD ./nginx-scampiRest /etc/nginx/sites-available/default

ADD ./scampiREST-1.0-SNAPSHOT.jar /usr/scampiREST-1.0-SNAPSHOT.jar
RUN chown www-data:root /usr/scampiREST-1.0-SNAPSHOT.jar

ADD ./run.sh /usr/run.sh
RUN chmod 700 /usr/run.sh

ADD ./scampiRest.sh /usr/scampiRest.sh
RUN chmod 700 /usr/scampiRest.sh

ADD ./scampi.sh /usr/scampi.sh
RUN chmod 700 /usr/scampi.sh

RUN mkdir /var/tmp/scampiRest
RUN mkdir /var/tmp/nginxFiles
ADD ./static/ /var/tmp/nginxFiles/

RUN mkdir /usr/scampi/
RUN mkdir /var/log/scampi

RUN touch /var/log/scampi/scampiService.log
RUN chmod 222 /var/log/scampi/scampiService.log

RUN touch /var/log/scampi/scampiRest.log
RUN chmod 222 /var/log/scampi/scampiRest.log

ADD ./default_settings.txt /usr/scampi/default_settings.txt
ADD ./SCAMPI.jar /usr/scampi/SCAMPI.jar

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/run.sh

