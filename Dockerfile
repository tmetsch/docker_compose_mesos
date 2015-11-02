FROM ubuntu:15.04

# Update the packages.
RUN apt-get update --fix-missing

# Install the latest OpenJDK.
RUN apt-get install -y openjdk-8-jdk

# Install autotools (Only necessary if building from git repository).
RUN apt-get install -y autoconf libtool

# Install other Mesos dependencies.
RUN apt-get -y install build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev maven libapr1-dev libsvn-dev libz-dev wget

RUN wget -qO- https://get.docker.com/ | sh

ADD ./docky /usr/local/bin/docky
RUN chmod +x /usr/local/bin/docky
    
RUN wget http://www.apache.org/dist/mesos/0.25.0/mesos-0.25.0.tar.gz
RUN tar -zxf mesos-0.25.0.tar.gz

RUN wget http://downloads.mesosphere.com/marathon/v0.11.1/marathon-0.11.1.tgz
RUN tar -xzf marathon-0.11.1.tgz

RUN mkdir -p mesos-0.25.0/build

WORKDIR mesos-0.25.0/build
RUN /mesos-0.25.0/configure
RUN make -j 2
