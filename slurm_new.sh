#!/bin/bash
#SBATCH --job-name=run_models
#SBATCH --output=./slurm_logs/output_%A_%a.log
#SBATCH --ntasks=5
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=01:00:00
#SBATCH --array=1-5
#SBATCH --nodes=5

start_indices=(1 11 21 31 41)
end_indices=(10 20 30 40 50)

task_id=$SLURM_ARRAY_TASK_ID

Rscript ~/project_directory/scripts/run_model.R ${start_indices[$((task_id-1))]} ${end_indices[$((task_id-1))]}


# #!/bin/bash
# #SBATCH --job-name=run_models
# #SBATCH --output=logs/output_%A_%a.log  # Log files will be saved in the logs directory
# #SBATCH --ntasks=5
# #SBATCH --cpus-per-task=1
# #SBATCH --mem=4G
# #SBATCH --time=01:00:00
# #SBATCH --array=1-5
# #SBATCH --nodes=5
# 
# # Create directories if they don't exist
# mkdir -p ~/project_directory/results
# mkdir -p ~/project_directory/logs
# 
# start_indices=(1 11 21 31 41)
# end_indices=(10 20 30 40 50)
# 
# task_id=$SLURM_ARRAY_TASK_ID
# 
# # Run the R script with the corresponding start and end indices
# Rscript ~/project_directory/scripts/run_model.R ${start_indices[$((task_id-1))]} ${end_indices[$((task_id-1))]}




# #!/bin/bash
# #SBATCH --job-name=run_models      # Job name
# #SBATCH --output=output_%j.log     # Output log file (one for each job)
# #SBATCH --ntasks=1                 # Number of tasks (processes)
# #SBATCH --cpus-per-task=1          # Number of CPU cores per task
# #SBATCH --mem=4G                   # Memory per node
# #SBATCH --time=01:00:00            # Time limit (HH:MM:SS)
# #SBATCH --array=1-5                # Array job, run 5 tasks
# 
# # Define start and end indices for each task
# start_indices=(1 11 21 31 41)
# end_indices=(10 20 30 40 50)
# 
# # Get the array task ID (1 to 5)
# task_id=$SLURM_ARRAY_TASK_ID
# 
# # Run the R script with the corresponding start and end indices
# Rscript ~/project_directory/scripts/run_model.R ${start_indices[$((task_id-1))]} ${end_indices[$((task_id-1))]}
# 
# 
