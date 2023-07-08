#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/_oldbranch/08_02_alignment_star_sortmerna"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/_oldbranch/09_02_umidedup_alig_star_sortmerna"

# Create output folder if it doesn't exist
mkdir -p "${output_folder}"

# Loop over each sample
for file in ${reads_dir}/*.bam; do
  # Get sample name
  sample=$(basename "$file" .fq.gz)

  #--output-stats="${output_folder}/stats"
  # Deduplicate BAM file using umi_tools dedup
  umi_tools dedup \
    --stdin="${file}" \
    --log="${output_folder}/${sample}_dedup.log" \
    --stdout "${output_folder}/${sample}_dedup.bam" --buffer-whole-contig

  # Generate index for the deduplicated BAM file
  samtools index "${output_folder}/${sample}_dedup.bam"
done