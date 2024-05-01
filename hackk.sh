#!/bin/bash
# Start date
start_date="2024-05-01"
current_date=$start_date
last_date=$start_date
# Loop for 2920 days (about 8 years)
for ((i=1; i<=26; i++)); do 
    # Create a file with the current date as the filename
    mv "${last_date}.txt" "$current_date.txt" || touch "$last_date.txt"; git add .
    git commit -m "updates for $current_date"
    # Set the Git committer date and make a commit 
    git commit --amend --no-edit --date="$current_date 14:00:00"
    # Move to the next day
    last_date=$current_date
    current_date=$(date -d "$current_date + 1 day" "+%Y-%m-%d")
done
