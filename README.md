
# Apache Mesos dockerized dev environment

*Note*: this is for playing around only :-)

By running the following command a small [Apache Mesos](http://mesos.apache.org/) environment is launched. The Marathon Framework and a simple Zookeeper are included. For demo purposes to 2 Mesos slaves are run which connect back to the host's docker environment.

    $ docker-compose up
    $ docker-compose ps
             Name                        Command               State              Ports             
    -----------------------------------------------------------------------------------------------
    devopsmesos_marathon_1    /marathon-0.8.2/bin/start  ...   Up      0.0.0.0:8080->8080/tcp       
    devopsmesos_master_1      ./bin/mesos-master.sh --zk ...   Up      0.0.0.0:8888->5050/tcp       
    devopsmesos_node1_1       ./bin/mesos-slave.sh --mas ...   Up                                   
    devopsmesos_node2_1       ./bin/mesos-slave.sh --mas ...   Up                                   
    devopsmesos_zookeeper_1   /opt/zookeeper-3.4.5/bin/z ...   Up      2181/tcp, 2888/tcp, 3888/tcp
    
The Mesos UI can be found [here](http://localhost:8888).

The Marathon UI can be found [here](http://localhost:8888).

## Running a dockerized app usin Marathon

To run a simple app registerd the app:

    $ curl -X POST http://localhost:8080/v2/apps -d @hello_world.json -H "Content-type: application/json"

You can lookup the exposed port of the app on your host machine's docker and visit the expose "web interface" afterwards:

    $ docker ps
    CONTAINER ID        IMAGE                     COMMAND                CREATED             STATUS              PORTS                          NAMES
    e1afec4c53ba        python:3                  "/bin/sh -c 'python3   14 minutes ago      Up 14 minutes       0.0.0.0:31000->8080/tcp        mesos-f258fe56-d68c-42f2-878c-b8c88186087b  
    151f8c8904f8        devopsmesos_marathon      "/marathon-0.8.2/bin   15 minutes ago      Up 15 minutes       0.0.0.0:8080->8080/tcp         devopsmesos_marathon_1 
    [...]

The source for running dockerized commands with Mesos and Marathon can be found [here](https://mesosphere.github.io/marathon/docs/application-basics.html).
