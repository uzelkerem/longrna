#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/06_sortmernaed_data"
output_folder="${input_folder}/zipped"
mkdir -p "${output_folder}"

#zip the files and move them in a separate folder for downstream analysis
for file in "${input_folder}"/*other.fq; do
    gzip -c "$file" > "${file}.gz"
    mv "${file}.gz" "${output_folder}/"
done

for file in "${input_folder}"/*aligned.fq; do
    gzip -c "$file" > "${file}.gz"
    mv "${file}.gz" "${output_folder}/"
done