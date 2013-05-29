# source source /etc/profile.d/rvm.sh in /etc/bash.bashrc

execute 'echo "source /etc/profile.d/rvm.sh" >> /etc/bash.bashrc' do
  action :run
  not_if { File.read('/etc/bash.bashrc').match('source /etc/profile.d/rvm.sh') }
end.run_action(:run)

# monit configuration files
template '/etc/monit/conf.d/nginx.conf' do
  source 'nginx.erb'
end

template '/etc/monit/conf.d/redis.conf' do
  source 'redis.erb'
end