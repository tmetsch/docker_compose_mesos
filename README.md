
# Apache Mesos dockerized dev environment

*Note*: this is for playing around only :-)

By running the following command a small [Apache Mesos](http://mesos.apache.org/) environment is launched. The Marathon Framework and a simple Zookeeper are included. For demo purposes to 2 Mesos slaves are run which connect back to the host's docker environment.

    $ docker-compose up
    
The Mesos UI can be found [here](http://localhost:8888).

The Marathon UI can be found [here](http://localhost:8888).

## Running a dockerized app usin Marathon

To run a simple app registerd the app:

    $ curl -X POST http://localhost:8080/v2/apps -d @hello_world.json -H "Content-type: application/json"

You can lookup the exposed port of the app on your host machine's docker and visit the expose "web interface" afterwards.

The source for running dockerized commands with Mesos and Marathon can be found [here](https://mesosphere.github.io/marathon/docs/application-basics.html).
