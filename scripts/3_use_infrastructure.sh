#! /bin/bash

# DESC
# use the infrastructure

# read the config file
source $CHEF_HOME/config/config.cfg

# check if the Chef Server's trigger and the Infrastructure's trigger are ON
if [ "$status_of_chef_server" = "ON" ] && [ "$status_of_the_insfrastructure" = "ON" ]; then
	echo "Chef Server is READY..."
	echo "The Infrastructure is READY..."
	
	# a big enough request
	user_number=999	

	# ask users until user_numer <= max
	until [ $user_number -le $max ]; do
		echo "Input the number of machines you want to use for the benchmark:"
		echo "The maximal available machines for you are $max"
		read user_number	
	done
	
	# start machines
	start_machines.sh $user_number
	

else
	if [ "$status_of_chef_server" = "OFF" ]; then
		echo "Chef Server is NOT ready!!!..."
	fi
	if [ "$status_of_the_insfrastructure" = "OFF" ]; then
		echo "The Infrastructure is NOT ready!!!..."
	fi 
fi


