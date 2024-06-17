library(dplyr)

# Create results directory if it doesn't exist
if (!dir.exists("~/project_directory/results")) {
    dir.create("~/project_directory/results")
}

# Read in the data
phenotype <- read.csv("~/project_directory/data/phenotype.csv")
cg_matrix <- read.csv("~/project_directory/data/cg_matrix.csv", row.names = 1)


print("Phenotype data:")
print(head(phenotype))
print("CpG matrix data:")
print(head(cg_matrix))

# Function to run the model for a subset of CpGs
run_model <- function(start_idx, end_idx) {
    print(paste("Running model for CpGs", start_idx, "to", end_idx))
    results <- data.frame(cpg = character(), coef = numeric(), p_value = numeric(), stringsAsFactors = FALSE)
    
    for (i in start_idx:end_idx) {
        cpg <- rownames(cg_matrix)[i]
        cpg_vector <- as.vector(t(cg_matrix[cpg, ]))  # Convert to vector
        model <- lm(phenotype$lung_function ~ cpg_vector + phenotype$age + phenotype$gender + phenotype$cell_counts + phenotype$race)
        summary_model <- summary(model)
        
        results <- rbind(results, data.frame(
            cpg = cpg,
            coef = summary_model$coefficients[2, "Estimate"],
            p_value = summary_model$coefficients[2, "Pr(>|t|)"]
        ))
    }
    
    write.csv(results, paste0("~/project_directory/results/results_", start_idx, "_", end_idx, ".csv"), row.names = FALSE)
    print(paste("Results saved for CpGs", start_idx, "to", end_idx))
}

# Get command-line arguments
args <- commandArgs(trailingOnly = TRUE)
start_idx <- as.numeric(args[1])
end_idx <- as.numeric(args[2])

# Call the function with command-line arguments
run_model(start_idx, end_idx)
