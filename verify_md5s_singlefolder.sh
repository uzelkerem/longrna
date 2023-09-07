#!/bin/bash

# Define the log file path
log_file="log.txt"

# Initialize or clear the log.txt file
> "$log_file"

# Check if MD5.txt exists in the current directory
if [ ! -f md5sums.txt ]; then
    echo "md5sums.txt not found. Exiting." | tee -a "$log_file"
    exit 1
fi

# Create or clear the MD5_calc.txt file
> MD5_calc.txt

# Loop through all *fastq.gz files in the current directory
for file_name in *fastq.gz; do
    # Compute MD5 hash for the current file
    computed_hash=$(md5 -q "$file_name")

    # Append the computed hash and filename to MD5_calc.txt
    echo "$computed_hash  $file_name" >> MD5_calc.txt
done

# Compare MD5_calc.txt with md5sums.txt
while read -r line; do
    file_hash=$(echo $line | awk '{print $1}')
    file_name=$(echo $line | awk '{print $2}')
    
    if grep -q "$file_hash  $file_name" MD5_calc.txt; then
        echo "$file_name verified successfully" | tee -a "$log_file"
    else
        echo "Mismatch for $file_name" | tee -a "$log_file"
    fi
done < md5sums.txt