#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/_oldbranch/09_01_umidedup_alig_star_trim"


output_folder_main="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/_oldbranch/12_01_featCounts_umidedup_alig_star_trim"

output_folder0="${output_folder_main}/s00"
output_folder2="${output_folder_main}/s02"


genome_dir="/mnt/groupMansuy/kerem/tasks/longrna/genome"

mkdir -p "${output_folder0}"
mkdir -p "${output_folder2}"


# Create a log directory if it doesn't exist
log_dir0="${output_folder0}/logs"
log_dir2="${output_folder2}/logs"

mkdir "${log_dir0}"
mkdir "${log_dir2}"



# Set the number of threads to use
num_threads=12


# Create an array to store the filenames of all BAM files
bam_files=(${reads_dir}/*.bam)


# Run featureCounts for all BAM files
featureCounts -T $num_threads -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf \
  -o "${output_folder0}/fig3_counts_gtfA_s00.txt" "${bam_files[@]}" > "${log_dir0}/fig3_counts_gtfA_s00.log" 2>&1

# Run featureCounts for all BAM files
featureCounts -T $num_threads -s 2 -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf \
  -o "${output_folder2}/fig3_counts_gtfA_s02.txt" $(ls $reads_dir/*.bam) > "${log_dir2}/fig3_counts_gtfA_s02.log" 2>&1

# Run featureCounts for all BAM files
#featureCounts -T $num_threads -s 1 -t exon -g gene_id -a ${genome_dir}/gencode.vM29.primary_assembly.annotation.gtf \
#  -o "${output_folder0}/aabranch_counts_s01.txt" $(ls $reads_dir/*.bam) > "${log_dir0}/aabranchfeatureCounts_s01.log" 2>&1
