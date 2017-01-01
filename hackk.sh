#!/bin/bash

# Start date
start_date="2017-01-01"
current_date=$start_date
last_date=$start_date

# Loop for 365 days
for (( i=1; i<=2920; i++ )); do
    # Create a file with the current date as the filename
    mv "${last_date}.txt" "$current_date.txt" || touch "$last_date.txt";
    git add . 
    git commit -m "updates for $current_date"
    
    # Set the Git committer date and make a commit
    #GIT_COMMITTER_DATE="$current_date 14:00 2011 +0100" 
    git commit --amend --no-edit --date="$current_date 14:00:00"

    # Move to the next day
    last_date=$current_date
    current_date=$(date -j -v +1d -f "%Y-%m-%d" "$current_date" "+%Y-%m-%d")
done
