#!/bin/bash

docker rmi inzata-etl:5.1.0
docker build --no-cache --tag inzata-etl:5.1.0 .
docker tag inzata-etl:5.1.0 docker:5000/etl/inzata-etl:5.1.0
docker push docker:5000/etl/inzata-etl:5.1.0

# https://docs.docker.com/registry/spec/api/#detail
# GET http://docker:5000/v2/_catalog