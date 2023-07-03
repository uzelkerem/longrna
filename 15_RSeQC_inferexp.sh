#!/bin/bash

# gtfD branch
#for i in 1 2 3 4 5 6 7 8 11 12 13 14 15 19 20 21 24; do
#infer_experiment.py -r /mnt/groupMansuy/kerem/tasks/longrna/genome/GRCm39_genomic.bed12 -i /mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/08_alignment_star_trim/HSC_${i}_R1_processed_trimmed_Aligned.sortedByCoord.out.bam > /mnt/groupMansuy/kerem/tasks/longrna/exp/all_preprocess_01/15_RSeQC/HSC${i}.txt
#done

# gtfA branch
for i in 1 2 3 4 5 6 7 8 11 12 13 14 15 19 20 21 24; do
infer_experiment.py -r /mnt/groupMansuy/kerem/tasks/smallrna/genome_anara/gencode.vM29.primary_assembly.annotation.bed12 -i /mnt/groupMansuy/kerem/tasks/longrna/exp/aa_branch/08_01_alignment_star_trim/HSC_${i}_R1_processed_trimmed_Aligned.sortedByCoord.out.bam > /mnt/groupMansuy/kerem/tasks/longrna/exp/aa_branch/15_RSeQC/HSC${i}.txt
done
