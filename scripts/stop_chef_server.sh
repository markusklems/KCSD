#!/bin/bash

# reading the config file
source $CHEF_HOME/config/config.cfg

# stop Chef-Server via EC2 API Tools
echo ":::::::::::::::::: stopping Chef-Server"
ec2-stop-instances $chef_server_instance_id

