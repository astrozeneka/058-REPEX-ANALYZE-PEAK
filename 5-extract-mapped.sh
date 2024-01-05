#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J extract-mapped
#SBATCH -A proj5057

# In this script we will extract only the read that are mapped to the reference

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR7062760"
)

for genome in "${genomes[@]}"
do
  echo "Extracting mapped reads from ${genome} BAM"
  samtools view -@ 40 -b -F 4 "data/raw_map/${genome}.bam" \
    > "data/raw_map/${genome}_mapped.bam"
done
echo "Done"
