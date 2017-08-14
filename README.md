# Inzata ETL Environment

## Prerequisites

The Inzata ETL environment depends on a PostgreSQL database. If you don't have one, you may want to pull it in the form of a Docker [postgres](https://hub.docker.com/_/postgres/) image.

## Basic Usage

```
docker run -d --name etlp --net=host -v $HOME:$HOME inzata/etl
docker exec -it etlp /bin/bash
```

The first command downloads and starts the ETL docker and the second command opens a UNIX shell in the new environment.

## Documentation of the ETL Environment

The documentation of Inzata's ETL environment is located at [http://www.inzata.com/etl/](http://www.inzata.com/etl/).
