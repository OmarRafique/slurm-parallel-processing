
# Create toy data.
set.seed(123)

# Phenotype data
subject_ID <- paste0("subject_", 1:100)
lung_function <- rnorm(100, mean=80, sd=10)
age <- sample(20:80, 100, replace = TRUE)
gender <- sample(c("Male", "Female"), 100, replace = TRUE)
cell_counts <- rnorm(100, mean=5, sd=1)
race <- sample(c("Race1", "Race2", "Race3"), 100, replace = TRUE)

phenotype <- data.frame(subject_ID, lung_function, age, gender, cell_counts, race)
write.csv(phenotype, "data/phenotype.csv", row.names = FALSE)

# CpG matrix
cpg_matrix <- matrix(rnorm(1000 * 100), nrow = 1000, ncol = 100)
colnames(cpg_matrix) <- subject_ID
rownames(cpg_matrix) <- paste0("cpg", 1:1000)
write.csv(cpg_matrix, "data/cg_matrix.csv", row.names = TRUE)
