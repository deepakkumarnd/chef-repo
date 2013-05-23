execute 'curl -L https://get.rvm.io | bash -s' do
  action :nothing
end.run_action(:run)

template '/home/deploy/.gemrc' do
  source 'gemrc.erb'
  mode 0440
  owner 'deploy'
  owner 'deploy'
end