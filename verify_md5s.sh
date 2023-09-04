#!/bin/bash

# Define the log file path
log_file="log.txt"

# Initialize or clear the log.txt file
> "$log_file"

# Loop through all subdirectories starting with PM
for dir in PM_*/; do
    echo "Checking directory: $dir" | tee -a "$log_file"
    
    # Navigate into the directory
    cd "$dir"
    
    # If MD5.txt doesn't exist in the directory, skip to the next
    if [ ! -f MD5.txt ]; then
        echo "MD5.txt not found in $dir. Skipping." | tee -a "../$log_file"
        cd ..
        continue
    fi
    
    # Create or clear the MD5_calc.txt file
    > MD5_calc.txt

    while read -r line; do
        file_hash=$(echo $line | awk '{print $1}')
        file_name=$(echo $line | awk '{print $2}')
        
        computed_hash=$(md5 -q "$file_name")

        # Append the computed hash and filename to MD5_calc.txt
        echo "$computed_hash  $file_name" >> MD5_calc.txt

        if [ "$file_hash" != "$computed_hash" ]; then
            echo "Mismatch for $file_name in $dir" | tee -a "../$log_file"
        else
            echo "$file_name in $dir verified successfully" | tee -a "../$log_file"
        fi
    done < MD5.txt
    
    # Navigate back to the parent directory
    cd ..
done
