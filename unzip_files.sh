#!/bin/bash

# Define the log file
log_file="unzip_log.txt"

# Initialize or clear the log file
> "$log_file"

# Loop through all .zip files in the current directory
for zip_file in *.zip; do
    # Check if the glob gets a hit
    if [[ -f $zip_file ]]; then
        # Try to unzip the file
        unzip "$zip_file" >> "$log_file" 2>&1
        
        # Check the success of the unzip operation
        if [ $? -eq 0 ]; then
            echo "$zip_file was unzipped successfully." >> "$log_file"
        else
            echo "Error unzipping $zip_file." >> "$log_file"
        fi
    else
        echo "No .zip files found." >> "$log_file"
        break
    fi
done