FROM ubuntu:18.04
MAINTAINER Jaeho Choi

RUN apt-get update -y
RUN apt-get install -y build-essential g++ apache2 unzip p7zip-full lua5.1 lua5.1-dev lua-socket
RUN a2enmod cgi
RUN systemctl restart apache2

WORKDIR /
COPY ./ /conquestdicomserver

WORKDIR /conquestdicomserver/
RUN chmod 777 maklinux
RUN ./maklinux

#RUN cp conquest.service /etc/systemd/system/conquest.service
#RUN systemctl daemon-reload
#RUN systemctl start conquest.service
#RUN systemctl enable conquest.service

