#!/bin/bash

# Create an associative array to store the mapping of chromosome names
declare -A chr_mapping=(
    ["1"]="NC_000067.7"
    ["2"]="NC_000068.8"
    ["3"]="NC_000069.7"
    ["4"]="NC_000070.7"
    ["5"]="NC_000071.7"
    ["6"]="NC_000072.7"
    ["7"]="NC_000073.7"
    ["8"]="NC_000074.7"
    ["9"]="NC_000075.7"
    ["10"]="NC_000076.7"
    ["11"]="NC_000077.7"
    ["12"]="NC_000078.7"
    ["13"]="NC_000079.7"
    ["14"]="NC_000080.7"
    ["15"]="NC_000081.7"
    ["16"]="NC_000082.7"
    ["17"]="NC_000083.7"
    ["18"]="NC_000084.7"
    ["19"]="NC_000085.7"
    ["X"]="NC_000086.8"
    ["Y"]="NC_000087.8"
)

# Iterate through the chromosome files and rename them
for chrom in {1..19} X Y; do
    old_file="chr${chrom}.fa"
    new_file="${chr_mapping[$chrom]}.fa"

    # Check if the old file exists before renaming
    if [ -e "$old_file" ]; then
        mv "$old_file" "$new_file"
        echo "Renamed $old_file to $new_file"
    else
        echo "File $old_file not found. Skipping..."
    fi
done
