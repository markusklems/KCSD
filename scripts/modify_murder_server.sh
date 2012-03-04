#! /bin/bash

# DESC
# modify Murder Server
# the changed files are ..../lib/murder/murder.rb, ..../lib/murder/admin.rb, ..../lib/capistrano/...../murder.rb

echo "modifying Murder Server..."
source $CHEF_HOME/config/config.cfg
scp -i $CHEF_HOME/pem/chef-ec2.pem $CHEF_HOME/murder/lib/murder/*rb ubuntu@$elastic_ip_2:/home/ubuntu/.rvm/gems/ruby-1.9.2-p290/gems/murder-0.1.2/lib/murder
scp -i $CHEF_HOME/pem/chef-ec2.pem $CHEF_HOME/murder/lib/capistrano/recipes/deploy/strategy/*rb ubuntu@$elastic_ip_2:/home/ubuntu/.rvm/gems/ruby-1.9.2-p290/gems/murder-0.1.2/lib/capistrano/recipes/deploy/strategy
