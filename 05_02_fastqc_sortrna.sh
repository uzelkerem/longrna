#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/06_sortmernaed_data/zipped"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/06_02_FastQC_sortmernaed_data"
mkdir -p "${output_folder}"


# Create a log directory if it doesn't exist
log_dir="${output_folder}/logs"
mkdir -p "${log_dir}"

# Run FastQC on all files matching *trimmed.fq.gz in the input folder
for file in "${input_folder}"/*other.fq.gz; do
  base_name=$(basename "${file}")
  log_file="${log_dir}/${base_name}.log"
  fastqc -t 8 -o "${output_folder}" "${file}" > "${log_file}" 2>&1
done