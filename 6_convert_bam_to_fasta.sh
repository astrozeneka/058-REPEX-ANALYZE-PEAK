#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J export-fasta
#SBATCH -A proj5057

# In this script, we will convert the BAM files to FASTA files
module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR7062760"
)

for genome in "${genomes[@]}"
do
  echo "Converting ${genome} to FASTA"
  samtools fasta "data/raw_map/${genome}_mapped.bam" \
    > "data/raw_map/${genome}_mapped.fasta"
done
echo "Done"