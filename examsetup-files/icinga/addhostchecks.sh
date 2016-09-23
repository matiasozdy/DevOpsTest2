server="mysql01"
server2="apache01"
ip="`docker inspect --format '{{ .NetworkSettings.IPAddress}}' $server`"
ip2="`docker inspect --format '{{ .NetworkSettings.IPAddress}}' $server2`"
echo "
define host {
        use                     generic-host
        host_name               $server
        alias                   $server Server
        address                 $ip
}

define service {
        use                     generic-service
        host_name               $server
        service_description     MySQL check
        check_command           check_mysql_cmdlinecred!root!123456

} " > $server.cfg

echo "
define host {
        use                     generic-host
        host_name               $server2
        alias                   $server2 Server
        address                 $ip2
}

define service {
        use                     generic-service
        host_name               $server2
        service_description     HTTP
        check_command           check_http
} " >  $server2.cfg

sudo mv $server.cfg $server2.cfg /etc/icinga/objects/
sudo service icinga reload
