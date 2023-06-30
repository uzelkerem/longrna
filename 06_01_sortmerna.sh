#!/bin/bash

# Set the input folder and output folder paths
input_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/04_trimmed_data/unzipped"
output_folder="/mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/06_sortmernaed_data"
mkdir -p "${output_folder}"

# Create a log directory if it doesn't exist
log_dir="${output_folder}/logs"
mkdir -p "${log_dir}"

working_dir="${output_folder}/deneme"
mkdir -p "${working_dir}"


for file in "${input_folder}"/*_trimmed.fq; do

    # Get sample name
    base_name=$(basename "$file" .fq)
    output_file="${output_folder}/${base_name}"  # Remove the extension before adding new ones
    log_file="${log_dir}/${base_name}.log"
    rm "${working_dir}"/kvdb/* #we have to clean it somehow  
    rm "${working_dir}"/idx/* #we have to clean it somehow  
    rm "${working_dir}"/readb/* #we have to clean it somehow  
    
    sortmerna --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/silva-euk-28s-id98.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/silva-euk-18s-id95.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/silva-arc-16s-id95.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/silva-arc-23s-id98.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/silva-bac-16s-id90.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/silva-bac-23s-id98.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/rfam-5.8s-database-id98.fasta \
    --ref /mnt/groupMansuy/kerem/tasks/longrna/genome/rRNA_databases/rfam-5s-database-id98.fasta \
    --workdir $working_dir \
    --reads $file --threads 12 \
    --aligned "${output_file}.aligned" --other "${output_file}.other" --fastx > "${log_file}" 2>&1
    done