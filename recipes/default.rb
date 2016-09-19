#
# Cookbook Name:: exittask
# Recipe:: default
#

include_recipe 'exittask::java'
include_recipe 'exittask::nginx'
include_recipe 'exittask::tomcat'
include_recipe 'exittask::jenkins'

