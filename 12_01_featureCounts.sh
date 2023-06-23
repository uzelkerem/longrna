#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/09_01_umidedup_alig_star_trim"

output_folder_main="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01"
output_folder0="${output_folder_main}/12_01_featureCounts_umidedup_alig_star_trim"
output_folder1="${output_folder_main}/12_01s1_featureCounts_umidedup_alig_star_trim"
output_folder2="${output_folder_main}/12_01s2_featureCounts_umidedup_alig_star_trim"



genome_dir="/mnt/groupMansuy/kerem/tasks/longrna/genome"
mkdir "${output_folder0}"
mkdir "${output_folder1}"
mkdir "${output_folder2}"

# Create a log directory if it doesn't exist
log_dir0="${output_folder0}/logs"
log_dir1="${output_folder1}/logs"
log_dir2="${output_folder2}/logs"
mkdir "${log_dir0}"
mkdir "${log_dir1}"
mkdir "${log_dir2}"

# Set the number of threads to use
num_threads=8

# Run featureCounts for each bam file in the reads directory
for file in ${reads_dir}/*.bam; do
  sample=$(basename "$file" .fq.gz)
  #the one without -s flag, thus, the analysis will be strand agnostic
  featureCounts -T 5 -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf -o \
  "${output_folder0}/${sample}_counts.txt" ${file} > "${log_dir0}/${sample}.log" 2>&1 

  #-s for strand specific counting, 2 for reversely stranded
  featureCounts -T 5 -s 1 -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf -o \
  "${output_folder1}/${sample}_counts.txt" ${file} > "${log_dir1}/${sample}.log" 2>&1

  featureCounts -T 5 -s 2 -t exon -g gene_id -a ${genome_dir}/GCF_000001635.27_GRCm39_genomic.gtf -o \
  "${output_folder2}/${sample}_counts.txt" ${file} > "${log_dir2}/${sample}.log" 2>&1 
done