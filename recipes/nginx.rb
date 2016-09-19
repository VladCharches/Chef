#
# Cookbook Name:: nginx
# Recipe:: default

# Installation NginX
package 'nginx' do
  action :install
end

# Add NginX confifg with variables 4 jenkins, tomcat, nginx 
template "/etc/nginx/conf.d/default.conf" do
  source "nginx_config.erb"
  mode "0644"
  owner "root"
  group "root"
  variables({
    'nginx_port' => node['nginx']['nginx_port'],
    'jenkins_port' => node['jenkins']['jenkins_port'],
    'tomcat_port' => node['tomcat']['tomcat_port']
})
end

# Start Nginx service
service "nginx" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
end

