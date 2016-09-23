apt_repository 'docker' do
 uri 'https://apt.dockerproject.org/repo'
 components ['main']
 distribution 'ubuntu-trusty'
 key '58118E89F3A912897C070ADBF76221572C52609D'
 keyserver 'hkp://p80.pool.sks-keyservers.net:80'
 action :add
 deb_src true
end


package "linux-image-extra-"node['kernel']['release'] do
 action :install
end

package 'docker-engine'
 action :install
end

group 'docker' do
 action :modify
 members 'ubuntu'
 append true
end

docker_image 'ubuntu' do
 action :pull
end

docker_image 'mysql/mysql-server' do
 action :pull
end

docker_image 'apache01' do
 source '/home/ubuntu/apache01/config/Dockerfile'
 action :build
end

docker_image 'apache01' do
 repo apache01
 name 'apache01'
 port '80:80'
 volumes '/home/ubuntu/examsetup/apache01/logs:/var/log/apache2,/home/ubuntu/examsetup/apache01/www:/var/www'
 action 'run'
end

#Not finding -e for docker_image. Manual run.

execute 'startmysql' do
 user 'ubuntu'
 command 'docker run -p 3306:3306 --name mysql01 -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=test1 -e MYSQL_USER=testuser -e MYSQL_PASSWORD=testuser -v /home/ubuntu/examsetup/mysql01/data:/var/lib/mysql -d mysql/mysql-server:5.7'
end

