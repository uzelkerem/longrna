#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/aa_branch/09_01_umidedup_alig_star_trim"


output_folder_main="/mnt/groupMansuy/kerem/tasks/longrna/exp/aa_branch"
output_folder0="${output_folder_main}/12_merged_featureCounts_umidedup_alig_star_trim/uclu"

genome_dir="/mnt/groupMansuy/kerem/tasks/smallrna/genome_anara"

mkdir "${output_folder0}"


# Create a log directory if it doesn't exist
log_dir0="${output_folder0}/logs"
mkdir "${log_dir0}"


# Set the number of threads to use
num_threads=12


# Create an array to store the filenames of all BAM files
bam_files=(${reads_dir}/*.bam)


# Run featureCounts for all BAM files
#featureCounts -T $num_threads -t exon -g gene_id -a ${genome_dir}/gencode.vM29.primary_assembly.annotation.gtf \
#  -o "${output_folder0}/aabranchuclu_counts.txt" ${reads_dir}/HSC_15_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam ${reads_dir}/HSC_2_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam ${reads_dir}/HSC_1_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam  > "${log_dir0}/aabranch_uclufeatureCounts.log" 2>&1

# Run featureCounts for all BAM files
#featureCounts -T $num_threads -s 2 -t exon -g gene_id -a ${genome_dir}/gencode.vM29.primary_assembly.annotation.gtf \
#  -o "${output_folder0}/aabranchuclu_counts_s02.txt" ${reads_dir}/HSC_15_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam ${reads_dir}/HSC_2_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam ${reads_dir}/HSC_1_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam  > "${log_dir0}/aabranch_uclufeatureCounts_s02.log" 2>&1

# Run featureCounts for all BAM files
featureCounts -T $num_threads -s 1 -t exon -g gene_id -a ${genome_dir}/gencode.vM29.primary_assembly.annotation.gtf \
  -o "${output_folder0}/aabranchuclu_counts_s01.txt" ${reads_dir}/HSC_15_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam ${reads_dir}/HSC_2_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam ${reads_dir}/HSC_1_R1_processed_trimmed_Aligned.sortedByCoord.out.bam_dedup.bam  > "${log_dir0}/aabranch_uclufeatureCounts_s01.log" 2>&1