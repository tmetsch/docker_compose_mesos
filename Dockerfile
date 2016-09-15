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
RUN wget http://downloads.mesosphere.com/marathon/v1.3.0/marathon-1.3.0.tgz
RUN tar -xzf marathon-1.3.0.tgz && cd marathon-1.3.0 && mv * ..

EXPOSE 5050
WORKDIR /

