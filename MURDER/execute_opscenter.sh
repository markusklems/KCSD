#! /bin/bash

# DESC
# execute OpsCenter process

# start time
#START=$(date +%s)

cap kcsd:install_opscenter
cap kcsd:start_opscenter

# end time
#END=$(date +%s)

# diff
#DIFF=$(( $END - $START ))
#echo "The Cassandra process took $DIFF seconds"
