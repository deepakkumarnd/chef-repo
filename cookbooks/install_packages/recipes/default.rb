# solve locale error

execute "dpkg --configure -a" do
  action :nothing
end.run_action(:run)

apt_package 'python-software-properties software-properties-common' do
  action :install
end

execute 'add-apt-repository ppa:chris-lea/node.js' do
  action :nothing
end.run_action(:run)

execute "apt-get update" do
  ignore_failure true
  action :nothing
end.run_action(:run) if node['platform_family'] == "debian"

apt_package 'build-essential libmagickcore-dev imagemagick libxml2-dev libxslt1-dev git-core curl nodejs htop' do
  action :install
end