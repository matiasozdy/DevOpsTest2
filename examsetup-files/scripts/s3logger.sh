#!/bin/bash
# Im sending logs to my accoutn                                                                  
#
if [ $2 = "fromdocker" ]; then
	# /var/log/msqld.log has to be a variable.
	docker cp $1:/var/log/mysqld.log /home/ubuntu/examsetup/$1/logs/
	s3cmd sync /home/ubuntu/examsetup/$1/logs/ s3://mozdy-testlogs/$1/`date +%F`/
else

	s3cmd sync /home/ubuntu/examsetup/$1/logs s3://mozdy-testlogs/$1/`date +%F`/
fi
