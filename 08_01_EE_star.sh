#!/bin/bash

# Set the input folder and output folder paths
reads_dir="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/04_trimmed_data"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/00_EEbranch/08_01_alignment_star_trim"
genome_dir="/mnt/groupMansuy/kerem/tasks/longrna/genome_EE/staridx"

mkdir -p "${output_folder}"

# Create a log directory if it doesn't exist
log_dir="${output_folder}/logs"
mkdir "${log_dir}"

# Set the number of threads to use
num_threads=8

# Run STAR alignment for each FASTQ file in the reads directory
for file in ${reads_dir}/*fq.gz; do
  sample=$(basename "$file" .fq.gz)

  # Run STAR alignment and redirect both stdout and stderr to the log file
  STAR \
    --runThreadN ${num_threads} \
    --genomeDir ${genome_dir} \
    --sjdbGTFfile /mnt/groupMansuy/kerem/tasks/longrna/genome_EE/Mus_musculus.GRCm39.109.gtf \
    --readFilesCommand zcat \
    --readFilesIn ${file} \
    --outFileNamePrefix ${output_folder}/${sample}_ \
    --outSAMtype BAM SortedByCoordinate > "${log_dir}/${sample}.log" 2>&1

  # Generate index for the output BAM file
  samtools index ${output_folder}/${sample}_Aligned.sortedByCoord.out.bam
  samtools idxstats ${output_folder}/${sample}_Aligned.sortedByCoord.out.bam > ${output_folder}/${sample}_Aligned.sortedByCoord.out.idxstats
  samtools flagstat ${output_folder}/${sample}_Aligned.sortedByCoord.out.bam > ${output_folder}/${sample}_Aligned.sortedByCoord.out.flagstat
  
done