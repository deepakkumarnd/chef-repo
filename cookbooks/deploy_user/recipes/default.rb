# create a deploy group
group 'deploy' do
  action :create
end

# create a deploy user
user 'deploy' do
  comment 'Deploy user'
  username 'deploy'
  home '/home/deploy'
  supports :manage_home => true
  shell '/bin/bash'
  gid 'deploy'
  action :create
end

directory 'apps' do
  user 'deploy'
  group 'deploy'
  mode 00755
  action :create
end