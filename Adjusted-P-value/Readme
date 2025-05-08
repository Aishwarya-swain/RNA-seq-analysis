# P-Value Adjustment Script

This R script processes GO annotation results by adjusting raw p-values using the Benjamini-Hochberg False Discovery Rate (FDR) method. It also provides an option to filter significant GO terms based on an adjusted p-value threshold.

## 📄 Description

- **Input**: 
  - An Excel file (`.xlsx`) with a `p-value` column.
  - A tab-delimited text file (`.txt` or `.tsv`) with a `p-value` column.
- **Output**:
  - `go_with_adjusted_pvalues.txt`: Original data with an added column for adjusted p-values.
  - `filtered_go_terms.txt`: Subset of GO terms with `adj_p_value < 0.05`.

## ✅ Requirements

Make sure the following R packages are installed:

```r
install.packages("readxl")
install.packages("dplyr")
