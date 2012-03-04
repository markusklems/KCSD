#! /bin/bash

# DESC
# delete all machines in the infrastructure

# ARE YOU SURE
echo "Do you really want to delete all machines in the Infrastructure?? (y/n)"
read answer

if [ "$answer" = "y" ]; then
	echo ":::::::::::::::::: deleting all machines"

	# get all the available machines
	cat $CHEF_HOME/tmp/max_machines.txt
	
	# save in nodes array
	nodes=($(cat $CHEF_HOME/tmp/max_machines.txt))

	# get the size of this array
	size=${#nodes[@]}

	# iterate
	for ((i=0;i<size;i++))
	do
		echo ${nodes[$i]}" is being deleted..."

		# knife ec2 sever delete command
		knife ec2 server delete ${nodes[$i]} --purge -y
	done

	# update max
	sed -i 's/max=.*/max=0/g' $CHEF_HOME/config/config.cfg
else
	echo "Puuh! The infrastructure is safe :)"
fi


