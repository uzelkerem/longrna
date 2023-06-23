#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/04_trimmed_data"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/07_01_FQscreen_trimmed_data"
mkdir $output_folder


# Run FastQ-screen with multiref on all files matching *trimmed.fq.gz in the input folder
for file in "${input_folder}"/*fq.gz; do
  fastq_screen --aligner bowtie2 --threads 4 \
  --outdir $output_folder $file
done