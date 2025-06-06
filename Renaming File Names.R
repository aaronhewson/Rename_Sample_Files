##This script renames filenames, as per the relevant File Naming excel sheet. This is needed prior to genotyping, and then also prior to B Allele Frequency plotting.

#If packages not installed, run code below:
install.packages("readxl")
install.packages("fs")

#Loading packages
library(readxl)
library(fs)


## Renaming sample filenames for genotyping. This ensures filenames are specific enough to distinguish samples.

# Path to the Excel with renaming columns, and folder with .CEL genotype files to be renamed
excel_path <- "File Naming.xlsx"
file_dir <- "C:/Users/curly/Desktop/Apple Genotyping/Inputs/Genotype Files/Aggregate Samples"

# Read Excel file
rename_df <- read_excel(excel_path)

# Loop through each row and rename the genotyping files
for(i in seq_len(nrow(rename_df))){ 
  old_name <- rename_df$Gen_Old[i] 
  new_name <- rename_df$Gen_New[i] 
  
  old_path <- file.path(file_dir, old_name)
  new_path <- file.path(file_dir, new_name)
  
  if (file_exists(old_path)) {
    file_move(old_path, new_path)
    message(paste("Renamed:", old_name, "->", new_name))
  } else {
    warning(paste("File not found:", old_name))
  }
}


##Renaming CNV Files
# Path to the Excel with renaming columns, and folder with .txt CNV files to be renamed
excel_path <- "File Naming.xlsx"
file_dir <- "C:/Users/curly/Desktop/Apple Genotyping/Results/B Allele Frequencies/Axiom CNV Output Files"

# Read Excel file
rename_df <- read_excel(excel_path)

# Loop through each row and rename the CNV files
for(i in seq_len(nrow(rename_df))){ 
  old_name <- rename_df$CNVOld[i] 
  new_name <- rename_df$CNVNew[i] 
  
  old_path <- file.path(file_dir, old_name)
  new_path <- file.path(file_dir, new_name)
  
  if (file_exists(old_path)) {
    file_move(old_path, new_path)
    message(paste("Renamed:", old_name, "->", new_name))
  } else {
    warning(paste("File not found:", old_name))
  }
}


