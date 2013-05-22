package 'mongodb'

service 'mongodb' do
  supports :restart => true, :reload => true
  action [:enable, :start]
end

template '/etc/mongodb.conf' do
  notifies :reload, 'service[mongodb]'
end
