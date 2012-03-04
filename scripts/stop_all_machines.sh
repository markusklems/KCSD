#! /bin/bash

# DESC
# stop all machines in the infrastructure
echo ":::::::::::::::::: stopping all machines"

# remove all new line chracters
# and put the stream into nodes variable
cat $CHEF_HOME/tmp/max_machines.txt
max_machines=$(tr -d '\n' < $CHEF_HOME/tmp/max_machines.txt)

# stop all machines via EC2 API tools
ec2-stop-instances $max_machines
