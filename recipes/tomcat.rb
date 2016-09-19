# Cookbook Name:: tomcat
# Recipe:: default

# Installation tomcat
package 'tomcat' do
  action :install
end

# Installation tomcat-webapps
package 'tomcat-webapps' do
  action :install
end

# Add tomcat config and change port
template "/etc/tomcat/server.xml" do
  source "tomcat_server.erb"
  mode "0644"
  owner "tomcat"
  group "tomcat"
  variables({
    'tomcat_port' => node['tomcat']['tomcat_port']
})
end

# Service tomcat service
service "tomcat" do
  supports :restart => true, :start => true, :stop => true, :status => false
  action [ :enable, :start ]
end
