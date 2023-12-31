#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/09_umidedup_alig_star_trim"

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
bam_files=(${reads_dir}/*.bam)


# Run featureCounts for all BAM files
#featureCounts -T $num_threads -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf \
#  -o "${output_folder0}/all_counts.txt" "${bam_files[@]}" > "${log_dir0}/featureCounts.log" 2>&1

# Run featureCounts for all BAM files
featureCounts -T $num_threads -s 2 -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf \
  -o "${output_folder0}/all_counts_s02.txt" $(ls $reads_dir/*.bam) > "${log_dir0}/featureCounts_s02.log" 2>&1
