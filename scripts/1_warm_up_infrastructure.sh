#! /bin/bash

# DESC
# configure Chef-Server at every start

# reset the trigger status for chef-server and infrastructure
sed -i 's/status_of_chef_server=.*/status_of_chef_server=OFF/g' $CHEF_HOME/config/config.cfg
sed -i 's/status_of_the_insfrastructure=.*/status_of_the_insfrastructure=OFF/g' $CHEF_HOME/config/config.cfg

# start Chef-Server
start_chef_server.sh

# start Murder-Server
start_murder_server.sh

# configure the RabbitMQ message broker
# no output on STDERR, saved in a log file
echo ":::::::::::::::::: configuring RabbitMQ message broker"
echo "Please wait..."
#cap rabbitmq -l caplog.txt
cap rabbitmq

if [ $? -eq 0 ]; then

	# cap rabbitmq is successful
	echo "The warm up phase is done!!!"
	sed -i 's/status_of_chef_server=.*/status_of_chef_server=ON/g' $CHEF_HOME/config/config.cfg
else

	# cap rabbitmq is unsuccessful
	echo "Configuring RabbitMQ is not successful!!"
fi


