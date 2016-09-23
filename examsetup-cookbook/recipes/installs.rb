#Matias Ozdy

#First we install every dependency
package 'fullsetup' do
package_name['debconf-utils','icinga','icinga-doc','icinga-idoutils','mysql-server','libdbd-mysql','mysql-client','s3cmd','apt-transport-https','ca-certificates']
action :install
end

execute 'enableido2db' do
command "sed -i '/^IDO2DB=/s/=.*/=yes/' /etc/default/icinga"
action :run
end

execute 'copyidoutilsorig' do
command "cp /usr/share/doc/icinga-idoutils/examples/idoutils.cfg-sample /etc/icinga/modules/idoutils.cfg"
action :run
end

execute 'changeapacheport' do
command "sed -i '/^Listen /s/ .*/ 81/' /etc/apache2/ports.conf"
action :run
end

execute 'changemysqlport' do
command "sed -i '/^port.*/s/port = 3307/' /etc/mysql/my.cnf"
action :run
end

execute 'changeicingaport' do
command "sed -i '/^db_port=/s/=.*/=3307/' /etc/icinga/ido2db.cfg"
action:run
end

service 'mysql' do
 action [ :enable, :restart ]
end

service 'apache2' do
 action [ :enable, :restart ]
end

service 'icinga' do
 action [ :enable, :restart ]
end


