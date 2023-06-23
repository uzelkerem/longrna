#!/bin/bash
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/rawdata"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/03_UMI_extraction"
mkdir -p "${output_folder}"

log_dir="${output_folder}/logs"
mkdir -p "${log_dir}"

for i in 4 5 6 7 8 11 12 13 14 15 19 20 21 24; do
  file_R1="${input_folder}/HSC_${i}_R1.fastq.gz"
  file_R2="${input_folder}/HSC_${i}_R2.fastq.gz"
  output_file_R1="${output_folder}/HSC_${i}_R1_processed.fastq.gz"
  output_file_R2="${output_folder}/HSC_${i}_R2_processed.fastq.gz"
  log_file="${log_dir}/HSC_${i}_extraction_log.txt"

  umi_tools extract -I "${file_R2}" -S "${output_file_R2}" \
    --read2-in "${file_R1}" --read2-out "${output_file_R1}" \
    --bc-pattern NNNNNNNN \
    --log "${log_file}"
done