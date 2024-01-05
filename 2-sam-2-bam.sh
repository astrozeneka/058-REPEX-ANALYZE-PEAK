#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J analyze-peak-betta
#SBATCH -A proj5057

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR7062760"
)

for genome in "${genomes[@]}"
do
  echo "Converting ${genome} to BAM"
  samtools view -@ 40 -b "data/raw_map/${genome}.sam" \
    > "data/raw_map/${genome}_unsorted.bam"
done
echo "Done"