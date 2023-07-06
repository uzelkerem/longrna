#!/bin/bash

# Set the input folder and output folder paths
# 1 is for the reads before deduplication via umi tools and 2 is for the reads after deduplication via umi tools
reads_dir1="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/08_01_alignment_star_trim"
output_folder_main="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/10_01_picardmarkdup_trim"
output_folder1="${output_folder_main}/beforeumidedup"

reads_dir2="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/09_01_umidedup_alig_star_trim"
output_folder2="${output_folder_main}/afterumidedup"

# Create output folder if it doesn't exist
mkdir -p "${output_folder1}"
mkdir -p "${output_folder2}"

# Create a log directory if it doesn't exist
log_dir1="${output_folder1}/logs"
log_dir2="${output_folder2}/logs"
mkdir "${log_dir1}"
mkdir "${log_dir2}"

# Set the number of threads to use
num_threads=8



# Loop over each sample for reads after umidedup # aka loop2
for file in ${reads_dir2}/*.bam; do
  # Get sample name
  filename=$(basename "${file}")
  sample="${filename%.*}"

  # Mark duplicates using Picard MarkDuplicates
  picard MarkDuplicates \
    I= "${file}" \
    O= "${output_folder2}/${sample}_marked_duplicates.bam" \
    M= "${output_folder2}/${sample}_marked_duplicates_metrics.txt" \
    > "${log_dir2}/${sample}_mark_duplicates.log" 2>&1

  # Generate index for the deduplicated BAM file
  samtools index "${output_folder2}/${sample}_marked_duplicates.bam" 
done