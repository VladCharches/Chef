include_recipe 'java'

user node['jboss']['user'] do
  home node['jboss']['home']
  system true
  shell '/bin/bash'
end

group node['jboss']['group'] do
  action :create
end

yum_package 'unzip' do
  action :install
  not_if "rpm -qa | grep -qx 'unzip'"
end

remote_file '/opt/jboss-5.1.0.GA.zip' do
  source node['jboss']['url']
  owner node['jboss']['user']
  group node['jboss']['group']
  not_if { ::File.file?("/opt/jboss-5.1.0.GA.zip") }
end

execute 'jboss_unzip' do
  command 'unzip jboss-5.1.0.GA.zip'
  cwd node['jboss']['path']
  not_if { ::File.directory?("/opt/jboss-5.1.0.GA") }
end

remote_file "/opt/testweb.zip" do
  source node['jboss']['app_url']
end

execute 'app_unzip' do
  command "unzip testweb.zip -d #{node['jboss']['app_dir']}"
  cwd node['jboss']['path']
end

template '/etc/init.d/jboss' do
  source "jboss.erb"
  mode 0775
  owner 'root'
  group node['root_group']
  variables({
    'user' => node['jboss']['user'],
    'jboss_home' => node['jboss']['home'],
    'ip' => node["network"]["interfaces"]['eth1']["addresses"].keys[1]
  })
end

template "#{node['jboss']['app_dir']}/hudson/hudson.xml" do
  source "hudson.erb"
  mode 0775
  variables({
    'engine' => data_bag_item('databag_hudson', 'hudson')['engine']
  })
end

template "#{node['jboss']['home']}/bin/run.sh" do
  source "run.erb"
  owner node['jboss']['user']
  group node['jboss']['group']
end

directory "#{node['jboss']['home']}/logs" do
  owner "#{node['jboss']['user']}"
  group "#{node['jboss']['group']}"
  mode '0755'
  action :create
end

execute 'changing_jboss_folder_ownership' do
  command "chown -R #{node['jboss']['user']}:#{node['jboss']['group']} #{node['jboss']['path']}"
end

service 'jboss' do
  init_command "/etc/init.d/jboss"
  supports :restart => true, :status => false, :stop => true, :start => true
  action [ :enable, :start ]
end
