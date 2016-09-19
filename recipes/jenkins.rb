# Cookbook Name:: jenkins
# Recipe:: default

# Changing ownership of jenkins folder

execute 'jenkins_owner' do
  user 'root'
  command "chown -R jenkins:jenkins /var/lib/jenkins"
  action :nothing
end

# Add jenkins repositories
template "/etc/yum.repos.d/jenkins.repo" do
  source "jenkins_repo.erb"
  mode "0644"
  owner "root"
  group "root"
end

# Installation jenkins
package 'jenkins' do
  action :install
end

# Add jenkins config
template "/etc/sysconfig/jenkins" do
  source "jenkins_config.erb"
  mode "0644"
  owner "root"
  group "root"
  variables({
    'jenkins_port' => node['jenkins']['jenkins_port'],
})
end

# Add Jenkins plugins and jobs
remote_directory "/var/lib/jenkins" do
  source 'jenkins'
  owner 'jenkins'
  group 'jenkins'
  files_owner 'jenkins'
  files_group 'jenkins'
  mode 0755
  action :create
  notifies :run, 'execute[jenkins_owner]', :immediately
end

# Installation git
package 'git' do
  action :install
end

# Add user jenkins to the group tomcat
group 'tomcat' do
  action :modify
  members 'jenkins'
  append true
end

# Change ownership of jenkins folder
execute 'jenkins home chown' do
  command "chown -R jenkins:jenkins /var/lib/jenkins"
end

# Change ownership of tomcat's webapps folder
execute 'tomcat webapps chown' do
  command "chown -R tomcat:tomcat /var/lib/tomcat/webapps/"
end

# Start jenkins
service "jenkins" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
  end