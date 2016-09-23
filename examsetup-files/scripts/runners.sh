#!/bin/bash
#Runs apache and mysql
case "$1" in
	start)
		docker run --name apache01 -p 80:80 -v /home/ubuntu/examsetup/apache01/logs:/var/log/apache2 -v /home/ubuntu/examsetup/apache01/www:/var/www -d apache01
		docker run -p 3306:3306 --name mysql01 -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=test1 -e MYSQL_USER=testuser -e MYSQL_PASSWORD=testuser -v /home/ubuntu/examsetup/mysql01/data:/var/lib/mysql -d mysql/mysql-server:5.7
		echo "mysql01" `docker inspect --format '{{ .NetworkSettings.IPAddress}}' mysql01` > containersip
		echo "apache01" `docker inspect --format '{{ .NetworkSettings.IPAddress}}' apache01` >> containersip
	;;

	stop)
		docker stop apache01
		docker rm apache01 #TEsting remove
		docker stop mysql01
		docker rm mysql01 #Testing remove	
	;;
	*)
		echo "Usage start|stop"
	;;
esac
