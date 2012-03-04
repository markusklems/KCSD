#! /bin/bash

# DESC
# execute Cassandra process

# start time
#START=$(date +%s)

cap kcsd:configure_cassandra
cap kcsd:start_cassandra

# end time
#END=$(date +%s)

# diff
#DIFF=$(( $END - $START ))
#echo "The Cassandra process took $DIFF seconds"
