#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/rawdata_fig3"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/01_FastQC_raw_data"
mkdir -p "${output_folder}"


# Create a log directory if it doesn't exist
log_dir="${output_folder}/logs"
mkdir -p "${log_dir}"

# Run FastQC on all files matching *trimmed.fq.gz in the input folder
for file in "${input_folder}"/*fastq.gz; do
  base_name=$(basename "${file}")
  log_file="${log_dir}/${base_name}.log"
  fastqc -t 8 -o "${output_folder}" "${file}" > "${log_file}" 2>&1
done


