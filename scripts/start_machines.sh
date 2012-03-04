#! /bin/bash

# DESC
# start n machines in the infrastructure
# n <= max
echo ":::::::::::::::::: starting $1 machine(s)"

# n is the number of machines that users want to apply
n=$1

# select from the avaiable machines in the infrastructure
# and write into a new list
# awk reads line by line from the max_machines.txt list
# NR is the number of the line at the moment awk reads
# tee takes from stdin and writes to stdout
# -a append

# remove the old n_machines.txt list
if [ -e $CHEF_HOME/tmp/n_machines.txt ]; then
	rm $CHEF_HOME/tmp/n_machines.txt
fi

# read line by line from max_machines.txt list
# and write into a new list
for ((i=1;i<=$n;i++))
do
	awk "NR==$i{print }" $CHEF_HOME/tmp/max_machines.txt | tee -a $CHEF_HOME/tmp/n_machines.txt
done

# remove all new line chracters
# and put the stream into n_machines variable
n_machines=$(tr -d '\n' < $CHEF_HOME/tmp/n_machines.txt)

# start the selected machines via EC2 API tools
ec2-start-instances $n_machines
