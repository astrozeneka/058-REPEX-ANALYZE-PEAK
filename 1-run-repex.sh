#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 40
#SBATCH -t 120:00:00
#SBATCH -J analyze-peak-betta
#SBATCH -A proj5057

module load Singularity/3.3.0

cd data
singularity exec --bind ${PWD}:/data/ shub://repeatexplorer/repex_tarean analyze -v -p /data/re_output "NC_040889.2-2300000-2400000.fasta"