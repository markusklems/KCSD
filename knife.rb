current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT

# chef-workstation user
node_name                "chef-workstation"

# private key for chef-workstation user in order to make REST API requests to Chef Server
client_key               "#{ENV['CHEF_HOME']}/pem/chef-workstation.pem" 

# chef-validator user
validation_client_name   "chef-validator"

# private key for chef-validator user in order to make REST API requests to Chef Server
validation_key           "#{ENV['CHEF_HOME']}/pem/validation.pem"

# URL for the Chef Server
chef_server_url          "http://184.73.174.216:4000"

cache_type               'BasicFile'
cache_options( :path => "#{ENV['CHEF_HOME']}/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

# configurations for KNIFE command
knife[:identify_file] = "#{ENV['CHEF_HOME']}/pem/chef-ec2.pem" # the private key for SSH connections to EC2 instances
knife[:aws_ssh_key_id] = "chef-ec2" # ssh key in Amazon
knife[:aws_access_key_id]  = "AKIAIAMSYWRWA5KVUVQQ" # the access key ID can be read in Amazon web site
knife[:aws_secret_access_key] = "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" # the secret access key can be from Amazon web site
knife[:ssh_user] = "ubuntu" # user for the AMI Linux
knife[:use_sudo]  = "true" # use command as root
knife[:region] = "us-east-1" # the region where EC2 instances will be placed 
knife[:image] = "ami-71dc0b18" # the specific AMI for instantiating new EC2 machine
knife[:flavor] = "m1.small" # the AMI type
