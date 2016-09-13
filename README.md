MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: [Uladzislau Charches](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038705754#emplTab=general)

# Chef Task6

1. I setuped vagrant box and installed Chef-client and ChefDK
2. I created folders .chef, chef_cookbooks and file solo.rb

$log_level :debug
$file_cache_path "/root/.chef/"
$cookbook_path "/root/chef_cookbooks"
$json_attribs "/root/.chef/runlist.json"

3. I downloaded and installed cookbooks of nginx and iptables from http://community.opscode.com/cookbooks/
For the nginx required dependencies. For solve it I used berkshelf

- yum install git
- berks init
- berks install
- berks package

I recieved an archive and extracted it to /root/chef_cookbooks

![3](https://github.com/VladCharches/Chef-courses/blob/Task6/Screens/3.png)

4. I created runlist.json in /root/.chef/runlist.json:

5. I run config for chef-solo with output.log
chef-solo -c /root/.chef/solo.rb > output.log

6. I chekecd NginX 
Screenshots
![1](https://github.com/VladCharches/Chef-courses/blob/Task6/Screens/1.png)

and iptables
![2](https://github.com/VladCharches/Chef-courses/blob/Task6/Screens/2.png)



Files:

-  [provision.yml](vagrant/ansible/provision.yml)  

