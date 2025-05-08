# Load required libraries
library(ggplot2)
library(readxl)
library(ggrepel)
library(dplyr)

# Load data
GENECOUNTS_ABH <- read_excel("GENECOUNTS .xlsx")
de_genes <- data.frame(GENECOUNTS_ABH)
de_genes$diffexpressed <- "NO"

# Mark up/down-regulated genes
de_genes$diffexpressed[de_genes$logFC >= 1 & de_genes$adj.P.Val <= 0.05] <- "UP"
de_genes$diffexpressed[de_genes$logFC <= -1 & de_genes$adj.P.Val <= 0.05] <- "DOWN"

# Label top 10 genes
de_genes$SYMBOL <- de_genes$GeneID
thresh <- head(arrange(de_genes, adj.P.Val), 10)$adj.P.Val[10]
de_genes$delabel <- NA
de_genes$delabel[de_genes$adj.P.Val <= thresh] <- de_genes$SYMBOL[de_genes$adj.P.Val <= thresh]

# Create volcano plot and save as PNG
volcano_plot <- ggplot(data = de_genes, aes(x = logFC, y = -log10(adj.P.Val), col = diffexpressed, label = delabel)) +
  geom_point() +
  theme_minimal() +
  geom_text_repel() +
  scale_colour_manual(values = c('blue', 'black', 'red')) +
  theme(text = element_text(size = 20)) +
  labs(x = "Log Fold Change", y = "-Log10 Adjusted P-Value")

ggsave("volcano_plot.png", plot = volcano_plot, width = 10, height = 8, dpi = 300)
