#! /bin/bash

# DESC
# provision new machines for the infrastructure

# $1 $2 .... store the arguments given by users
# $1 here means the number of instances to instantiate with knife and bootstrap them

# help variables
key_pair="$CHEF_HOME/pem/chef-ec2.pem"
user="ubuntu"
name="node"
group="OPEN"
run_list="'recipe[java]'"
role="'role[cassandra-node]'"

# create instances
# the processes will be forked with symbol &

echo ":::::::::::::::::: provisioning $1 new machine(s)"
for ((i=1;i<=$1;i++))
do	
	#knife ec2 server create --identity-file $key_pair --ssh-user $user --groups $group
	knife ec2 server create --identity-file $key_pair --ssh-user $user --groups $group --run-list $role
done

# update the available machines list
knife node list > $CHEF_HOME/tmp/max_machines.txt

# if everything OK
exit 0
