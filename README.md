# Chef-courses
knife ssl fetch
knife cookbook upload --all
knife bootstrap 192.168.56.110 -N chefX -x root -P vagrant -r 'role[jboss-role]' -E Chef-dev |tee bootstrap.log