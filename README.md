# slurm-parallel-processing
Slurm parallel processing example. Includes a toy methylation dataset and linear regression model code. 

_________________________________________________________________________________________

slurm_new.sh

This is the main file that executes the code parallely on different nodes of the cluster. 

Run this as:

sbatch slurm_new.sh

squeue -u \<user-name\>

The results will be saved in 'results' folder.
The logs will be saved in the 'slurm_logs.sh' folder.

Running this file is sufficient to get started with parallel processing with Slurm. 

_________________________________________________________________________________________
#test_slurm.sh
This is just a basic slurm code that chekcs if slurm is working.

_________________________________________________________________________________________
#sshell.sh

run this using:

chmod +x sshell

./sshell.sh


This basically automates the submission of jobs. 
Using the symbol '&' to make things parallel on the same CPU but is not used to get another CPU or node.

_______________________________________________________________________________________
create_slurm_jobs.sh

This is used to automate the creation of slurm jobs. Does not work.

chmod +x create_slurm_jobs.sh

./create_slurm_jobs.sh


cd ~/project_directory/slurm_jobs
for job in *.slurm; do
  sbatch $job
done
_________________________________________________________________________________________
