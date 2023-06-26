#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/09_01_umidedup_alig_star_trim"

output_folder_main="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01"
output_folder0="${output_folder_main}/12_merged_featureCounts_umidedup_alig_star_trim"

genome_dir="/mnt/groupMansuy/kerem/tasks/longrna/genome"
mkdir "${output_folder0}"


# Create a log directory if it doesn't exist
log_dir0="${output_folder0}/logs"
mkdir "${log_dir0}"


# Set the number of threads to use
num_threads=8


# Create an array to store the filenames of all BAM files
#bam_files=(${reads_dir}/*.bam)

# Loop through the BAM files and add them to the array
for file in ${reads_dir}/*.bam; do
  bam_files+=("$file")
done

# Run featureCounts for all BAM files
featureCounts -T $num_threads -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf \
  -o "${output_folder0}/all_counts.txt" "${bam_files[@]}" > "${log_dir0}/featureCounts.log" 2>&1
