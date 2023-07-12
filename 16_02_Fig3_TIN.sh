#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/_oldbranch/09_02_umidedup_alig_star_sortmerna/"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/ee_fig3/preprocess_01/_oldbranch/16_02_TinScore/"
genome_dir="/mnt/groupMansuy/kerem/tasks/longrna/genome"

#bamnames="EE_HSC11,EE_HSC12,EE_HSC14,EE_HSC15,EE_HSC16,EE_HSC18,EE_HSC19,EE_HSC1_,EE_HSC20,EE_HSC21,EE_HSC23,EE_HSC24,EE_HSC26,EE_HSC27,EE_HSC28,EE_HSC29,EE_HSC31,EE_HSC32,EE_HSC3_,EE_HSC4_,EE_HSC6_,EE_HSC7_,EE_HSC8_,EE_HSC9_"
#modified_bamlist.txt

bamnames="EE_HSC8_,EE_HSC9_"

mkdir -p "${output_folder}"
${genome_dir}/GRCm39_genomic.bed12

calculate-tin.py -r ${genome_dir}/GRCm39_genomic.bed12 -i ${reads_dir}/modified_bamlist2.txt --names=$bamnames -p 12 1> ${output_folder}/Fig3_results.tsv






