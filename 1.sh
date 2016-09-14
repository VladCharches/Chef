#!/bin/bash
yum install -y git
rpm -i /vagrant/sources/chef.rpm
rpm -i /vagrant/sources/chefdk.rpm
cp /vagrant/sources/jboss-5.1.0.GA.zip /opt/
cp -rf /vagrant/sources/.chef/ /root/
mkdir /cookbooks
cp -rf /vagrant/sources/cookbooks/* /cookbooks/

chef-solo -c /root/.chef/solo.rb |tee /vagrant/output_chef.log

