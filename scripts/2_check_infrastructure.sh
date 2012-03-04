#! /bin/bash

# DESC
# take the maximal number of machines (n) that users want
# if n > the available number of machines (max) --> create new machines --> update max

# read the config file
source $CHEF_HOME/config/config.cfg

# check if the Chef Server's trigger is ON
if [ "$status_of_chef_server" = "ON" ]; then
	echo "Chef Server is READY..."

	echo "Input the maximal number of machines you want to use:"
	read user_number	

	# compare user_number with max
	if [ $user_number -le $max ]; then
		echo "The max available machines are $max"	
		echo "We have enough machines for you!!!"
		echo "Ready to use..."
		sed -i 's/status_of_the_insfrastructure=.*/status_of_the_insfrastructure=ON/g' $CHEF_HOME/config/config.cfg
	else
		delta=$(expr $user_number - $max)
		echo "The max available machines are $max"	
		echo "We have to create $delta more machine(s) for you!!!"

		# provisioning new machines for the infrastructure
		provision_new_machines.sh $delta
	
		echo "$delta new machine(s) are already created!!!"

		# update max
		# -s: subtituion 
		# REGEX: .*
		# Notice: the line max=... is the end line in the config.cfg
		sed -i 's/max=.*/max='$user_number'/g' $CHEF_HOME/config/config.cfg

		# stop all machines
		stop_all_machines.sh

		echo "The Infrastructure is READY to use..."
		# update status for the infrastructure
		sed -i 's/status_of_the_insfrastructure=.*/status_of_the_insfrastructure=ON/g' $CHEF_HOME/config/config.cfg
	fi	
else
	echo "Chef Server is NOT ready!!!..."
fi
