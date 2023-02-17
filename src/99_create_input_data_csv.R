# 99_create_input_data_csv.R ----------------------------------------------
## so we don't have to worry about directory maddness
library(here)

## filenames for easier iteration/testing 
infile <- here("data", "loan_200k_raw.csv") # original 
outfile <- here("data", "loan_200k.csv") # all 200k rows
outfile_201 <- here("data", "loan_201.csv") # only first 201 rows

## load csv into dataframe and sanity check 
data_raw <- read.csv(file = infile)
names(data_raw)

## remove column that MSSQL Server fusses about
## save output for writing to csv file 
data_out <- data_raw[, !names(data_raw) %in% c("default")]
names(data_out)

## create second dataframe of only 201 rows for testing / demo purposes 
data_out_201 <- data_out[1:201,]
nrow(data_out_201)

## save data - 200k rows
write.csv(data_out,
          file = outfile,
          row.names = FALSE)

## save data - 201 rows
write.csv(data_out_201,
          file = outfile_201,
          row.names = FALSE)