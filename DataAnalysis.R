# Load the tidyverse package
library(tidyverse)
# Load the readr package
library(readr)

# Read the CSV file with a comma delimiter
df <- read_csv("bank.csv")

# Read the CSV file with a semi-colon delimiter
# df <- read_delim("bank.csv", delim = ";")

# Check for missing values in the data frame
print(paste('Missing = ', sum(is.na(df)))) # paste concatenates the string

# Get the locations of the missing values
missing_locations <- which(is.na(df), arr.ind = TRUE)

# Check if missing_locations is not NULL and has more than 0 rows
if (!is.null(missing_locations) && nrow(missing_locations) > 0) {
  # Loop over each row in missing_locations
  for (i in seq_len(nrow(missing_locations))) {
    # Get the row and column index of the missing value
    row_index <- missing_locations[i, "row"]
    col_index <- missing_locations[i, "col"]
    
    # Get the column name of the missing value
    col_name <- colnames(df)[col_index]
    
    # Get the corresponding value from the 'id' column
    id_value <- df[row_index, "id"]
    
    # Print the column name and the 'id' value
    print(paste("Missing value in column '", col_name, "' at row ", row_index, " with 'id' value ", id_value, sep = ""))
  }
} else {
  print("No missing values found.")
}

# Replaces all missing values depending on which column is missing
df <- df %>%
  replace_na(list(id = 'missing', age = 'missing', job = 'missing', job = "unknown_job", marital = "unknown_marital", 
                  education = "unknown", default = "unknown", contact = "missing_contact", poutcome = "unknown"))

# Replace the column_name value where 'id' equals desired number
df <- df %>%
  mutate(education = ifelse(id == 100, "test_education", education))

# Check the column names of the data frame
print(colnames(df))

# Change all entries in the pdays column
df <- df %>%
  mutate(pdays = ifelse(pdays == 0, -1, pdays))      

# View the updated data frame
print(df)

# Save the updated csv file
write_csv(df, "updated_bank.csv")