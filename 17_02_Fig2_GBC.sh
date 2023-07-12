#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/09_02_umidedup_alig_star_sortmerna"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/17_02_GeneBodyCov"
genome_dir="/mnt/groupMansuy/kerem/tasks/longrna/genome"

#bamnames="EE_HSC11,EE_HSC12,EE_HSC14,EE_HSC15,EE_HSC16,EE_HSC18,EE_HSC19,EE_HSC1_,EE_HSC20,EE_HSC21,EE_HSC23,EE_HSC24,EE_HSC26,EE_HSC27,EE_HSC28,EE_HSC29,EE_HSC31,EE_HSC32,EE_HSC3_,EE_HSC4_,EE_HSC6_,EE_HSC7_,EE_HSC8_,EE_HSC9_"
#modified_bamlist.txt

#bamnames="EE_HSC8_,EE_HSC9_"

mkdir -p "${output_folder}"

#calculate-tin.py -r ${genome_dir}/GRCm39_genomic.bed12 -i ${reads_dir}/modified_bamlist2.txt --names="HSC8,HSC9" -p 12 1> ${output_folder}/Fig3_results.tsv


# Read the modified_bamlist2.txt file line by line
while IFS= read -r line; do
  # Extract the file path from the line
  bam_file=$(echo "$line" | awk '{print $1}')
  
  # Extract the sample name from the file path
  sample_name=$(basename "$bam_file" R1_processed_trimmed.other_Aligned.sortedByCoord.out.bam_dedup.bam)

  # Run calculate-tin.py for the current line
  geneBody_coverage.py -r "${genome_dir}/GRCm39_genomic.bed12" -i "$bam_file" -o "${output_folder}/Fig2_results_${sample_name}"

done < ${reads_dir}/modified_bamlist.txt
