#! /bin/bash

# DESC
# stop the entire infrastructure

# stop Murder Server
stop_murder_server.sh

# stop Chef Server
stop_chef_server.sh

# stop all machines
stop_all_machines.sh
