library(here)

infile <- here("data", "loan_200k.csv")
outfile <- here("data", "loan_200.csv")
outfile_201 <- here("data", "loan_201.csv")

data_raw <- read.csv(file = infile)
names(data_raw)

data_out <- data_raw[, !names(data_raw) %in% c("default")]
names(data_out)

write.csv(data_out,
          file = outfile,
          row.names = FALSE)

data_out_201 <- data_out[1:200,]
nrow(data_out_201)

write.csv(data_out_201,
          file = outfile_201,
          row.names = FALSE)