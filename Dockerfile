FROM ubuntu:18.04
MAINTAINER Jaeho Choi

RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update
RUN apt-get install -y build-essential g++ apache2 unzip p7zip-full lua5.1 lua5.1-dev lua-socket gettext-base systemd
RUN a2enmod cgi

WORKDIR /
COPY ./ /conquestdicomserver

WORKDIR /conquestdicomserver/
RUN chmod 777 maklinux
RUN sh maklinux

EXPOSE 5678 8086

RUN chmod 777 serve.sh
CMD ["./serve.sh"]

#RUN cp conquest.service /etc/init.d/conquest.service
#RUN service conquest start

#RUN chmod 777 server.sh
#CMD ["./server.sh"]



