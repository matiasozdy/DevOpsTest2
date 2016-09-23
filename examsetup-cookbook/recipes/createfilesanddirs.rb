#Matias Ozdy
remote_directory '/home/ubuntu/examsetup' do
 source 'examsetup'
 owner 'ubuntu'
 group 'ubuntu'
 action :create
end
