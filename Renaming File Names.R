# Rename sample files, according to the "File Naming" Excel sheet. 
# This is needed for .CEL files received from genotyping, which are previously named based on genotyping well. These are renamed to Sample IDs.
# This is also needed for .CNV files produced by Axiom CNV Tool, which amends files with ".nexus.cnv.txt". These are renamed to only have ".txt" as the suffix.


# Load Packages -----------------------------------------------------------

#Loading packages
library(readxl)
library(fs)

# Rename .CEL Sample Files Prior to Genotyping ----------------------------

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


# Rename CNV Files from Axiom ---------------------------------------------

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


