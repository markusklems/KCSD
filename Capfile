load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
# Capfile, used to reinstall the Chef-Server

# Preparation
# nodes array contains all IPs of machines in the infrastructure
nodes = []
File.open("#{ENV['CHEF_HOME']}/tmp/n_ips.txt") do |f|
  nodes = f.each_line.map{|l| l.chomp}
end

role :chef_server, '184.73.174.216'
role :murder_server, '107.21.97.16'
role :nodes, *(nodes.map{|n| "#{n}" })

set :user, 'ubuntu'
#set :use_sudo, true
#set :port, 22
ssh_options[:keys] = ["#{ENV['CHEF_HOME']}/pem/chef-ec2.pem"]
#ssh_options[:timeout] = 30

# role :chefserver, '184.73.174.216'

desc 'Add a new user "chef" to a vhost "/chef" in RabbitMQ'
task :rabbitmq, :roles => :chef_server do
	# a new virtual host
	run "sudo rabbitmqctl add_vhost /chef"
	
	# a new user with a given password
	run "sudo rabbitmqctl add_user chef lha2910"
	
	# set permissions for the user "chef" in the virtual host "/chef"
	run "sudo rabbitmqctl set_permissions -p /chef chef '.*' '.*' '.*'"
end

desc 'Create the Murder Folder in Murder Server and Nodes'
task :make_murder_folder, :roles => [:murder_server, :nodes] do
	run "mkdir -p $HOME/murder"
end

desc 'Delete the Murder Folder in Murder Server and Nodes'
task :delete_murder_folder, :roles => [:murder_server, :nodes] do
	run "rm -rf $HOME/murder"
end

desc 'Deploy cassandra, control the remoted Murder Server'
task :execute_murder, :roles => :murder_server do
	run "$HOME/murder/execute_murder.sh"
end
