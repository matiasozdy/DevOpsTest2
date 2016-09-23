#Add crontab backups, folder already copied before with scripts - Matias Ozdy
cron 'logbackuptos3' do
 minute '0'
 hour '19'
 weekday '*'
 month '*'
 year '*'
 user 'ubuntu'
 command '/home/ubuntu/examsetup/scripts/logrunners.sh'
end

cron 'backupconfigstos3my' do
 minute '0'
 hour '19'
 weekday '1'
 month '*'
 year '*'
 user 'ubuntu'
 command '/home/ubuntu/examsetup/scripts/bakcontainers.sh mysql01'
end

cron 'backupconfigstos3ap' do
 minute '0'
 hour '19'
 weekday '1'
 month '*'
 year '*'
 user 'ubuntu'
 command '/home/ubuntu/examsetup/scripts/bakcontainers.sh apache01'
end
