
#BiocManager::install(c("clusterProfiler", "org.Hs.eg.db", "enrichplot", "ggplot2"))

library(clusterProfiler)
library(org.Hs.eg.db)  # Use appropriate organism database (e.g., org.Mm.eg.db for mice)
library(enrichplot)
library(ggplot2)
#genes_of_interest <- c("TET2", "FUT2", "BAMBI", "POLE", "MLH1", "MSH2", "MUTYH", "APC", "BRCA1", "BRIP1")  # test genes
genes_of_interest <- read.table("gene_list.txt") ##the gene list
genes_of_interest <- genes_of_interest$V1  # Convert from data frame to vector
genes_of_interest <- trimws(genes_of_interest)  # Remove leading/trailing spaces
valid_symbols <- keys(org.Hs.eg.db, keytype = "SYMBOL")
sum(genes_of_interest %in% valid_symbols)
##if some genes are missing, try to find other names
missing_genes <- genes_of_interest[!(genes_of_interest %in% valid_symbols)]
missing_genes
alias_info <- AnnotationDbi::select(org.Hs.eg.db, keys = "COLCA2", keytype = "SYMBOL", columns = c("SYMBOL", "ALIAS"))
print(alias_info)

####################
entrez_ids <- bitr(genes_of_interest, fromType="SYMBOL", toType="ENTREZID", OrgDb=org.Hs.eg.db)
gene_list <- entrez_ids$ENTREZID
ego <- enrichGO(gene          = gene_list,
                OrgDb         = org.Hs.eg.db,
                keyType       = "ENTREZID",
                ont           = "BP",  # BP: Biological Process, MF: Molecular Function, CC: Cellular Component
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.05,
                qvalueCutoff  = 0.05)
library(dplyr)

df <- as.data.frame(ego)

# Define custom size categories for "Count"
df$size_category <- cut(df$Count, 
                        breaks = c(0, 1, 5, 10, 15, Inf), 
                        labels = c("1", "2-5", "6-10", "11-15", ">15"),
                        include.lowest = TRUE)

# Convert to factor (needed for scale_size_manual)
df$size_category <- factor(df$size_category, levels = c("1", "2-5", "6-10", "11-15", ">15"))

# Loop through each row in df and process the GO terms
# Add a new column of converted gene symbols
df$Converted_Genes <- sapply(df$geneID, function(id_string) {
  
  # Split the Entrez Gene IDs
  entrez_ids_list <- strsplit(id_string, split = "/")[[1]]
  
  # Convert Entrez Gene IDs to Gene Symbols
  converted <- tryCatch({
    bitr(entrez_ids_list, fromType = "ENTREZID", toType = "SYMBOL", OrgDb = org.Hs.eg.db)
  }, error = function(e) return(NULL))
  
  # If successful, collapse into a comma-separated string
  if (!is.null(converted)) {
    return(paste(converted$SYMBOL, collapse = ","))
  } else {
    return(NA)
  }
})


# View the updated df
head(df)
goplot(ego)  ##connected plot

write.table(df, "GO_analysis.tsv", sep='\t', row.names = F)

# Extract the row for the specific GO term (adjust term as needed)
specific_GO_term <- subset(ego@result, ID == "GO:1902893")  # Use the actual GO term ID

# Extract gene symbols associated with this GO term
genes_in_GO_term <- specific_GO_term$geneID
print(genes_in_GO_term)
# Split the gene IDs by "/"
entrez_ids_list <- strsplit(genes_in_GO_term, split = "/")[[1]]

# Check the result
print(entrez_ids_list)

converted_genes <- bitr(entrez_ids_list, fromType = "ENTREZID", toType = "SYMBOL", OrgDb = org.Hs.eg.db)

# View the result
print(converted_genes)


# Plot with manually categorized bubble sizes
ggplot(df, aes(x = GeneRatio, y = Description, size = size_category, color = p.adjust)) +
  geom_point() +
  scale_size_manual(name = "Gene Count", 
                    values = c(2, 4, 6, 8, 10)) +  # Ensure values correspond to factor levels
  scale_color_gradient(low = "green", high = "purple") +
  labs(title = "Top 15 Enriched GO Terms", x = "Gene Ratio", y = "GO Term") +
  theme_minimal()
