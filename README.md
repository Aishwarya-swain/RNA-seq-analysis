# volcano-plot
Generate volcano plot

# Volcano Plot for Differential Gene Expression

This repository contains an R script that generates a volcano plot from differential gene expression data and saves it as a PNG file.

## 🔍 Description

- Input: Excel file containing gene expression results (log fold change and adjusted p-values).
- Output: Volcano plot highlighting significantly up- and down-regulated genes.

## 📦 Requirements

Make sure the following R packages are installed:

```r
install.packages("ggplot2")
install.packages("ggrepel")
install.packages("dplyr")
install.packages("readxl")

