FROM ubuntu:18.04
MAINTAINER Jaeho Choi

RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update
RUN apt-get install -y build-essential g++ apache2 unzip p7zip-full lua5.1 lua5.1-dev lua-socket
RUN a2enmod cgi
RUN service apache2 restart

WORKDIR /
COPY ./ /conquestdicomserver

WORKDIR /conquestdicomserver/
RUN chmod 777 maklinux
RUN sh maklinux

EXPOSE 5678 80

CMD ["./webviewer.sh"]



