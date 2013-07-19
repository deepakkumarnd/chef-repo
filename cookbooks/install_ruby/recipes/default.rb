execute 'source /etc/bash.bashrc' do
  action :run
end.run_action(:run)

execute 'rvm install 2.0.0' do
  action :run
end.run_action(:run)