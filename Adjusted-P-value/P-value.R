# This script was run on GO data. 
# It can be applied to any dataset that contains p-values and requires conversion to adjusted p-values.

# Install required packages (only needed once)
install.packages("readxl")
install.packages("dplyr")

# Load packages
library(readxl)
library(dplyr)


# Read the Excel file 

GOSEQ_PathResults <- read_excel("GOSEQ_PathResults.xlsx")

# Rename the p-value column for easier handling
GOSEQ_PathResults <- GOSEQ_PathResults %>%
  rename(p_value = `p-value`)

# Calculate adjusted p-values using Benjamini-Hochberg method (FDR)
GOSEQ_PathResults$adj_p_value <- p.adjust(GOSEQ_PathResults$p_value, method = "BH")

#Saving the file with the adjusted_pvalues this is the new file name: go_with_adjusted_pvalues.txt

write.table(GOSEQ_PathResults, "go_with_adjusted_pvalues.txt", sep = "\t", row.names = FALSE, quote = FALSE)


##If you want to filter it, you can use R

# Filter GO terms with adjusted p-value less than 0.05
filtered_go <- GOSEQ_PathResults %>%
  filter(adj_p_value < 0.05)

# Save the filtered results to a text file
write.table(filtered_go, "filtered_go_terms.txt", sep = "\t", row.names = FALSE, quote = FALSE)

# Optional: View the filtered table in the RStudio viewer
View(filtered_go)
