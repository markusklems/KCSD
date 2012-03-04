#!/bin/bash

# DESC
# start Murder Server

# read the config file
source $CHEF_HOME/config/config.cfg

# start Murder-Server via EC2 API Tools
echo ":::::::::::::::::: starting Murder Server"
ec2-start-instances $murder_instance_id

# make a pause so that the instance has enough time
sleep 10

# assign the elastic IP
echo ":::::::::::::::::: assigning the elastic IP to Murder Server"
ec2-associate-address -i $murder_instance_id  $elastic_ip_2
