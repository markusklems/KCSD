#!/bin/bash

# DESC
# start Chef-Server

# read the config file
source $CHEF_HOME/config/config.cfg

# start Chef-Server via EC2 API Tools
echo ":::::::::::::::::: starting Chef Server"
ec2-start-instances $chef_server_instance_id

# make a pause so that the instance has enough time
sleep 10

# assign the elastic IP
echo ":::::::::::::::::: assigning the elastic IP to Chef Server"
ec2-associate-address -i $chef_server_instance_id  $elastic_ip_1
