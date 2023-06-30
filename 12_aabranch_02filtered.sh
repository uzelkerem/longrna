#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/aa_branch/09_01_umidedup_alig_star_trim"


output_folder_main="/mnt/groupMansuy/kerem/tasks/longrna/exp/aa_branch"
output_folder0="${output_folder_main}/12_02_merged_featureCounts_filtered"

genome_dir="/mnt/groupMansuy/kerem/tasks/smallrna/genome_anara"

mkdir -p "${output_folder0}"


# Create a log directory if it doesn't exist
log_dir0="${output_folder0}/logs"
mkdir "${log_dir0}"


# Set the number of threads to use
num_threads=12


# Create an array to store the filenames of all BAM files
bam_files=(${reads_dir}/*.bam)


# Run featureCounts for all BAM files
featureCounts -T $num_threads -t exon -g gene_id -a ${genome_dir}/filtered_gencode.vM29.primary_assembly.annotation.gtf \
  -o "${output_folder0}/aabranch_counts_filtered.txt" "${bam_files[@]}" > "${log_dir0}/aabranchfeatureCounts_filtered.log" 2>&1

# Run featureCounts for all BAM files
featureCounts -T $num_threads -s 2 -t exon -g gene_id -a ${genome_dir}/filtered_gencode.vM29.primary_assembly.annotation.gtf \
  -o "${output_folder0}/aabranch_counts_s02_filtered.txt" $(ls $reads_dir/*.bam) > "${log_dir0}/aabranchfeatureCounts_s02.log" 2>&1

# Run featureCounts for all BAM files
#featureCounts -T $num_threads -s 1 -t exon -g gene_id -a ${genome_dir}/gencode.vM29.primary_assembly.annotation.gtf \
#  -o "${output_folder0}/aabranch_counts_s01.txt" $(ls $reads_dir/*.bam) > "${log_dir0}/aabranchfeatureCounts_s01.log" 2>&1
