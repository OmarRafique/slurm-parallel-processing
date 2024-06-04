#!/bin/bash

# Define the start and end indices for each run
start_indices=(1 11 21 31 41)
end_indices=(10 20 30 40 50)

# Loop through the indices and run the R script with the appropriate arguments in parallel
for i in ${!start_indices[@]}; do
    Rscript ~/project_directory/scripts/run_model.R ${start_indices[$i]} ${end_indices[$i]} &
done

# Wait for all background jobs to complete
wait




# #!/bin/bash
# 
# # Define the start and end indices for each run
# start_indices=(1 11 21 31 41)
# end_indices=(10 20 30 40 50)
# 
# # Loop through the indices and run the R script with the appropriate arguments
# for i in ${!start_indices[@]}; do
#     Rscript ~/project_directory/scripts/run_model.R ${start_indices[$i]} ${end_indices[$i]}
# done
# 
