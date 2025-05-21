##This script takes the file names provided by Gentayne to my new ID, as outlined in the relevant File Renaming excel sheet. 
##The reason for this is that the Gentayne labels are not sufficient to distinguish JD samples - the row and position of the tree is needed as well.


#If packages not installed, run code below:
install.packages("readxl")
install.packages("fs")

#Loading packages
library(readxl)
library(fs)

# Path to the Excel with renaming columns, and folder with CEL files to be renamed
excel_path <- "C:/Users/curly/Desktop/Apple Genotyping/Genotyping Data/File Naming.xlsx"
file_dir <- "C:/Users/curly/Desktop/Apple Genotyping/Genotyping Data/JD Apple Genotype Data"

# Read Excel file
rename_df <- read_excel(excel_path)

# Loop through each row and rename the files
for(i in seq_len(nrow(rename_df))){ 
  old_name <- rename_df$Old[i] 
  new_name <- rename_df$New[i] 
  
  old_path <- file.path(file_dir, old_name)
  new_path <- file.path(file_dir, new_name)
  
  if (file_exists(old_path)) {
    file_move(old_path, new_path)
    message(paste("Renamed:", old_name, "->", new_name))
  } else {
    warning(paste("File not found:", old_name))
  }
}