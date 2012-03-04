#!/bin/bash

# reading the config file
source $CHEF_HOME/config/config.cfg

# stop Murder-Server via EC2 API Tools
echo ":::::::::::::::::: stopping Murder-Server"
ec2-stop-instances $murder_instance_id

