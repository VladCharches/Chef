MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: [Uladzislau Charches](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038705754#emplTab=general)

# Chef Exit_TASK

**1. I edited Vagrantfiles of 2 Vm. Run it with edited files "hosts". You can check its below**
**2. Reconfigured ansible configs to Chefs recipes: java, nginx, tomcat, jenkins **

**Knife bootstrap command:**

- knife bootstrap 192.168.56.110 -N chefX -x root -P vagrant -r 'role[exit_task]'



Screenshots:

**Jenkins**

![1](https://github.com/VladCharches/Chef-courses/blob/exit_task/screens/1.png)

**Tests**

**3. I installed foodcritic **

$ gem install foodcritic

**I checked my recipes for errors by command foodcritic cookbooks_2. Find some errors and solved it with help http://www.foodcritic.io/**

**4. Kitchen installation and test**
$ gem install test-kitchen
$ kitchen init
$ kitchen test
$ kitchen verify

**5. Create tests [default_spec.rb]()**

**Test_Results**

![2](https://github.com/VladCharches/Chef-courses/blob/exit_task/screens/2.png)
