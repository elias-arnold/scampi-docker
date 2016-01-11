FROM ubuntu:15.10
RUN apt-get -y update \
	&& apt-get upgrade -y \
	&& apt-get install openjdk-8-jre -y

RUN mkdir /usr/scampi/
ADD ./default_settings.txt /usr/scampi/default_settings.txt
ADD ./SCAMPI.jar /usr/scampi/SCAMPI.jar
CMD java -jar /usr/scampi/SCAMPI.jar -s -l debug /usr/scampi/default_settings.txt
