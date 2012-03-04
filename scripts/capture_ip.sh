#! /bin/bash

# DESC
# capture the private IP addresses from the given instances for nodes
# capture the private IP address of Murder Server

# get the actual state of the infrastructure
if [ -e $CHEF_HOME/tmp/state.txt ]; then
	rm $CHEF_HOME/tmp/state.txt
fi
knife ec2 server list > $CHEF_HOME/tmp/state.txt

# CAPTURE PRIVATE IPs FOR NODES
# get the n running machines from n_machines.txt list and save them into machines array
n_machines=($(cat $CHEF_HOME/tmp/n_machines.txt))

# get the size of this array
size=${#n_machines[@]}

# delete the old ip list
if [ -e $CHEF_HOME/tmp/n_ips.txt ]; then
	rm $CHEF_HOME/tmp/n_ips.txt
fi

# iterate
for ((i=0;i<size;i++))
do
	machine=${n_machines[$i]}
	echo "$machine has the private IP address..."
	awk '/'$machine'/ { print $3 }' $CHEF_HOME/tmp/state.txt | tee -a $CHEF_HOME/tmp/n_ips.txt 
done

# make a copy for Capistrano
cp $CHEF_HOME/tmp/n_ips.txt $CHEF_HOME/MURDER/n_ips.txt

# CAPTURE PRIVATE IP FOR MUDER SERVER
# read configuration file
source $CHEF_HOME/config/config.cfg

# delete the old ip
if [ -f $CHEF_HOME/tmp/murder_ip.txt ]; then
	rm $CHEF_HOME/tmp/murder_ip.txt
fi

# get the private IP
echo "Murder Server with ID $murder_instance_id has the IP address..."
awk '/'$murder_instance_id'/ { print $3 }' $CHEF_HOME/tmp/state.txt | tee -a $CHEF_HOME/tmp/murder_ip.txt

# make a copy for Capistrano
cp $CHEF_HOME/tmp/murder_ip.txt $CHEF_HOME/MURDER/murder_ip.txt
