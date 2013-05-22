package "redis-server"

service "redis-server" do
  start_command "/etc/init.d/redis-server start #{node['redis']['config_path']}"
  stop_command    "/etc/init.d/redis-server stop"
  restart_command "/etc/init.d/redis-server restart"
  action [:enable, :start]
end

template "/etc/redis/redis.conf" do
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[redis-server]"
end
