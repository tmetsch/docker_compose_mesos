FROM ubuntu

# Update the packages.
RUN apt-get update --fix-missing

# Install the latest OpenJDK.
RUN apt-get install -y openjdk-7-jdk

# Install autotools (Only necessary if building from git repository).
RUN apt-get install -y autoconf libtool

# Install other Mesos dependencies.
RUN apt-get -y install build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev maven libapr1-dev libsvn-dev wget

RUN wget -qO- https://get.docker.com/ | sh
    
RUN wget http://www.apache.org/dist/mesos/0.22.1/mesos-0.22.1.tar.gz
RUN tar -zxf mesos-0.22.1.tar.gz

RUN wget http://downloads.mesosphere.com/marathon/v0.8.2/marathon-0.8.2.tgz
RUN tar -xzf marathon-0.8.2.tgz

RUN mkdir -p mesos-0.22.1/build

WORKDIR mesos-0.22.1/build
RUN /mesos-0.22.1/configure
RUN make -j 4
