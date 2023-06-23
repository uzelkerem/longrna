#!/bin/bash
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/03_UMI_extraction"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/04_trimmed_data"
mkdir "${output_folder}"

# Create a log directory if it doesn't exist
log_dir="${output_folder}/logs"
mkdir "${log_dir}"

for file in ${input_folder}/*.fq.gz; do
  filename=$(basename "$file")
  sample="${filename%.*}"
  trim_galore "$file" -q 30 --length 30 --trim-n --stringency 2 -o ${output_folder} > "${log_dir}/${sample}.log" 2>&1
done