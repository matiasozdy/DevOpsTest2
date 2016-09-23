#!/bin/bash
server=$1
#container snapshot
docker commit -p $server $server-bk
#Lets backup de image weekly
docker save -o /home/ubuntu/examsetup/imagesbk/$server.tar $server-bk
s3cmd sync /home/ubuntu/examsetup/imagesbk/ s3://mozdy-testlogs/dockerbackups/`date +%F`/
rm /home/ubuntu/examsetup/imagesbk/*.tar
#Also lets backup config files
s3cmd sync /home/ubuntu/examsetup/$server/conf/ s3://mozdy-testlogs/configbackups/$server/`date +%F`/
