#!/bin/bash

# Start date
start_date="2024-05-01"
current_date=$start_date

# Loop for 26 days
for (( i=1; i<=26; i++ )); do
    # Create a file with the current date as the filename if it doesn't exist
    if [[ ! -f "$current_date.txt" ]]; then
        touch "$current_date.txt"
    fi
    
    # Add and commit changes
    git add .
    git commit -m "updates for $current_date"
    
    # Set the Git committer date and amend the commit
    export GIT_COMMITTER_DATE="$current_date 14:00:00"
    export GIT_AUTHOR_DATE="$current_date 14:00:00"
    git commit --amend --no-edit --date="$current_date 14:00:00"
    
    # Move to the next day
    current_date=$(date -d "$current_date +1 day" "+%Y-%m-%d")
done
