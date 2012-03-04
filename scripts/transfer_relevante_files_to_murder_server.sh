#! /bin/bash

# DESC
# transfer the CAPFILE to Murder Server and all machines

# read config file
source $CHEF_HOME/config/config.cfg

# transfer files to Murder Server
echo "transfering files to Murder Server..."
scp -i $CHEF_HOME/pem/chef-ec2.pem -r $CHEF_HOME/MURDER/* ubuntu@$elastic_ip_2:/home/ubuntu/murder
