# Inzata ETL Environment

## Prerequisites

The Inzata ETL environment depends on a PostgreSQL database. If you don't have one, you may want to pull it in the form of a Docker [postgres](https://hub.docker.com/_/postgres/) image.

## Basic Usage

```
docker run -d --name etlp --net=host -p 8080:80 -v $HOME:$HOME -v /var/data/etl:/var/etl inzata/etl
docker exec -it etlp /bin/bash
```

The first command downloads and starts the ETL docker and the second command opens a UNIX shell in the new environment.

The purpose of options provided to the _docker run_ is:

* _--net=host_ -- run the etlp container using the host network configuration
* _-p 8080:80"_ -- expose ETLp's audit application on the host's port 8080. This will allow you to inspect completed as well as running ETL jobs at _http://localhost:8080_.
* _-v $HOME:$HOME_ -- with this, you will be able to use your home directory from within the container
* _-v /var/data/etl:/var/etl_ -- this will map the /var/data/etl directory on your drive to /var/etl directory in the container. The container places its configuration files to /var/etl/etc, its web to /var/etl/www and ETL projects should be created in /var/etl/projects or in /var/data/etl (which is a link to /var/etl/projects). This arrangement of configuration and data directories makes it possible for you to upgrade the etlp container without losing your data.

## Documentation of the ETL Environment

The documentation of Inzata's ETL environment is located at [http://www.inzata.com/etl/](http://www.inzata.com/etl/).
