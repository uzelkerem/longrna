#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/04_trimmed_data"
output_folder="${input_folder}/unzipped"
mkdir $output_folder


# Run FastQ-screen with multiref on all files matching *trimmed.fq.gz in the input folder
for file in "${input_folder}"/*fq.gz; do
    filename=$(basename "$file")
    output_file="${output_folder}/${filename%.gz}"
    gunzip -c "$file" > "$output_file"
done

mv "${input_folder}"/*fq "${output_folder}"