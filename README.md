MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: [Uladzislau Charches](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038705754#emplTab=general)

# Chef Task8

**I edited Vagrantfiles of 2 Vm. You can check its below**

My [bootstrap.log](https://github.com/VladCharches/Chef-courses/blob/Task8/bootstrap.log) file

Screenshots:
**Hudson**

![1](https://github.com/VladCharches/Chef-courses/blob/Task8/screens/1.png)

**Other**

![2](https://github.com/VladCharches/Chef-courses/blob/Task8/screens/2.png)
![3](https://github.com/VladCharches/Chef-courses/blob/Task8/screens/3.png)
![4](https://github.com/VladCharches/Chef-courses/blob/Task8/screens/4.png)

You can check my additional Files:
-  [jboss_files](https://github.com/VladCharches/Chef-courses/tree/Task8/jboss)
-  [knife.rb](https://github.com/VladCharches/Chef-courses/blob/Task8/.chef/knife.rb) 

**Usefull commands**
knife ssl fetch
knife cookbook upload --all
knife bootstrap 192.168.56.110 -N chefX -x root -P vagrant -r 'role[jboss-role]' -E Chef-dev |tee bootstrap.log
