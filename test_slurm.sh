#!/bin/bash
#SBATCH --job-name=test_job
#SBATCH --output=~/project_directory/slurm_logs/test_%j.out
#SBATCH --error=~/project_directory/slurm_logs/test_%j.err
#SBATCH --time=00:05:00
#SBATCH --mem=1G

echo "This is a test job."
echo "Running on host: $(hostname)"
echo "Current directory: $(pwd)"