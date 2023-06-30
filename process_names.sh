#!/bin/bash

# Set the directory path
directory="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/01_FastQC_raw_data"

# Loop through each file in the directory
for file in "$directory"/*; do
  # Check if the file is a regular file
  if [[ -f "$file" ]]; then
    # Extract the base name of the file
    basename=$(basename "$file")
    # Remove everything before the first hyphen
    newname=${basename#*-}
    # Rename the file
    mv "$file" "$directory/$newname"
    echo "Renamed $basename to $newname"
  fi
done


