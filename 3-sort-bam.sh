#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J sort-bam
#SBATCH -A proj5057

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR7062760"
)

for genome in "${genomes[@]}"
do
  echo "Sorting ${genome} BAM"
  samtools sort -@ 96 "data/raw_map/${genome}_unsorted.bam" \
    -o "data/raw_map/${genome}.bam"
done
echo "Done"