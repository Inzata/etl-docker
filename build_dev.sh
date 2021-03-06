#!/bin/bash

docker rmi inzata-etl:dev_5.1.0
docker build --no-cache --tag inzata-etl:dev_5.1.0 --squash .
docker tag inzata-etl:dev_5.1.0 docker:5000/etl/inzata-etl:dev_5.1.0
docker push docker:5000/etl/inzata-etl:dev_5.1.0

# https://docs.docker.com/registry/spec/api/#detail
# GET http://docker:5000/v2/_catalog