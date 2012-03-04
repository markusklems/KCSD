#! /bin/bash

# DESC
# execute the whole process with murder

# start time
START=$(date +%s)

cap kcsd:prepare_distribution
cap kcsd:start_tracker
cap kcsd:get_source_files_for_the_seeder
cap kcsd:create_torrent_in_the_seeder
cap kcsd:start_seeding
cap kcsd:start_peering
cap kcsd:clean_temp_files
cap kcsd:stop_all

# end time
END=$(date +%s)

# diff
DIFF=$(( $END - $START ))
echo "The Murder distribution process took $DIFF seconds"

