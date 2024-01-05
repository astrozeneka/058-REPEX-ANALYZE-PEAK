#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J index-bam
#SBATCH -A proj5057

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR7062760"
)

for genome in "${genomes[@]}"
do
  echo "Indexing ${genome} BAM"
  samtools index "data/raw_map/${genome}.bam"
done
echo "Done"