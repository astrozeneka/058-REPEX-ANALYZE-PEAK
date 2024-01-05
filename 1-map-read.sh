#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J analyze-peak-betta
#SBATCH -A proj5057

module purge
module load BWA/0.7.17-intel-2019b

genomes=(
  "SRR7062760"
)

mkdir -p data/raw_map
for genome in "${genomes[@]}"
do
  bwa mem -t 96 \
        "data/NC_040889.2-2300000-2400000.fasta" \
        "/tarafs/data/home/hrasoara/proj5034-AGBKU/Download_BettaFish/trimmed/${genome}_1_pairend_trimmed.fq" \
        "/tarafs/data/home/hrasoara/proj5034-AGBKU/Download_BettaFish/trimmed/${genome}_2_pairend_trimmed.fq" \
        > "data/raw_map/${genome}.sam"
done
