#!/bin/bash

for i in $(seq 0 100 900); do
start_idx=$((i + 1))
end_idx=$((i + 100))
job_file="slurm_jobs/job_${start_idx}_${end_idx}.slurm"

cat <<EOT > $job_file
#!/bin/bash
#SBATCH --job-name=run_model
#SBATCH --output=~/project_directory/slurm_logs/job_%j.out
#SBATCH --error=~/project_directory/slurm_logs/job_%j.err
#SBATCH --time=01:00:00
#SBATCH --mem=4G

module load R

Rscript ~/project_directory/scripts/run_model.R $start_idx $end_idx
EOT
done