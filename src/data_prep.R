library(here)

infile <- here("data", "loan_200k_raw.csv") # original 
outfile <- here("data", "loan_200k.csv") # all 200k rows
outfile_201 <- here("data", "loan_201.csv") # only first 201 rows

data_raw <- read.csv(file = infile)
names(data_raw)

data_out <- data_raw[, !names(data_raw) %in% c("default")]
names(data_out)

write.csv(data_out,
          file = outfile,
        #   quote = FALSE, # to reduce file size 
          row.names = FALSE)

data_out_201 <- data_out[1:201,]
nrow(data_out_201)

write.csv(data_out_201,
          file = outfile_201,
          row.names = FALSE)