#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/rawdata"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/s2n_preprocess_01/02_FQscreen_raw_data"
mkdir $output_folder


# Run FastQ-screen with multiref on all files matching *trimmed.fq.gz in the input folder
for file in "${input_folder}"/*fastq.gz; do
  fastq_screen --aligner bowtie2 --threads 4 \
  --outdir $output_folder $file
done