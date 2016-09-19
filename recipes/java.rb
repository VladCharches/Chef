#
# Cookbook Name:: java
# Recipe:: default

#Installation Java
package 'java-1.7.0-openjdk-devel' do
  action :install
end

#Installation unzip
package 'unzip' do
  package_name 'unzip'
  action :install
end