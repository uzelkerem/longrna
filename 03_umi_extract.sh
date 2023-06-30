#!/bin/bash
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/rawdata_fig3"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/03_UMI_extraction"
mkdir -p "${output_folder}"

# Create a log directory if it doesn't exist
log_dir="${output_folder}/logs"
mkdir "${log_dir}"

for file in ${input_folder}/*_R1.fastq.gz; do

  file2="${file/R1/R2}"

  base_name=$(basename "$file" .fastq.gz)
  base_name2="${base_name/R1/R2}"
  
  utf8_text="${output_folder}/${base_name2}_processed.fastq.qz"
  ascii_text=$(echo "$utf8_text" | iconv -f UTF-8 -t ASCII)

  umi_tools extract -I ${file2} -S ${ascii_text} \
  --read2-in=${file} \
  --read2-out="${output_folder}/${base_name}_processed.fastq.qz" \
  --bc-pattern=NNNNNNNN \
  --log="${log_dir}/${base_name}_log.txt"

done

#"${output_folder}/${base_name2}_processed.fastq.qz"
#ascii_text=$(echo "${output_folder}/${base_name2}_processed.fastq.qz" | iconv -f UTF-8 -t ASCII)