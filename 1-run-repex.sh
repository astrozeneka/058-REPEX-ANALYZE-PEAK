#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J analyze-peak-betta
#SBATCH -A proj5057

module load Singularity/3.3.0

cd data
singularity exec shub://repeatexplorer/repex_tarean seqclust \
    -p -t -c 64 -v "data/repex-output" \
    "NC_040889.2-2300000-2400000.fasta"
echo "Done"