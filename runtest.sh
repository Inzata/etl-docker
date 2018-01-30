 #!/bin/bash

docker rm dtest

docker run -d -p 80:80 --name dtest -h dtest -v /home/alyosha/Prace/QEngine/etl-docker:/var/etl inzata-etl:dev_5.1.0
