FROM ubuntu

COPY mesos.tgz /mesos.tgz

COPY ./docky /usr/local/bin/docky
RUN chmod +x /usr/local/bin/docky

RUN tar -zxvf mesos.tgz
RUN apt-get update --fix-missing
RUN apt-get install --no-install-recommends -y libsvn1 libcurl3-nss wget openjdk-8-jre-headless

RUN wget -qO- https://get.docker.com/ | sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/marathon
WORKDIR /opt/marathon
RUN wget http://downloads.mesosphere.com/marathon/v1.4.3/marathon-1.4.3.tgz
RUN tar -xzf marathon-1.4.3.tgz && cd marathon-1.4.3 && mv * ..

EXPOSE 5050
WORKDIR /

